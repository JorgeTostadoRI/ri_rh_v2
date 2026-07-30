// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistencia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Asistencia _$AsistenciaFromJson(Map<String, dynamic> json) => _Asistencia(
  id: (json['id'] as num?)?.toInt() ?? 0,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  type: $enumDecodeNullable(_$AsistenciaTypeEnumMap, json['type']),
  minutesLate: (json['minutes_late'] as num?)?.toInt() ?? 0,
  photoUrl: json['photo_url'] as String?,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  horario: json['horario'] == null
      ? null
      : Horario.fromJson(json['horario'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AsistenciaToJson(_Asistencia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'type': _$AsistenciaTypeEnumMap[instance.type],
      'minutes_late': instance.minutesLate,
      'photo_url': instance.photoUrl,
      'user': instance.user,
      'horario': instance.horario,
    };

const _$AsistenciaTypeEnumMap = {
  AsistenciaType.entry: 'in',
  AsistenciaType.exit: 'out',
};
