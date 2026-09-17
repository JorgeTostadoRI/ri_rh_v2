import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

typedef PuestoCreateParams = ({String nombre, String tipos});

class NuevoEmpleadoViewmodel extends ChangeNotifier {
  NuevoEmpleadoViewmodel({
    required this._log,
    required this._empleadosRepository,
  }) {
    loadCatalogos = Command0(_loadCatalogos)..execute();
    createPuesto = Command1(_createPuesto);
    create = Command1(_create);
  }

  final AppLogger _log;
  final EmpleadosRepository _empleadosRepository;

  late final Command0 loadCatalogos;
  late final Command1<Puesto, PuestoCreateParams> createPuesto;
  late final Command1<Empleado, EmpleadoCreateParams> create;

  List<Puesto> _puestos = [];
  List<Puesto> get puestos => _puestos;

  List<Departamento> _departamentos = [];
  List<Departamento> get departamentos => _departamentos;

  Future<Result<void>> _loadCatalogos() async {
    final resultPuestos = await _empleadosRepository.getPuestos();
    switch (resultPuestos) {
      case Error():
        _log.warning('Failed to load puestos', error: resultPuestos.error);
        return Result.error(resultPuestos.error);
      case Ok():
    }

    final resultDepartamentos = await _empleadosRepository.getDepartamentos();
    switch (resultDepartamentos) {
      case Error():
        _log.warning('Failed to load departamentos', error: resultDepartamentos.error);
        return Result.error(resultDepartamentos.error);
      case Ok():
    }

    _puestos = resultPuestos.value;
    _departamentos = resultDepartamentos.value;
    notifyListeners();
    return const Result.ok(null);
  }

  Future<Result<Puesto>> _createPuesto(PuestoCreateParams params) async {
    final result = await _empleadosRepository.createPuesto(params.nombre, params.tipos);
    switch (result) {
      case Error():
        _log.warning('Failed to create puesto', error: result.error);
        return Result.error(result.error);
      case Ok():
    }
    _puestos = [..._puestos, result.value];
    notifyListeners();
    return Result.ok(result.value);
  }

  Future<Result<Empleado>> _create(EmpleadoCreateParams params) async {
    final result = await _empleadosRepository.createEmpleado(params);
    switch (result) {
      case Error():
        _log.warning('Failed to create empleado', error: result.error);
        return Result.error(result.error);
      case Ok():
    }
    return Result.ok(result.value);
  }
}
