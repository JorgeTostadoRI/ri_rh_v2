import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class EmpleadosViewmodel extends ChangeNotifier {
  EmpleadosViewmodel({
    required this._empleadosRepository,
  }) {
    load = Command0(_load)..execute();
  }

  final EmpleadosRepository _empleadosRepository;

  final Logger _log = Logger();
  late final Command0 load;

  List<Empleado> _empleados = [];
  List<Empleado> get empleados => _empleados;

  Future<Result<void>> _load() async {
    final result = await _empleadosRepository.getEmpleados();
    switch (result) {
      case Error():
        _log.w('Failed to load empleados', error: result.error);
        _empleados = [];
      case Ok():
        _empleados = result.value;
    }
    notifyListeners();
    return result;
  }
}