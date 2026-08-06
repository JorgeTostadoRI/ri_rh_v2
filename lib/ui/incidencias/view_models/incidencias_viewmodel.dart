import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
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

  int? _pendingToReview;
  int? get pendingToReview => _pendingToReview;

  Future<Result<void>> _load() async {
    final isAuthenticated = await _authRepository.isAuthenticated;
    if (!isAuthenticated) {
      return Result.ok(null);
    }

    final resultCount = await _incidenciasRepository.getIncidenciasToReviewCount();
    switch(resultCount) {
      case Error():
        _log.error('Failed to fetch incidencias pending count', error: resultCount.error);
        return Result.error(resultCount.error);
      case Ok():
    }
    _pendingToReview = resultCount.value;
    notifyListeners();
    return Result.ok(null);
  }
}