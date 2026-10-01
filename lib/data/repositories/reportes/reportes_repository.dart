import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_incidencia_nomina.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class ReportesRepository {
  Future<Result<ReporteAsistencia>> getReporteAsistencia(DateTime start, DateTime end);
  Future<Result<ReporteIncidenciaNomina>> getReporteIncidenciaNomina(DateTime start, DateTime end);

  Future<Result<void>> corregirAsistencia({
    required int usuarioId,
    required DateTime fecha,
    required String campo,
    required String valor,
  });

  /// Regresa la URL del PDF generado cuando `force` es true, o null si se
  /// proceso en segundo plano (disparo automatico de los viernes).
  Future<Result<String?>> generarReporteIncidenciaNomina({
    required DateTime date,
    required bool force,
  });
}