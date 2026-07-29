import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/reportes/asistencia/reporte_asistencia_response.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/date.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/result.dart';

class ReportesRepositoryRemote extends ReportesRepository {
  final ApiClient _apiClient;
  
  ReportesRepositoryRemote({
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
    for (final response in resultReporte.value) {
      final item = _generateReporteAsistenciaItem(response);
      reporteItems.add(item);
    }

    final reporte = ReporteAsistencia(
      items: reporteItems,
      dates: listDaysBetween(start, end),
    );
    return Result.ok(reporte);
  }

  ReporteAsistenciaItem _generateReporteAsistenciaItem(ReporteAsistenciaResponse resp) {
    final user = User(
      id: resp.id,
      username: resp.username,
      nombre: resp.nombre,
      telefono: '',
      correo: '',
      rol: resp.rol,
      departamento: _cachedDepartamentos!.firstWhere((dep) => dep.id == resp.departamentoRef),
      departamentosPermitidos: [],
      liderPermitido: false,
    );

    final Map<String, List<Asistencia>> attendanceByDate = {};
    for (final apiAsistencia in resp.asistencia) {
      final dateKey = apiAsistencia.createdAt!.toShortIsoString();
      final asistencia = Asistencia.fromApiModel(apiAsistencia, user: user);
      if (!attendanceByDate.containsKey(dateKey)) {
        attendanceByDate[dateKey] = [asistencia];
        continue;
      }
      attendanceByDate[dateKey]!.add(asistencia);
    }

    final item = ReporteAsistenciaItem(
      user: user,
      attendanceByDate: attendanceByDate,
    );
    return item;
  }
}