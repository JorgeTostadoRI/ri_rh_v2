// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Horario _$HorarioFromJson(Map<String, dynamic> json) => _Horario(
  id: (json['id'] as num?)?.toInt() ?? 0,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  name: json['name'] as String,
  firstStartTime: const TimeConverter().fromJson(
    json['first_start_time'] as String,
  ),
  firstEndTime: const TimeConverter().fromJson(
    json['first_end_time'] as String,
  ),
  secondStartTime: const TimeConverter().fromJson(
    json['second_start_time'] as String,
  ),
  secondEndTime: const TimeConverter().fromJson(
    json['second_end_time'] as String,
  ),
  mon: json['mon'] as bool,
  tue: json['tue'] as bool,
  wed: json['wed'] as bool,
  thu: json['thu'] as bool,
  fri: json['fri'] as bool,
  sat: json['sat'] as bool,
  sun: json['sun'] as bool,
);

Map<String, dynamic> _$HorarioToJson(_Horario instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'name': instance.name,
  'first_start_time': const TimeConverter().toJson(instance.firstStartTime),
  'first_end_time': const TimeConverter().toJson(instance.firstEndTime),
  'second_start_time': const TimeConverter().toJson(instance.secondStartTime),
  'second_end_time': const TimeConverter().toJson(instance.secondEndTime),
  'mon': instance.mon,
  'tue': instance.tue,
  'wed': instance.wed,
  'thu': instance.thu,
  'fri': instance.fri,
  'sat': instance.sat,
  'sun': instance.sun,
};
