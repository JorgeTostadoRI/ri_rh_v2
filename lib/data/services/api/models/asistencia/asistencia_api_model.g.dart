// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistencia_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AsistenciaApiModel _$AsistenciaApiModelFromJson(Map<String, dynamic> json) =>
    _AsistenciaApiModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      type: $enumDecodeNullable(_$AsistenciaTypeEnumMap, json['type']),
      minutesLate: (json['minutes_late'] as num?)?.toInt() ?? 0,
      photoUrl: json['photo'] as String?,
      userRef: (json['usuario'] as num).toInt(),
      horarioRef: (json['horario'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AsistenciaApiModelToJson(_AsistenciaApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'type': _$AsistenciaTypeEnumMap[instance.type],
      'minutes_late': instance.minutesLate,
      'photo': instance.photoUrl,
      'usuario': instance.userRef,
      'horario': instance.horarioRef,
    };

const _$AsistenciaTypeEnumMap = {
  AsistenciaType.entry: 'in',
  AsistenciaType.exit: 'exit',
};
