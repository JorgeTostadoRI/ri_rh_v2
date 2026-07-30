import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/reportes/asistencia/reporte_asistencia_response.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/date.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
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
    for (final userReport in resultReporte.value.users) {
      final item = _generateReporteAsistenciaItem(userReport, dates);
      reporteItems.add(item);
    }

    final reporte = ReporteAsistencia(
      items: reporteItems,
      dates: dates,
    );
    return Result.ok(reporte);
  }

  ReporteAsistenciaItem _generateReporteAsistenciaItem(ReporteAsistenciaUser userReport, List<DateTime> dates) {
    final user = User(
      id: userReport.id,
      username: userReport.username,
      nombre: userReport.nombre,
      telefono: '',
      correo: '',
      rol: userReport.rol,
      departamento: _cachedDepartamentos!.firstWhere((dep) => dep.id == userReport.departamentoRef),
      departamentosPermitidos: [],
      liderPermitido: false,
    );

    final Map<String, List<Asistencia>> attendanceByDate = {};
    for (final day in dates) {
      attendanceByDate[day.toShortIsoString()] = [];
    }

    for (final apiAsistencia in userReport.asistencia) {
      final day = apiAsistencia.createdAt!.toLocal().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
      final dayKey = day.toShortIsoString();
      final asistencia = Asistencia.fromApiModel(apiAsistencia, user: user);

      if (!attendanceByDate.containsKey(dayKey)) {
        attendanceByDate[dayKey] = [asistencia];
        continue;
      }
      attendanceByDate[dayKey]!.add(asistencia);
    }

    final item = ReporteAsistenciaItem(
      user: user,
      attendanceByDate: attendanceByDate,
      totalMinutesLate: userReport.totalMinutesLate,
    );
    return item;
  }
}