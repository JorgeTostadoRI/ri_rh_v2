import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class NotificationViewmodel extends ChangeNotifier {
  final AppLogger _log;
  final AuthRepository _authRepository;
  final IncidenciasRepository _incidenciasRepository;
  final EmpleadosRepository _empleadosRepository;
  final VacantesRepository _vacantesRepository;

  NotificationViewmodel({
    required this._log,
    required this._authRepository,
    required this._incidenciasRepository,
    required this._empleadosRepository,
    required this._vacantesRepository,
  }) {
    load = Command0(_load)..execute();
    clear = Command0(_clear);
    _startPolling();
  }

  late final Command0 load;

  /// Reset all notifications
  late final Command0 clear;

  int _pendingIncidenciasToReview = 0;
  int get pendingIncidenciasToReview => _pendingIncidenciasToReview;

  /// Badge junto a "Reclutamiento" en el sidebar -- cada quien ve solo lo
  /// que le toca hacer: RH, las evaluaciones pendientes de empleados y
  /// practicantes (y los practicantes por contratar); Dirección, las
  /// solicitudes de vacante que esperan que las apruebe o rechace.
  int _pendingReclutamiento = 0;
  int get pendingReclutamiento => _pendingReclutamiento;

  Timer? _pollTimer;

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<Result<void>> _load() async {
    try {
      // Don't fetch unless authenticated
      final currentUser = _authRepository.getCurrentUser();
      if (currentUser == null) {
        return Result.ok(null);
      }

      final resultIncidenciasCount = await _incidenciasRepository.getIncidenciasToReviewCount();
      switch (resultIncidenciasCount) {
        case Error():
          _log.error('Failed to fetch pending incidencia count', error: resultIncidenciasCount.error);
          return Result.error(Exception(resultIncidenciasCount.error));
        case Ok():
      }

      _pendingIncidenciasToReview = resultIncidenciasCount.value;

      // Reclutamiento solo lo ven los líderes de RH y Dirección (ver
      // collapsible_sidebar.dart), y cada uno con su propio conteo -- a los
      // demás ni se les pide (evita un 403 innecesario en cada poll). Si
      // falla, no detiene la actualización del conteo de incidencias.
      final esLider = currentUser.rol == 'LIDER';
      final departamento = currentUser.departamento?.nombre;
      final Result<int>? resultReclutamiento = switch ((esLider, departamento)) {
        (true, 'Recursos Humanos') => await _empleadosRepository.getEvaluacionesPendientesCount(),
        (true, 'Direccion') => await _vacantesRepository.getSolicitudesPendientesCount(),
        _ => null,
      };
      switch (resultReclutamiento) {
        case Error():
          _log.error('Failed to fetch pending reclutamiento count', error: resultReclutamiento.error);
        case Ok():
          _pendingReclutamiento = resultReclutamiento.value;
        case null:
      }

      notifyListeners();
      return Result.ok(null);
    } on Exception catch (e) {
      _log.error('Unexpected error when fetching pending incidencia count', error: e);
      return Result.error(e);
    }
  }

  Future<Result<void>> _clear() async {
    _pendingIncidenciasToReview = 0;
    _pendingReclutamiento = 0;
    notifyListeners();
    return const Result.ok(null);
  }

  void _startPolling() {
    _pollTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _load();
    });
  }
}