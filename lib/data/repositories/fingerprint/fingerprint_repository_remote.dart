import 'dart:convert';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/huella/huella_api_model.dart';
import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/utils/result.dart';

class FingerprintRepositoryRemote extends FingerprintRepository {
  FingerprintRepositoryRemote({
    required this._fingerScanService,
    required this._apiClient,
  });

  final FingerScanService _fingerScanService;
  final ApiClient _apiClient;

  final Logger _log = Logger();

  final Map<int, (int, String)> _fidMap = {};

  bool _initialized = false;

  @override
  Stream<Uint8List> capture() {
    return _fingerScanService.captureStream();
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
    if (_initialized) return;

    final result = await _apiClient.getHuellas();
    _initialized = true;
    switch (result) {
      case Error():
        _log.w('Failed to obtain fingerprints from API');
        return;
      case Ok():
        for (final huella in result.value) {
          final template = base64.decode(huella.template);
          _fingerScanService.add(template, huella.id!);
          _fidMap[huella.id!] = (huella.userInfo!.id, huella.userInfo!.username);
        }
    }
  }

  @override
  Future<Result<List<Finger>>> getFingerprintsOfUser(int id) async {
    final getResult = await _apiClient.getHuellas();
    switch (getResult) {
      case Error():
        return Result.error(getResult.error);
      case Ok():
        // TODO: use query param
        final huellas = getResult.value.where((huella) => huella.usuario == id);
        final fingers = huellas.map((huella) => Finger(
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
    return await _apiClient.deleteHuella(id);
  }

  @override
  Future<Result<Finger>> enroll(Finger finger, List<Uint8List> templates) async {
    if (templates.length < 3) {
      throw Exception('3 templates are needed for enrollment');
    }

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
        _fingerScanService.add(merged, huella.id!);
        final fingerWithValues = finger.copyWith(
          id: postResult.value.id!,
          scanned: true,
        );
        return Result.ok(fingerWithValues);
    }
  }
}