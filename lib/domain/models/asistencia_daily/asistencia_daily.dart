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
  @JsonValue('paid_leave')
  paidLeave,
  @JsonValue('unpaid_leave')
  unpaidLeave,
  @JsonValue('medical_leave')
  medicalLeave,
  termination,
  @JsonValue('holiday_leave')
  holidayLeave,
  @JsonValue('holiday_worked')
  holidayWorked,
  @JsonValue('authorized_late')
  authorizedLate,
}

extension AsistenciaStatusValue on AsistenciaStatus {
  String get jsonValue => _$AsistenciaStatusEnumMap[this]!;
}

extension AsistenciaStatusLabel on AsistenciaStatus {
  String get label => switch (this) {
    AsistenciaStatus.present => 'Presente',
    AsistenciaStatus.absent => 'Falta',
    AsistenciaStatus.late => 'Retardo',
    AsistenciaStatus.excused => 'Falta Justificada',
    AsistenciaStatus.rest => 'Descanso',
    AsistenciaStatus.vacation => 'Vacaciones',
    AsistenciaStatus.paidLeave => 'Permiso con goce',
    AsistenciaStatus.unpaidLeave => 'Permiso sin goce',
    AsistenciaStatus.medicalLeave => 'Incapacidad',
    AsistenciaStatus.termination => 'Baja',
    AsistenciaStatus.holidayLeave => 'Festivo no trabajado',
    AsistenciaStatus.holidayWorked => 'Festivo trabajado',
    AsistenciaStatus.authorizedLate => 'Retardo autorizado',
  };
}