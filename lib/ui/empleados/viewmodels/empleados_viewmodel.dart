import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class EmpleadosViewmodel extends ChangeNotifier {
  EmpleadosViewmodel({
    required this._log,
    required this._empleadosRepository,
  }) {
    load = Command0(_load)..execute();
  }

  final EmpleadosRepository _empleadosRepository;

  final AppLogger _log;
  late final Command0 load;

  List<Empleado> _empleados = [];
  List<Empleado> get empleados => _empleados;

  String searchText = '';

  Future<Result<void>> _load() async {
    _log.debug('Search empleados: $searchText');
    final result = await _empleadosRepository.getEmpleados();
    switch (result) {
      case Error():
        _log.warning('Failed to load empleados', error: result.error);
        _empleados = [];
      case Ok():
        _empleados = result.value;
        if (searchText.isNotEmpty) {
          _empleados = _empleados.where((emp) => emp.base.nombre.toLowerCase().contains(searchText.toLowerCase())).toList();
        }
    }
    notifyListeners();
    return result;
  }
}