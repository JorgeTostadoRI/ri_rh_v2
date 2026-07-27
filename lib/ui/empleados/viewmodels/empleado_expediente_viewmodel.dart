import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class EmpleadoExpedienteViewmodel extends ChangeNotifier {
  EmpleadoExpedienteViewmodel({
    required this.empleadoId,
    required this._log,
    required this._empleadosRepository,
  }) {
    load = Command1(_load)..execute(empleadoId);
  }

  final int empleadoId;
  final EmpleadosRepository _empleadosRepository;
  final AppLogger _log;

  late final Command1<Empleado, int> load;
  late Empleado _empleado;
  Empleado get empleado => _empleado;

  Future<Result<Empleado>> _load(int id) async {
    final result = await _empleadosRepository.getEmpleado(id);
    switch (result) {
      case Error():
        _log.warning('Failed to load empleado expediente', error: result.error);
      case Ok():
        _empleado = result.value;
    }
    notifyListeners();
    return result;
  }
}