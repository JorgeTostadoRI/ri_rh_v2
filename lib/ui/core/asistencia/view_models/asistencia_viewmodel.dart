import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AsistenciaViewmodel extends ChangeNotifier {
  AsistenciaViewmodel({
    required AsistenciaRepository asistenciaRepository,
  }) : _asistenciaRepository = asistenciaRepository;

  AsistenciaRepository _asistenciaRepository;

  final Logger _logger = Logger();

  final List<String> _fingerNames = ['índice', 'medio', 'anular', 'meñique', 'pulgar'];
  int _fingerIndex = 0;
  String get fingerName => _fingerNames[_fingerIndex];

  bool _scanning = false;
  bool get scanning => _scanning;

  bool? _scanResult;
  bool? get scanResult => _scanResult;

  bool _manualEntryEnabled = false;
  bool get manualEntryEnabled => _manualEntryEnabled;

  Future<Result<void>> registerEntry() async {
    _scanning = true;
    notifyListeners();

    // TODO: conectar con escaner
    final fingerprintResult = await Future.delayed(const Duration(seconds: 1), () => 7);

    final asistencia = Asistencia(
      empleado: fingerprintResult,
    );

    final result = await _asistenciaRepository.createAsistencia(asistencia);
    _logger.d('registerEntry => $result');
    _scanning = false;
    notifyListeners();

    switch(result) {
      case Ok():
        _setScanResult(true);
      case Error():
        _setScanResult(false);
    }
    return result;
  }

  Future<void> _setScanResult(bool result) async {
    if (!result) {
      // indicar el siguiente dedo a leer y habilitar registro manual
      int next = (_fingerIndex + 1) % _fingerNames.length;
      _fingerIndex = next;
      if (next == 0) {
        _enableManualRegistration();
      }
    } else {
      _fingerIndex = 0;
      _manualEntryEnabled = false;
    }

    _scanResult = result;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _scanResult = null;
    notifyListeners();
  }

  Future<void> _enableManualRegistration() async {
    _manualEntryEnabled = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 10));
    _manualEntryEnabled = false;
    notifyListeners();
  }
}