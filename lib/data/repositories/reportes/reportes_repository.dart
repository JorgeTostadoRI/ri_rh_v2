import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_incidencia_nomina.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class ReportesRepository {
  Future<Result<ReporteAsistencia>> getReporteAsistencia(DateTime start, DateTime end);
  Future<Result<ReporteIncidenciaNomina>> getReporteIncidenciaNomina(DateTime date);
}