import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto_params.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class NuevoEmpleadoViewmodel extends ChangeNotifier {
  NuevoEmpleadoViewmodel({
    required this._log,
    required this._empleadosRepository,
  }) {
    loadCatalogos = Command0(_loadCatalogos)..execute();
    createPuesto = Command1(_createPuesto);
    editPuesto = Command1(_editPuesto);
    deletePuesto = Command1(_deletePuesto);
    create = Command1(_create);
  }

  final AppLogger _log;
  final EmpleadosRepository _empleadosRepository;

  late final Command0 loadCatalogos;
  late final Command1<Puesto, PuestoCreateParams> createPuesto;
  late final Command1<Puesto, PuestoEditParams> editPuesto;
  late final Command1<int, int> deletePuesto;
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
    final result = await _empleadosRepository.createPuesto(
      params.nombre,
      params.tipos,
      rol: params.rol,
      responsabilidades: params.responsabilidades,
      departamentoIds: params.departamentoIds,
      preguntas: params.preguntas,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to create puesto', error: result.error);
        return Result.error(result.error);
      case Ok():
    }

    var puesto = result.value;

    // El tabulador se sube en un segundo paso (multipart) una vez que el
    // Puesto ya existe. Si falla, el Puesto igual quedó creado: solo se
    // registra la advertencia en vez de fallar toda la operación (reintentar
    // "Crear" chocaría con el nombre único del puesto).
    final tabulador = params.tabuladorSalarial;
    if (tabulador != null) {
      final uploadResult = await _empleadosRepository.uploadTabuladorSalarial(puesto.id!, tabulador);
      switch (uploadResult) {
        case Error():
          _log.warning('Puesto creado pero falló la subida del tabulador salarial', error: uploadResult.error);
        case Ok():
          puesto = uploadResult.value;
      }
    }

    _puestos = [..._puestos, puesto];
    notifyListeners();
    return Result.ok(puesto);
  }

  Future<Result<Puesto>> _editPuesto(PuestoEditParams params) async {
    final result = await _empleadosRepository.updatePuesto(
      params.id,
      nombre: params.nombre,
      tipos: params.tipos,
      rol: params.rol,
      responsabilidades: params.responsabilidades,
      departamentoIds: params.departamentoIds,
      preguntas: params.preguntas,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to update puesto', error: result.error);
        return Result.error(result.error);
      case Ok():
    }

    var puesto = result.value;

    final tabulador = params.tabuladorSalarial;
    if (tabulador != null) {
      final uploadResult = await _empleadosRepository.uploadTabuladorSalarial(puesto.id!, tabulador);
      switch (uploadResult) {
        case Error():
          _log.warning('Puesto editado pero falló la subida del tabulador salarial', error: uploadResult.error);
        case Ok():
          puesto = uploadResult.value;
      }
    }

    _puestos = [
      for (final p in _puestos)
        if (p.id == puesto.id) puesto else p,
    ];
    notifyListeners();
    return Result.ok(puesto);
  }

  Future<Result<int>> _deletePuesto(int id) async {
    final result = await _empleadosRepository.deletePuesto(id);
    switch (result) {
      case Error():
        _log.warning('Failed to delete puesto', error: result.error);
        return Result.error(result.error);
      case Ok():
    }
    _puestos = _puestos.where((p) => p.id != id).toList();
    notifyListeners();
    return Result.ok(id);
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
