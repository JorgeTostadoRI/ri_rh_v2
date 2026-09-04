// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horario_dia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HorarioDia _$HorarioDiaFromJson(Map<String, dynamic> json) => _HorarioDia(
  day: (json['day'] as num).toInt(),
  startTime: const TimeConverter().fromJson(json['start_time'] as String),
  endTime: const TimeConverter().fromJson(json['end_time'] as String),
  lunchStartTime: _$JsonConverterFromJson<String, Time>(
    json['lunch_start_time'],
    const TimeConverter().fromJson,
  ),
  lunchEndTime: _$JsonConverterFromJson<String, Time>(
    json['lunch_end_time'],
    const TimeConverter().fromJson,
  ),
);

Map<String, dynamic> _$HorarioDiaToJson(_HorarioDia instance) =>
    <String, dynamic>{
      'day': instance.day,
      'start_time': const TimeConverter().toJson(instance.startTime),
      'end_time': const TimeConverter().toJson(instance.endTime),
      'lunch_start_time': _$JsonConverterToJson<String, Time>(
        instance.lunchStartTime,
        const TimeConverter().toJson,
      ),
      'lunch_end_time': _$JsonConverterToJson<String, Time>(
        instance.lunchEndTime,
        const TimeConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
