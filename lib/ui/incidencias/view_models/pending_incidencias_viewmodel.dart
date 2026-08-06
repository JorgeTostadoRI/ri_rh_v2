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

typedef RejectParams = ({Incidencia incidencia, String rejectionReason});

class PendingIncidenciasViewmodel extends ChangeNotifier {
  final AppLogger _log;
  final AuthRepository _authRepository;
  final IncidenciasRepository _incidenciasRepository;
  
  PendingIncidenciasViewmodel({
    required this._log,
    required this._authRepository,
    required this._incidenciasRepository,
  }) {
    load = Command0(_load)..execute();
    approve = Command1(_approve);
    reject = Command1(_reject);
  }

  late final Command0 load;
  late final Command1<void, Incidencia> approve;
  late final Command1<void, RejectParams> reject;

  // FIXME: when hot reloading, resets to 0 instead of keeping the tab index
  int selection = 0;

  List<Incidencia>? _pendingToReview;
  List<Incidencia>? get pendingToReview => _pendingToReview;

  List<Incidencia>? _historial;
  List<Incidencia>? get historial => _historial;

  List<IncidenciaCategory> get categories { 
    return incidenciaCategories;
  }

  Future<Result<void>> _load() async {
    final currentUser = _authRepository.getCurrentUser();
    if (currentUser == null) {
      return Result.error(Exception('Not authenticated'));
    }

    switch (selection) {
      case 0:
        _log.info('Loading incidencias to review');
        final result = await _loadToReview();
        notifyListeners();
        return result;
      case 1:
        _log.info('Loading incidencias historic');
        final result = await _loadHistoric();
        notifyListeners();
        return result;
      default:
        return Result.error(Exception('Invalid selection for loading incidencias'));
    }
  }

  Future<Result<void>> _approve(Incidencia incidencia) async {
    final resultApproval = await _incidenciasRepository.approveIncidencia(incidencia.categoryId, incidencia.id!);
    switch (resultApproval) {
      case Error():
        _log.warning('Failed to approve ${incidencia.categoryId} #${incidencia.id}', error: resultApproval.error);
        return Result.error(resultApproval.error);
      case Ok():
    }

    _pendingToReview!.remove(incidencia);
    _historial!.add(resultApproval.value);
    notifyListeners();
    return Result.ok(null);
  }

  Future<Result<void>> _reject(RejectParams params) async {
    final incidencia = params.incidencia;
    final rejectionReason = params.rejectionReason;
    final resultReject = await _incidenciasRepository.rejectIncidencia(
      incidencia.id!,
      category: incidencia.categoryId,
      rejectionReason: rejectionReason,
    );
    switch (resultReject) {
      case Error():
        _log.warning('Failed to reject ${incidencia.categoryId} #${incidencia.id}', error: resultReject.error);
        return Result.error(resultReject.error);
      case Ok():
    }

    _pendingToReview!.remove(incidencia);
    _historial!.add(resultReject.value);
    notifyListeners();
    return Result.ok(null);
  }

  Future<Result<void>> _loadToReview() async {
    try {
      if (_pendingToReview != null) return const Result.ok(null);

      final resultIncidencias = await Future.wait([
        _incidenciasRepository.getIncidenciasToReview(permisoCategory),
        _incidenciasRepository.getIncidenciasToReview(horasExtraCategory),
        _incidenciasRepository.getIncidenciasToReview(vacacionesCategory),
        _incidenciasRepository.getIncidenciasToReview(incapacidadCategory),
        _incidenciasRepository.getIncidenciasToReview(requerimientoJudicialCategory),
      ]);

      List<Incidencia> pendingIncidencias = [];
      for (final result in resultIncidencias) {
        switch (result) {
          case Error():
            _log.warning('Failed to fetch incidencias', error: result.error);
            continue;
          case Ok():
            pendingIncidencias.addAll(result.value);
        }
      }
      _pendingToReview = pendingIncidencias;
      return const Result.ok(null);
    } on Exception catch (e, stackTrace) {
      _log.error('Failed to load incidencias to review', error: e, stackTrace: stackTrace);
      return Result.error(e);
    }
  }

  Future<Result<void>> _loadHistoric() async {
    try {
      if (_historial != null) return const Result.ok(null);

      final query = IncidenciaQuery(
        state: [IncidenciaState.approved, IncidenciaState.rejected],
      );
      final resultIncidencias = await Future.wait([
        _incidenciasRepository.getIncidencias(permisoCategory, query: query),
        _incidenciasRepository.getIncidencias(horasExtraCategory, query: query),
        _incidenciasRepository.getIncidencias(vacacionesCategory, query: query),
        _incidenciasRepository.getIncidencias(incapacidadCategory, query: query),
        _incidenciasRepository.getIncidencias(requerimientoJudicialCategory, query: query),
        _incidenciasRepository.getIncidencias(faltaCategory, query: query),
        _incidenciasRepository.getIncidencias(retardoCategory, query: query),
      ]);

      List<Incidencia> historic = [];
      for (final result in resultIncidencias) {
        switch (result) {
          case Error():
            _log.warning('Failed to fetch incidencias', error: result.error);
            continue;
          case Ok():
            historic.addAll(result.value);
        }
      }
      _historial = historic;
      return const Result.ok(null);
    } on Exception catch (e, stackTrace) {
      _log.error('Failed to load historic incidencias', error: e, stackTrace: stackTrace);
      return Result.error(e);
    }
  }
}