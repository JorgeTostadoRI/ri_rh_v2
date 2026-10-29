import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Pestaña "Practicantes" de Reclutamiento (solo RH, solo consulta):
/// practicantes en alta con fecha de terminación, en qué va su evaluación
/// y, a los que se contrata, su contratación (que se maneja en Pendientes
/// como cualquier solicitud). Se carga al abrir la pestaña, no al entrar a
/// Reclutamiento.
class SeguimientoPracticantesViewmodel extends ChangeNotifier {
  SeguimientoPracticantesViewmodel({
    required this._log,
    required this._practicantesRepository,
  }) {
    load = Command0(_load);
    loadMisPendientes = Command0(_loadMisPendientes);
  }

  final AppLogger _log;
  final PracticantesRepository _practicantesRepository;

  late final Command0<List<SeguimientoPracticanteItem>> load;

  List<SeguimientoPracticanteItem>? _items;
  List<SeguimientoPracticanteItem>? get items => _items;

  /// Practicantes de los que el usuario en sesión es jefe directo y que
  /// esperan su evaluación (bloque "Practicantes por evaluar").
  late final Command0<List<PracticantePorEvaluarItem>> loadMisPendientes;
  List<PracticantePorEvaluarItem> _misPendientes = [];
  List<PracticantePorEvaluarItem> get misPendientes => _misPendientes;

  Future<Result<List<PracticantePorEvaluarItem>>> _loadMisPendientes() async {
    final result = await _practicantesRepository.getMisEvaluacionesPendientes();
    switch (result) {
      case Error():
        _log.warning('Failed to load practicantes por evaluar', error: result.error);
      case Ok():
        _misPendientes = result.value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<List<SeguimientoPracticanteItem>>> _load() async {
    final result = await _practicantesRepository.getSeguimientoEvaluaciones();
    switch (result) {
      case Error():
        _log.warning('Failed to load seguimiento de practicantes', error: result.error);
      case Ok():
        _items = result.value;
    }
    notifyListeners();
    return result;
  }
}
