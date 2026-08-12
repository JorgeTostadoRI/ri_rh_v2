// ignore_for_file: unused_field

import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/utils/date.dart';
import 'package:ri_rh_v2/utils/result.dart';

class ReportesRepositoryRemote extends ReportesRepository {
  final AppLogger _log;
  final ApiClient _apiClient;
  
  ReportesRepositoryRemote({
    required this._log,
    required this._apiClient,
  });

  List<Departamento>? _cachedDepartamentos;

  @override
  Future<Result<ReporteAsistencia>> getReporteAsistencia(DateTime start, DateTime end) async {
    if (_cachedDepartamentos == null) {
      final resultDepartamentos = await _apiClient.getDepartamentos();
      switch (resultDepartamentos) {
        case Error():
          return Result.error(resultDepartamentos.error);
        case Ok():
      }
      _cachedDepartamentos = resultDepartamentos.value;
    }

    final resultReporte = await _apiClient.getReporteAsistencia(start, end);
    switch (resultReporte) {
      case Error():
        return Result.error(resultReporte.error);
      case Ok():
    }

    final List<ReporteAsistenciaItem> reporteItems = [];
    final dates = listDaysBetween(start, end);
    for (final userReport in resultReporte.value.items) {
      final item = ReporteAsistenciaItem.fromApiModel(userReport, departamentos: _cachedDepartamentos!);
      reporteItems.add(item);
    }

    final reporte = ReporteAsistencia(
      items: reporteItems,
      dates: dates,
    );
    return Result.ok(reporte);
  }
}