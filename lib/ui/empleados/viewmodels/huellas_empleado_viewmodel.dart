import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class HuellasEmpleadoViewmodel extends ChangeNotifier {
  HuellasEmpleadoViewmodel({
    required this.empleadoId,
    required this._empleadosRepository,
    required this._fingerprintRepository,
  }) {
    load = Command1(_load)..execute(empleadoId);
    capture = Command1(_capture);
    enroll = Command1(_enroll);
    delete = Command1(_delete);
  }

  final int empleadoId;
  final EmpleadosRepository _empleadosRepository;
  final FingerprintRepository _fingerprintRepository;

  final Logger _log = Logger();
  late final Command1<void, int> load;
  late final Command1<void, Uint8List> capture;
  late final Command1<void, Finger> enroll;
  late final Command1<void, Finger> delete;

  late final Empleado _empleado;
  Empleado get empleado => _empleado;

  late List<Finger> _fingers;
  List<Finger> get rightHandFingers => _fingers.where((finger) => finger.hand == Hand.right).toList();
  List<Finger> get leftHandFingers => _fingers.where((finger) => finger.hand == Hand.left).toList();

  Finger? _selectedFinger;
  set selectedFinger(Finger selection) {
    _selectedFinger = selection;
    _log.d('Set selected finger to $_selectedFinger');
  }
  /// Sets the currently selected finger to null and clears the saved template captures.
  void clearSelectedFinger() {
    _selectedFinger = null;
    _captures.clear();
    _log.d('Cleared finger selection');
  }

  final List<Uint8List> _captures = List.empty(growable: true);
  int get captureCount => 3 - _captures.length;
  StreamSubscription<Uint8List> get capturesSub {
    return _fingerprintRepository.capture()
    .take(3) // Only listen for 3 captures
    .listen(
      (Uint8List template) => capture.execute(template),
      onDone: () => enroll.execute(_selectedFinger!),
      onError: (Object e) {
        _log.e('Failed to capture fingerprint', error: e);
      },
    );
  }

  Future<Result<void>> _load(int empleadoId) async {
    final empleadoResult = await _empleadosRepository.getEmpleado(empleadoId);
    switch (empleadoResult) {
      case Error():
        _log.w('Failed to load empleado #$empleadoId');
        return Result.error(empleadoResult.error);
      case Ok():
        _empleado = empleadoResult.value;
        _fingers = _generateFingersList();
    }

    final fingersResult = await _fingerprintRepository.getFingerprintsOfUser(_empleado.usuario);
    switch (fingersResult) {
      case Error():
        _log.w('Failed to load huellas of empleado #$empleadoId');
        return Result.error(fingersResult.error);
      case Ok():
        for (final finger in fingersResult.value) {
          final index = _fingers.indexWhere((x) => x.hand == finger.hand && x.fingerName == finger.fingerName);
          if (index != -1) {
            _fingers[index] = finger;
          }
        }
    }

    notifyListeners();
    return const Result.ok(null);
  }

  Future<Result<Finger>> _enroll(Finger finger) async {
    final result = await _fingerprintRepository.enroll(finger, _captures);
    switch (result) {
      case Error():
        _log.w('Failed to enroll fingerprint', error: result.error);
      case Ok():
        final index = _fingers.indexOf(finger);
        _fingers[index] = result.value;
    }

    _captures.clear();
    notifyListeners();
    return result;
  }

  Future<Result<void>> _delete(Finger finger) async {
    final result = await _fingerprintRepository.deleteFingerprint(finger.id);
    switch (result) {
      case Error():
        _log.w('Failed to delete fingerprint', error: result.error);
      case Ok():
        final index = _fingers.indexOf(finger);
        _fingers[index] = finger.copyWith(id: 0, scanned: false);
        _log.i('Deleted Finger#${finger.id}');
        notifyListeners();
    }

    return result;
  }

  // Call after _empleado has been set
  List<Finger> _generateFingersList() {
    return [
      Finger(user: _empleado.usuario, hand: Hand.left, fingerName: FingerName.thumb, scanned: false),
      Finger(user: _empleado.usuario, hand: Hand.left, fingerName: FingerName.pointer, scanned: false),
      Finger(user: _empleado.usuario, hand: Hand.left, fingerName: FingerName.middle, scanned: false),
      Finger(user: _empleado.usuario, hand: Hand.left, fingerName: FingerName.ring, scanned: false),
      Finger(user: _empleado.usuario, hand: Hand.left, fingerName: FingerName.pinky, scanned: false),
      Finger(user: _empleado.usuario, hand: Hand.right, fingerName: FingerName.thumb, scanned: false),
      Finger(user: _empleado.usuario, hand: Hand.right, fingerName: FingerName.pointer, scanned: false),
      Finger(user: _empleado.usuario, hand: Hand.right, fingerName: FingerName.middle, scanned: false),
      Finger(user: _empleado.usuario, hand: Hand.right, fingerName: FingerName.ring, scanned: false),
      Finger(user: _empleado.usuario, hand: Hand.right, fingerName: FingerName.pinky, scanned: false),
    ];
  }

  Future<Result<void>> _capture(Uint8List template) async {
    // Validate that this finger has not been registered previously
    if (_captures.isEmpty) {
      final match = _fingerprintRepository.matchFingerprintToUser(template) != null;
      if (match) {
        _captures.clear();
        return Result.error(Exception('This fingerprint is already registered'));
      }
    }

    _captures.add(template);
    notifyListeners();
    return Result.ok(null);
  }
}