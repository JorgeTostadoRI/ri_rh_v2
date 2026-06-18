import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FingerprintButtonViewmodel extends ChangeNotifier {
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

  Future<bool> registerEntry() async {
    _scanning = true;
    notifyListeners();

    final result = await Future.delayed(const Duration(seconds: 1), () => false);
    _logger.d('registerEntry => $result');
    _scanning = false;
    notifyListeners();

    _setScanResult(result);
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