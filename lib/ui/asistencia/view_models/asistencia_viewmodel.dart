import 'dart:async';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/avisos/avisos_repository.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/services/api/models/huella/huella_api_model.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AsistenciaViewmodel extends ChangeNotifier {
  AsistenciaViewmodel({
    required this._asistenciaRepository,
    required this._authRepository,
    required this._avisosRepository,
    required this._fingerprintRepository,
  }) {
    load = Command0(_load)..execute();
    scanFingerprint = Command1(_scanFingerprint);
    register = Command1(_register);

    _capturesSub = _fingerprintRepository.capture()
    .listen(
      (template) => scanFingerprint.execute(template),
      onError: (e) {
        _logger.e('Capture stream error', error: e);
      }
    );
  }

  final AsistenciaRepository _asistenciaRepository;
  final AuthRepository _authRepository;
  final AvisosRepository _avisosRepository;
  final FingerprintRepository _fingerprintRepository;

  final Logger _logger = Logger();

  late final Command0 load;
  late final Command1<void, Uint8List> scanFingerprint;
  late final Command1<Asistencia, XFile?>  register;

  final List<String> _fingerNames = ['índice', 'medio', 'anular', 'meñique', 'pulgar'];
  int _fingerIndex = 0;
  String get fingerName => _fingerNames[_fingerIndex];

  late final StreamSubscription<Uint8List> _capturesSub;

  bool _manualEntryEnabled = false;
  bool get manualEntryEnabled => _manualEntryEnabled;

  UserInfo? _userinfo;

  List<Aviso> _motds = [];
  List<Aviso> get motds => _motds;

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    _capturesSub.cancel();
    super.dispose();
  }

  Future<Result<void>> _scanFingerprint(Uint8List template) async {
    final userinfo = _fingerprintRepository.matchFingerprintToUser(template);
    if (userinfo == null) {
      _setNextFingerRetry();
      return Result.error(Exception('Failed to match fingerprint'));
    }

    _userinfo = userinfo;
    return const Result.ok(null);
  }

  Future<Result<Asistencia>> _register(XFile? photo) async {
    final loggedIn = await _authRepository.loginViaChallenge(_userinfo!.username);
    switch(loggedIn) {
      case Ok():
        break;
      case Error():
        return Result.error(Exception('Failed to log in'));
    }

    final result = await _asistenciaRepository.createAsistencia(Asistencia(
      usuario: _userinfo!.id,
      photoFile: photo,
    ));

    switch(result) {
      case Ok():
        _fingerIndex = 0;
        _manualEntryEnabled = false;
        if (!_disposed) notifyListeners();
        _logger.i('Attendance registered for ${_userinfo!.username}');
      case Error():
        _logger.w('Failed to register attendance', error: result.error);
    }

    await _authRepository.logout();
    return result;
  }

  Future<Result<void>> registerManualEntry(String username, String password, XFile photo) async {
    final user = await _authRepository.login(username: username, password: password);
    switch (user) {
      case Ok():
        break;
      case Error():
        return Result.error(user.error);
    }

    final asistencia = Asistencia(
      usuario: user.value.id,
      photoFile: photo,
    );

    final result = await _asistenciaRepository.createAsistencia(asistencia);

    switch(result) {
      case Ok():
        _fingerIndex = 0;
        _manualEntryEnabled = false;
        if (!_disposed) notifyListeners();
        _logger.i('Attendance registered for $username');
      case Error():
        _logger.w('Failed to register attendance');
    }

    await _authRepository.logout();
    return result;
  }

  Future<void> _setNextFingerRetry() async {
    // indicar el siguiente dedo a leer y habilitar registro manual
    int next = (_fingerIndex + 1) % _fingerNames.length;
    _fingerIndex = next;
    if (next == 0) {
      _enableManualRegistration();
    }

    notifyListeners();
  }

  Future<void> _enableManualRegistration() async {
    _manualEntryEnabled = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 10));
    _manualEntryEnabled = false;
    notifyListeners();
  }

  Future<Result<void>> _load() async {
    _fingerprintRepository.loadFingerprints();
    final result = await _avisosRepository.getAvisos(query: DateTime.now());
    switch (result) {
      case Ok():
        _motds = result.value;
      case Error():
        _logger.w('Failed to get messages of the day', error: result.error);
    }

    if (!_disposed) {
      notifyListeners();
    }
    return result;
  }
}