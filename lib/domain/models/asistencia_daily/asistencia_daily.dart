import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';

part 'asistencia_daily.freezed.dart';
part 'asistencia_daily.g.dart';

@freezed
abstract class AsistenciaDaily with _$AsistenciaDaily {
  const factory AsistenciaDaily({
    required int id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required User user,
    required DateTime attendedAt,
    required AsistenciaStatus status,
    required int minutesLate,
    DateTime? entryAt,
    DateTime? exitToLunchAt,
    DateTime? entryFromLunchAt,
    DateTime? exitAt,
    String? entryPhoto,
    String? exitToLunchPhoto,
    String? entryFromLunchPhoto,
    String? exitPhoto,
    String? notes,
  }) = _AsistenciaDaily;

  factory AsistenciaDaily.fromJson(Map<String, Object?> json) => _$AsistenciaDailyFromJson(json);
}

enum AsistenciaStatus {
  present,
  absent,
  late,
  excused,
  rest,
  vacation,
}