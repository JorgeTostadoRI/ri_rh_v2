import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/result.dart';

class ReporteAsistenciaViewmodel extends ChangeNotifier {
  final AppLogger _log;
  final ReportesRepository _reportesRepository;

  ReporteAsistenciaViewmodel({
    required this._log,
    required this._reportesRepository,
  }) {
    final today = DateTime.now().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    searchRange = DateTimeRange(start: today, end: today);
    load = Command0(_load)..execute();
  }

  late final Command0 load;

  late DateTimeRange _searchRange;
  DateTimeRange get searchRange => _searchRange;
  set searchRange(DateTimeRange value) {
    // Point to 23:59:59 instead of 00:00:00
    DateTime adjustedEnd = value.end.copyWith(hour: 23, minute: 59, second: 59, millisecond: 999);

    _searchRange = DateTimeRange(start: value.start, end: adjustedEnd);
    notifyListeners();
  }

  ReporteAsistencia? _reporte;
  ReporteAsistencia get reporte => _reporte!;

  int _employeeCount = 0;
  int get employeeCount => _employeeCount;

  int _entriesCount = 0;
  int get entriesCount => _entriesCount;

  int _absenceCount = 0;
  int get absenceCount => _absenceCount;

  int _minutesLateSum = 0;
  int get minutesLateSum => _minutesLateSum;

  Future<Result<void>> _load() async {
    _log.debug('Search: $_searchRange');

    final resultReporte = await _reportesRepository.getReporteAsistencia(_searchRange.start, _searchRange.end);
    switch (resultReporte) {
      case Error():
        _log.warning('Failed to fetch attendance report', error: resultReporte.error);
        _employeeCount = 0;
        _entriesCount = 0;
        _minutesLateSum = 0;
        return Result.error(resultReporte.error);
      case Ok():
    }
    _reporte = resultReporte.value;
    _employeeCount = _reporte!.items.length;
    _entriesCount = _reporte!.items.fold(0, _combineEntriesCount);
    _absenceCount = _reporte!.items.fold(0, _combineAbsenceCount);
    _minutesLateSum = _reporte!.items.fold(0, (sum, item) => sum += item.totalMinutesLate);

    notifyListeners();
    return Result.ok(null);
  }

  int _combineAbsenceCount(int sum, ReporteAsistenciaItem item) {
    int daysMissed  = 0;
    for (final day in _reporte!.dates) {
      final dayKey = day.toShortIsoString();
      if (item.asistencia[dayKey]?.status == AsistenciaStatus.absent) {
        daysMissed += 1;
      }
    }
    return sum + daysMissed;
  }

  int _combineEntriesCount(int sum, ReporteAsistenciaItem item) {
    const validEntryValues = [AsistenciaStatus.present, AsistenciaStatus.late];

    int entriesByUser = 0;
    for (final day in _reporte!.dates) {
      final dayKey = day.toShortIsoString();
      if (validEntryValues.contains(item.asistencia[dayKey]?.status)) {
        entriesByUser += 1;
      }
    }
    return sum + entriesByUser;
  }
}