import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:ri_rh_v2/config/app_error.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/huella/huella_api_model.dart';
import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/utils/result.dart';

class FingerprintRepositoryRemote extends FingerprintRepository {
  FingerprintRepositoryRemote({
    required this._log,
    required this._fingerScanService,
    required this._apiClient,
  });

  static const _refreshInterval = Duration(minutes: 3);
  // Una huella debe faltar en 3 sincronizaciones seguidas (~9 min con el
  // intervalo de arriba) antes de darla de baja localmente.
  static const _missingSyncStreakToDelete = 3;
  // Evita golpear la red de nuevo si loadFingerprints() se llama varias
  // veces seguidas en muy poco tiempo (ej. una pantalla que se reconstruye
  // a medio flujo y crea una instancia extra del viewmodel, que también
  // llama loadFingerprints() en su constructor).
  static const _minSyncInterval = Duration(seconds: 5);

  final FingerScanService _fingerScanService;
  final ApiClient _apiClient;

  final AppLogger _log;

  final Map<int, (int, String)> _fidMap = {};
  final Map<int, int> _missingSyncStreak = {};
  Set<int> _knownFids = {};

  Timer? _refreshTimer;
  DateTime? _lastSyncAttempt;

  @override
  Stream<Scan> capture() {
    try {
      return _fingerScanService.captureStream();
    } on NoScannerAvailable {
      return Stream<Scan>.error(NoScannerAvailable());
    }
  }

  @override
  UserInfo? matchFingerprintToUser(Uint8List template) {
    final fid = _fingerScanService.identify(template);
    final match = _fidMap[fid];
    if (match == null) return null;
    return UserInfo(id: match.$1, username: match.$2);
  }

  @override
  Future<void> loadFingerprints() async {
    final now = DateTime.now();
    if (_lastSyncAttempt == null || now.difference(_lastSyncAttempt!) >= _minSyncInterval) {
      _lastSyncAttempt = now;
      await _syncFingerprints();
    }
    // Se reintenta periódicamente (no solo una vez al abrir la pantalla) para
    // que una falla de red momentánea al arrancar se resuelva sola, y para
    // que huellas dadas de alta/eliminadas desde otra sesión también se
    // reflejen aquí sin tener que reiniciar la app.
    _refreshTimer ??= Timer.periodic(_refreshInterval, (_) => _syncFingerprints());
  }

  Future<void> _syncFingerprints() async {
    final result = await _apiClient.getHuellas();
    switch (result) {
      case Error():
        _log.warning('FingerprintRepository | Failed to sync fingerprints from API, will retry', error: result.error);
        return;
      case Ok():
        final freshFids = <int>{};
        for (final huella in result.value) {
          final fid = huella.id!;
          freshFids.add(fid);
          final template = base64.decode(huella.template);
          _fingerScanService.add(template, fid);
          _fidMap[fid] = (huella.userInfo!.id, huella.userInfo!.username);
          // Volvió a aparecer (pudo haber faltado en un ciclo anterior por
          // una respuesta incompleta) — ya no cuenta como sospechosa.
          _missingSyncStreak.remove(fid);
        }

        if (_knownFids.isNotEmpty && freshFids.isEmpty) {
          // Una respuesta vacía después de haber tenido huellas reales es
          // casi seguro un problema de red/backend, no que se hayan borrado
          // todas de golpe. Se ignora por completo este ciclo.
          _log.warning('FingerprintRepository | Sync returned an empty list unexpectedly, skipping');
          return;
        }

        for (final missingFid in _knownFids.difference(freshFids)) {
          final streak = (_missingSyncStreak[missingFid] ?? 0) + 1;
          if (streak < _missingSyncStreakToDelete) {
            // Pudo faltar por una sincronización incompleta/con problemas de
            // red: se le da el beneficio de la duda varias veces seguidas
            // antes de eliminarla, para no dejar a nadie sin poder registrar
            // su huella por un solo hipo de red.
            _missingSyncStreak[missingFid] = streak;
            continue;
          }
          _fingerScanService.delete(missingFid);
          _fidMap.remove(missingFid);
          _missingSyncStreak.remove(missingFid);
        }

        _knownFids = freshFids;
    }
  }

  @override
  Future<Result<List<Finger>>> getFingerprintsOfUser(int id) async {
    final resultHuellas = await _apiClient.getHuellas(userId: id);
    switch (resultHuellas) {
      case Error():
        return Result.error(resultHuellas.error);
      case Ok():
        final fingers = resultHuellas.value.map((huella) => Finger(
          id: huella.id!,
          user: huella.usuario,
          hand: Hand.fromString(huella.hand),
          fingerName: FingerName.fromString(huella.finger),
          scanned: true,
        )).toList();
        return Result.ok(fingers);
    }
  }

  @override
  Future<Result<void>> deleteFingerprint(int id) async {
    final result = await _apiClient.deleteHuella(id);
    switch (result) {
      case Error():
        _log.warning('FingerprintRepository | Failed to delete fingerprint', error: result.error);
        return result;
      case Ok():
        _fidMap.remove(id);
        _knownFids.remove(id);
        _missingSyncStreak.remove(id);
        _fingerScanService.delete(id);
        return result;
    }
  }

  @override
  Future<Result<Finger>> enroll(Finger finger, List<Uint8List> templates) async {
    if (templates.length < 3) {
      return Result.error(Exception('3 templates are needed for enrollment'));
    }

    try {
      final merged = _fingerScanService.merge(templates[0], templates[1], templates[2]);
      final huella = HuellaApiModel(
        template: base64.encode(merged),
        hand: finger.hand.apiValue,
        finger: finger.fingerName.apiValue,
        usuario: finger.user,
      );
      final postResult = await _apiClient.postHuella(huella);
      switch (postResult) {
        case Error():
          return Result.error(postResult.error);
        case Ok():
          _fingerScanService.add(merged, postResult.value.id!);
          _fidMap[postResult.value.id!] = (postResult.value.usuario, postResult.value.userInfo!.username);
          _knownFids.add(postResult.value.id!);
          final fingerWithValues = finger.copyWith(
            id: postResult.value.id!,
            scanned: true,
          );
          return Result.ok(fingerWithValues);
      }
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}