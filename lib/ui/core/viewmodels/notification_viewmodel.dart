import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class NotificationViewmodel extends ChangeNotifier {
  final AppLogger _log;
  final AuthRepository _authRepository;
  final IncidenciasRepository _incidenciasRepository;

  NotificationViewmodel({
    required this._log,
    required this._authRepository,
    required this._incidenciasRepository,
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

      final resultIncidenciasCount = await _incidenciasRepository.getIncidenciasPendingCount();
      switch (resultIncidenciasCount) {
        case Error():
          _log.error('Failed to fetch pending incidencia count', error: resultIncidenciasCount.error);
          return Result.error(Exception(resultIncidenciasCount.error));
        case Ok():
      }

      _pendingIncidenciasToReview = resultIncidenciasCount.value.total;
      notifyListeners();
      return Result.ok(null);
    } on Exception catch (e) {
      _log.error('Unexpected error when fetching pending incidencia count', error: e);
      return Result.error(e);
    }
  }

  Future<Result<void>> _clear() async {
    _pendingIncidenciasToReview = 0;
    notifyListeners();
    return const Result.ok(null);
  }

  void _startPolling() {
    _pollTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _load();
    });
  }
}