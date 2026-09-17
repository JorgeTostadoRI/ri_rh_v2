import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

typedef PuestoCreateParams = ({String nombre, String tipos});
typedef UniversidadCreateParams = ({String nombre, String direccion, String numeroContacto});

class NuevoPracticanteViewmodel extends ChangeNotifier {
  NuevoPracticanteViewmodel({
    required this._log,
    required this._practicantesRepository,
  }) {
    loadCatalogos = Command0(_loadCatalogos)..execute();
    createPuesto = Command1(_createPuesto);
    createUniversidad = Command1(_createUniversidad);
    create = Command1(_create);
  }

  final AppLogger _log;
  final PracticantesRepository _practicantesRepository;

  late final Command0 loadCatalogos;
  late final Command1<Puesto, PuestoCreateParams> createPuesto;
  late final Command1<Universidad, UniversidadCreateParams> createUniversidad;
  late final Command1<Practicante, PracticanteCreateParams> create;

  List<Puesto> _puestos = [];
  List<Puesto> get puestos => _puestos;

  List<Universidad> _universidades = [];
  List<Universidad> get universidades => _universidades;

  List<Departamento> _departamentos = [];
  List<Departamento> get departamentos => _departamentos;

  Future<Result<void>> _loadCatalogos() async {
    final resultPuestos = await _practicantesRepository.getPuestos();
    switch (resultPuestos) {
      case Error():
        _log.warning('Failed to load puestos', error: resultPuestos.error);
        return Result.error(resultPuestos.error);
      case Ok():
    }

    final resultUniversidades = await _practicantesRepository.getUniversidades();
    switch (resultUniversidades) {
      case Error():
        _log.warning('Failed to load universidades', error: resultUniversidades.error);
        return Result.error(resultUniversidades.error);
      case Ok():
    }

    final resultDepartamentos = await _practicantesRepository.getDepartamentos();
    switch (resultDepartamentos) {
      case Error():
        _log.warning('Failed to load departamentos', error: resultDepartamentos.error);
        return Result.error(resultDepartamentos.error);
      case Ok():
    }

    _puestos = resultPuestos.value;
    _universidades = resultUniversidades.value;
    _departamentos = resultDepartamentos.value;
    notifyListeners();
    return const Result.ok(null);
  }

  Future<Result<Puesto>> _createPuesto(PuestoCreateParams params) async {
    final result = await _practicantesRepository.createPuesto(params.nombre, params.tipos);
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

  Future<Result<Universidad>> _createUniversidad(UniversidadCreateParams params) async {
    final result = await _practicantesRepository.createUniversidad(
      params.nombre,
      params.direccion,
      params.numeroContacto,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to create universidad', error: result.error);
        return Result.error(result.error);
      case Ok():
    }
    _universidades = [..._universidades, result.value];
    notifyListeners();
    return Result.ok(result.value);
  }

  Future<Result<Practicante>> _create(PracticanteCreateParams params) async {
    final result = await _practicantesRepository.createPracticante(params);
    switch (result) {
      case Error():
        _log.warning('Failed to create practicante', error: result.error);
        return Result.error(result.error);
      case Ok():
    }
    return Result.ok(result.value);
  }
}
