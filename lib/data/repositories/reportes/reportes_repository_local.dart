import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/date.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/result.dart';

class ReportesRepositoryLocal extends ReportesRepository {
  final LocalDataService _localDataService;
  
  ReportesRepositoryLocal({
    required this._localDataService,
  });

  @override
  Future<Result<ReporteAsistencia>> getReporteAsistencia(DateTime start, DateTime end) async {
    final users = _localDataService.getUsers();
    final dates = listDaysBetween(start, end);
    final items = _generateMockReporteAsistenciaItems(users, dates);
    
    final reporte = ReporteAsistencia(
      items: items,
      dates: dates,
    );
    return Result.ok(reporte);
  }

  List<ReporteAsistenciaItem> _generateMockReporteAsistenciaItems(List<User> users, List<DateTime> dates) {
    final List<ReporteAsistenciaItem> items = [];
    int sequentialId = 1;

    for (final user in users) {
      final Map<String, List<Asistencia>> attendanceByDate = {};
      for (final day in dates) {
        final attendanceForDay = _generateAttendanceForDay(sequentialId, user, null);
        attendanceByDate[day.toShortIsoString()] = attendanceForDay;
      }
      final item = ReporteAsistenciaItem(
        user: user,
        attendanceByDate: attendanceByDate,
        totalMinutesLate: 0,
      );
      items.add(item);
    }
    return items;
  }

  List<Asistencia> _generateAttendanceForDay(int sequentialId, User user, Horario? horario) {
    bool isEntry = true;
    final List<Asistencia> asistencias = [];
    for (int i = 0; i < 4; i++) {
      final asistencia = Asistencia(
        id: sequentialId++,
        createdAt: _createdAtDatesByIndex[i],
        updatedAt: _createdAtDatesByIndex[i],
        type: isEntry ? AsistenciaType.entry : AsistenciaType.exit,
        user: user,
        horario: horario,
      );
      asistencias.add(asistencia);
      isEntry = !isEntry;
    }
    return asistencias;
  }

  static final _createdAtDatesByIndex = {
    0: DateTime(2026, 7, 29, 7),
    1: DateTime(2026, 7, 29, 12),
    2: DateTime(2026, 7, 29, 13),
    3: DateTime(2026, 7, 29, 17),
  };
}