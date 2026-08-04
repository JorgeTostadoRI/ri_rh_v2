import 'package:flutter/material.dart';
import 'package:ri_rh_v2/config/incidencia_categories.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia_query.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class IncidenciasViewmodel extends ChangeNotifier {
  final AppLogger _log;
  final AuthRepository _authRepository;
  final IncidenciasRepository _incidenciasRepository;
  
  IncidenciasViewmodel({
    required this._log,
    required this._authRepository,
    required this._incidenciasRepository,
  }) {
    load = Command0(_load)..execute();
  }

  late final Command0 load;

  List<Incidencia>? _pendingToReview;
  List<Incidencia>? get pendingToReview => _pendingToReview;

  Future<Result<void>> _load() async {
    final isAuthenticated = await _authRepository.isAuthenticated;
    if (!isAuthenticated) {
      return Result.ok(null);
    }

    final pendingQuery = IncidenciaQuery(state: IncidenciaState.pending);
    // await one future to cache the users
    final resultPermisos = await _incidenciasRepository.getIncidencias(permisoCategory, query: pendingQuery);
    switch(resultPermisos) {
      case Error():
        _log.error('Failed to fetch permisos', error: resultPermisos.error);
        return Result.error(resultPermisos.error);
      case Ok():
    }
    final resultIncidencias = await Future.wait([
      _incidenciasRepository.getIncidencias(horasExtraCategory, query: pendingQuery),
      _incidenciasRepository.getIncidencias(vacacionesCategory, query: pendingQuery),
      _incidenciasRepository.getIncidencias(incapacidadCategory, query: pendingQuery),
      _incidenciasRepository.getIncidencias(requerimientoJudicialCategory, query: pendingQuery),
    ]);
    resultIncidencias.add(resultPermisos);

    List<Incidencia> pendingIncidencias = [];
    for (final result in resultIncidencias) {
      switch (result) {
        case Error():
          continue;
        case Ok():
          pendingIncidencias.addAll(result.value);
      }
    }
    _pendingToReview = pendingIncidencias;

    return Result.ok(null);
  }

  List<IncidenciaCategory> get categories { 
    return incidenciaCategories;
  }
}