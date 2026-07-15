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
    delete = Command1(_delete);
    _fingers = _generateFingersList();
  }

  final int empleadoId;
  final EmpleadosRepository _empleadosRepository;
  final FingerprintRepository _fingerprintRepository;

  final Logger _log = Logger();
  late final Command1<void, int> load;
  late final Command1<void, Finger> delete;
  late final Empleado _empleado;
  Empleado get empleado => _empleado;
  List<Finger> _fingers = [];
  List<Finger> get rightHandFingers => _fingers.where((finger) => finger.hand == Hand.right).toList();
  List<Finger> get leftHandFingers => _fingers.where((finger) => finger.hand == Hand.left).toList();

  Future<Result<void>> _load(int empleadoId) async {
    final empleadoResult = await _empleadosRepository.getEmpleado(empleadoId);
    switch (empleadoResult) {
      case Error():
        _log.w('Failed to load empleado #$empleadoId');
        return Result.error(empleadoResult.error);
      case Ok():
        _empleado = empleadoResult.value;
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

  List<Finger> _generateFingersList() {
    return [
      Finger(id: 0, hand: Hand.left, fingerName: FingerName.thumb, scanned: false),
      Finger(id: 0, hand: Hand.left, fingerName: FingerName.pointer, scanned: false),
      Finger(id: 0, hand: Hand.left, fingerName: FingerName.middle, scanned: false),
      Finger(id: 0, hand: Hand.left, fingerName: FingerName.ring, scanned: false),
      Finger(id: 0, hand: Hand.left, fingerName: FingerName.pinky, scanned: false),
      Finger(id: 0, hand: Hand.right, fingerName: FingerName.thumb, scanned: false),
      Finger(id: 0, hand: Hand.right, fingerName: FingerName.pointer, scanned: false),
      Finger(id: 0, hand: Hand.right, fingerName: FingerName.middle, scanned: false),
      Finger(id: 0, hand: Hand.right, fingerName: FingerName.ring, scanned: false),
      Finger(id: 0, hand: Hand.right, fingerName: FingerName.pinky, scanned: false),
    ];
  }
}