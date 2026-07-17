import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class ExpedienteViewmodel extends ChangeNotifier {
  ExpedienteViewmodel({
    required this.empleadoId,
    required this._empleadosRepository,
  }) {
    load = Command1(_load)..execute(empleadoId);
  }

  final int empleadoId;
  final EmpleadosRepository _empleadosRepository;
  final Logger _log = Logger();

  late final Command1<Empleado, int> load;
  late Empleado _empleado;
  Empleado get empleado => _empleado;

  Future<Result<Empleado>> _load(int id) async {
    final result = await _empleadosRepository.getEmpleado(id);
    switch (result) {
      case Error():
        _log.w('Failed to load empleado data');
      case Ok():
        _empleado = result.value;
    }
    notifyListeners();
    return result;
  }
}