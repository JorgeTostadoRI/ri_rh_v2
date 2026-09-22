import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_incidencia_nomina.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class ReporteIncidenciaNominaViewmodel extends ChangeNotifier {
  final AppLogger _log;
  final ReportesRepository _reportesRepository;

  ReporteIncidenciaNominaViewmodel({
    required this._log,
    required this._reportesRepository,
  }) {
    _selectedDate = DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    load = Command0(_load)..execute();
  }

  late final Command0 load;

  late DateTime _selectedDate;
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime value) {
    _selectedDate = value.copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    notifyListeners();
  }

  ReporteIncidenciaNomina? _reporte;
  ReporteIncidenciaNomina get reporte => _reporte!;

  Future<Result<void>> _load() async {
    _log.debug('Search: $_selectedDate');

    final result = await _reportesRepository.getReporteIncidenciaNomina(
      _selectedDate,
    );
    switch (result) {
      case Error():
        _log.warning(
          'Failed to fetch incidencia nomina report',
          error: result.error,
        );
        return Result.error(result.error);
      case Ok():
    }
    _reporte = result.value;

    notifyListeners();
    return const Result.ok(null);
  }
}
