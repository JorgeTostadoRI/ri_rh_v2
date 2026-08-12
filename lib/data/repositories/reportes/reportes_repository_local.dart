import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';
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

    for (final user in users) {
      final checkins = _generateCheckInsForUser(user, dates);
      items.add(ReporteAsistenciaItem(user: user, asistencia: checkins, totalMinutesLate: 0));
    }
    return items;
  }

  Map<String, AsistenciaDaily> _generateCheckInsForUser(User user, List<DateTime> dates) {
    final Map<String, AsistenciaDaily> asistencia = {};
    for (final day in dates) {
      final dayKey = day.toShortIsoString();
      asistencia[dayKey] = AsistenciaDaily(
        id: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        user: user,
        attendedAt: day.copyWith(hour: 0, minute: 0, second: 0),
        status: AsistenciaStatus.present,
        minutesLate: 0,
        entryAt: day.copyWith(hour: 7, minute: 0, second: 0),
        exitToLunchAt: day.copyWith(hour: 12, minute: 0, second: 0),
        entryFromLunchAt: day.copyWith(hour: 13, minute: 0, second: 0),
        exitAt: day.copyWith(hour: 17, minute: 0, second: 0),
      );
    }
    return asistencia;
  }
}