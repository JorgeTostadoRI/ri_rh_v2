import 'package:flutter/material.dart';
import 'package:ri_rh_v2/config/incidencia_categories.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
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

    final resultIncidencias = await Future.wait([
      _incidenciasRepository.getIncidencias(permisoCategory),
      _incidenciasRepository.getIncidencias(horasExtraCategory),
      _incidenciasRepository.getIncidencias(vacacionesCategory),
      _incidenciasRepository.getIncidencias(incapacidadCategory),
      _incidenciasRepository.getIncidencias(requerimientoJudicialCategory),
    ]);

    List<Incidencia> pendingIncidencias = [];
    List<Incidencia> otherIncidencias = [];
    for (final result in resultIncidencias) {
      switch (result) {
        case Error():
          continue;
        case Ok():
      }
    }

    for (final result in resultIncidencias) {
      switch (result) {
        case Error():
          _log.warning('Failed to fetch incidencias', error: result.error);
          continue;
        case Ok():
          for (final incidencia in result.value) {
            final isPending = incidencia.state == IncidenciaState.pending;
            final isSolicitor = incidencia.solicitor == currentUser;
            if (isPending && !isSolicitor) {
              pendingIncidencias.add(incidencia);
            } else {
              if (!isSolicitor) {
                otherIncidencias.add(incidencia);
              }
            }
          }
      } 
    }

    _pendingToReview = pendingIncidencias;
    _historial = otherIncidencias;
    notifyListeners();
    return Result.ok(null);
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
    _historial!.add(incidencia);
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
    _historial!.add(incidencia);
    notifyListeners();
    return Result.ok(null);
  }
}