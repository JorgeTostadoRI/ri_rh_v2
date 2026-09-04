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
  scheduleType:
      $enumDecodeNullable(
        _$HorarioScheduleTypeEnumMap,
        json['schedule_type'],
      ) ??
      HorarioScheduleType.uniform,
  firstStartTime: _$JsonConverterFromJson<String, Time>(
    json['first_start_time'],
    const TimeConverter().fromJson,
  ),
  firstEndTime: _$JsonConverterFromJson<String, Time>(
    json['first_end_time'],
    const TimeConverter().fromJson,
  ),
  secondStartTime: _$JsonConverterFromJson<String, Time>(
    json['second_start_time'],
    const TimeConverter().fromJson,
  ),
  secondEndTime: _$JsonConverterFromJson<String, Time>(
    json['second_end_time'],
    const TimeConverter().fromJson,
  ),
  mon: json['mon'] as bool? ?? false,
  tue: json['tue'] as bool? ?? false,
  wed: json['wed'] as bool? ?? false,
  thu: json['thu'] as bool? ?? false,
  fri: json['fri'] as bool? ?? false,
  sat: json['sat'] as bool? ?? false,
  sun: json['sun'] as bool? ?? false,
  dias:
      (json['dias'] as List<dynamic>?)
          ?.map((e) => HorarioDia.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <HorarioDia>[],
);

Map<String, dynamic> _$HorarioToJson(_Horario instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'name': instance.name,
  'schedule_type': _$HorarioScheduleTypeEnumMap[instance.scheduleType]!,
  'first_start_time': _$JsonConverterToJson<String, Time>(
    instance.firstStartTime,
    const TimeConverter().toJson,
  ),
  'first_end_time': _$JsonConverterToJson<String, Time>(
    instance.firstEndTime,
    const TimeConverter().toJson,
  ),
  'second_start_time': _$JsonConverterToJson<String, Time>(
    instance.secondStartTime,
    const TimeConverter().toJson,
  ),
  'second_end_time': _$JsonConverterToJson<String, Time>(
    instance.secondEndTime,
    const TimeConverter().toJson,
  ),
  'mon': instance.mon,
  'tue': instance.tue,
  'wed': instance.wed,
  'thu': instance.thu,
  'fri': instance.fri,
  'sat': instance.sat,
  'sun': instance.sun,
  'dias': instance.dias,
};

const _$HorarioScheduleTypeEnumMap = {
  HorarioScheduleType.uniform: 'uniform',
  HorarioScheduleType.custom: 'custom',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
