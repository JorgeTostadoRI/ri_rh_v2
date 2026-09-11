import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/config/app_error.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia/incidencia_query.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/fingerprint_login_controller.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:url_launcher/url_launcher.dart';

typedef DownloadParams = ({Incidencia incidencia, bool force});

class MisIncidenciasViewmodel extends ChangeNotifier implements FingerprintLoginController {
  MisIncidenciasViewmodel({
    required this._log,
    required this._authRepository,
    required this._incidenciasRepository,
    required this._fingerprintRepository,
  }) {
    login = Command1(_login);
    load = Command0(_load);
    download = Command1(_download);

    // Warms up the fingerprint match cache; without this, scans never
    // resolve to a user unless the Ingreso screen was visited first.
    _fingerprintRepository.loadFingerprints();

    _capturesSub = _fingerprintRepository.capture()
    .listen(
      (scan) {
        // The scanner keeps emitting capture events for as long as the
        // finger stays on the sensor; without this debounce every single
        // one of those events re-triggers a full login attempt.
        final now = DateTime.now();
        if (_lastScanAt != null && now.difference(_lastScanAt!) < _scanDebounce) {
          return;
        }
        _lastScanAt = now;
        login.execute(scan.template);
      },
      onError: (e) {
        _log.error('MisIncidenciasViewmodel | Capture stream error', error: e);
        if (e is NoScannerAvailable) {
          _scannerAvailable = false;
        }
      }
    );
  }

  static const _scanDebounce = Duration(seconds: 2);
  DateTime? _lastScanAt;

  final AppLogger _log;
  final AuthRepository _authRepository;
  final IncidenciasRepository _incidenciasRepository;
  final FingerprintRepository _fingerprintRepository;

  @override
  late Command1<void, Uint8List> login;
  late final Command0 load;
  late final Command1<void, DownloadParams> download;

  late final StreamSubscription<Scan> _capturesSub;
  bool _scannerAvailable = true;
  @override
  bool get scannerAvailable => _scannerAvailable;

  Future<bool> get isAuthenticated => _authRepository.isAuthenticated;

  List<Incidencia>? _incidencias;
  List<Incidencia>? get incidencias => _incidencias;

  @override
  void dispose() {
    _capturesSub.cancel();
    super.dispose();
  }

  void endSession() => _authRepository.logout();

  Future<Result<void>> _login(Uint8List template) async {
    final userinfo = _fingerprintRepository.matchFingerprintToUser(template);
    if (userinfo == null) {
      _log.warning('MisIncidenciasViewmodel | Failed to match fingerprint');
      return Result.error(Exception('Failed to match fingerprint'));
    }

    return _authRepository.loginViaChallenge(userinfo.username);
  }

  Future<Result<void>> _load() async {
    final user = _authRepository.getCurrentUser();
    if (user == null) {
      return Result.error(Exception('Not authenticated'));
    }

    try {
      final query = IncidenciaQuery(solicitores: [user.id]);
      final resultIncidencias = await _incidenciasRepository.getIncidencias(query: query);

      switch (resultIncidencias) {
        case Error():
          _log.warning('MisIncidenciasViewmodel | Failed to fetch incidencias', error: resultIncidencias.error);
          return Result.error(resultIncidencias.error);
        case Ok():
      }

      _incidencias = [...resultIncidencias.value]
        ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      notifyListeners();
      return const Result.ok(null);
    } on Exception catch (e, stackTrace) {
      _log.error('MisIncidenciasViewmodel | Failed to load incidencias', error: e, stackTrace: stackTrace);
      return Result.error(e);
    }
  }

  Future<Result<void>> _download(DownloadParams params) async {
    if (params.incidencia.state != IncidenciaState.approved) {
      return Result.error(Exception('Incidencia is not approved'));
    }

    late final Uri url;
    if (params.incidencia.pdfUrl == null || params.force) {
      final resultPDF = await _incidenciasRepository.generatePDF(params.incidencia, params.force);

      switch (resultPDF) {
        case Error():
          _log.error('MisIncidenciasViewmodel | Failed to generate PDF', error: resultPDF.error);
          return Result.error(resultPDF.error);
        case Ok():
          _log.info('MisIncidenciasViewmodel | Generated PDF for incidencia');
      }

      final incidenciaWithPDF = resultPDF.value;

      if (_incidencias != null) {
        final index = _incidencias!.indexOf(params.incidencia);
        if (index != -1) {
          _incidencias![index] = incidenciaWithPDF;
          notifyListeners();
        }
      }

      url = Uri.parse(incidenciaWithPDF.pdfUrl!);
    } else {
      url = Uri.parse(params.incidencia.pdfUrl!);
    }

    if (!await launchUrl(url)) {
      _log.error('MisIncidenciasViewmodel | Failed to open incidencia PDF');
      return Result.error(Exception('Could not open URL'));
    }

    return const Result.ok(null);
  }
}
