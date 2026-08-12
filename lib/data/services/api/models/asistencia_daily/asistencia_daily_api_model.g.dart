// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistencia_daily_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AsistenciaDailyApiModel _$AsistenciaDailyApiModelFromJson(
  Map<String, dynamic> json,
) => _AsistenciaDailyApiModel(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  userRef: (json['usuario'] as num).toInt(),
  attendedAt: DateTime.parse(json['attended_at'] as String),
  status: $enumDecode(_$AsistenciaStatusEnumMap, json['status']),
  minutesLate: (json['minutes_late'] as num).toInt(),
  entryAt: json['entry_at'] == null
      ? null
      : DateTime.parse(json['entry_at'] as String),
  exitToLunchAt: json['exit_to_lunch_at'] == null
      ? null
      : DateTime.parse(json['exit_to_lunch_at'] as String),
  entryFromLunchAt: json['entry_from_lunch_at'] == null
      ? null
      : DateTime.parse(json['entry_from_lunch_at'] as String),
  exitAt: json['exit_at'] == null
      ? null
      : DateTime.parse(json['exit_at'] as String),
  entryPhoto: json['entry_photo'] as String?,
  exitToLunchPhoto: json['exit_to_lunch_photo'] as String?,
  entryFromLunchPhoto: json['entry_from_lunch_photo'] as String?,
  exitPhoto: json['exit_photo'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$AsistenciaDailyApiModelToJson(
  _AsistenciaDailyApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'usuario': instance.userRef,
  'attended_at': instance.attendedAt.toIso8601String(),
  'status': _$AsistenciaStatusEnumMap[instance.status]!,
  'minutes_late': instance.minutesLate,
  'entry_at': instance.entryAt?.toIso8601String(),
  'exit_to_lunch_at': instance.exitToLunchAt?.toIso8601String(),
  'entry_from_lunch_at': instance.entryFromLunchAt?.toIso8601String(),
  'exit_at': instance.exitAt?.toIso8601String(),
  'entry_photo': instance.entryPhoto,
  'exit_to_lunch_photo': instance.exitToLunchPhoto,
  'entry_from_lunch_photo': instance.entryFromLunchPhoto,
  'exit_photo': instance.exitPhoto,
  'notes': instance.notes,
};

const _$AsistenciaStatusEnumMap = {
  AsistenciaStatus.present: 'present',
  AsistenciaStatus.absent: 'absent',
  AsistenciaStatus.late: 'late',
  AsistenciaStatus.excused: 'excused',
  AsistenciaStatus.rest: 'rest',
  AsistenciaStatus.vacation: 'vacation',
};
