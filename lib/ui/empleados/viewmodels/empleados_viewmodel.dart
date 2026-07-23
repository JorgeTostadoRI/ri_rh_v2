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
    load = Command1(_load)..execute(null);
  }

  final EmpleadosRepository _empleadosRepository;

  final Logger _log = Logger();
  late final Command1<void, String?> load;

  List<Empleado> _empleados = [];
  List<Empleado> get empleados => _empleados;

  Future<Result<void>> _load(String? search) async {
    final result = await _empleadosRepository.getEmpleados();
    switch (result) {
      case Error():
        _log.w('Failed to load empleados', error: result.error);
        _empleados = [];
      case Ok():
        _empleados = result.value;
        if (search != null && search.isNotEmpty) {
          _empleados = _empleados.where((emp) => emp.nombre.toLowerCase().contains(search.toLowerCase())).toList();
        }
    }
    notifyListeners();
    return result;
  }
}