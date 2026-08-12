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
  attendedAt: json['attended_at'] == null
      ? null
      : DateTime.parse(json['attended_at'] as String),
  type: $enumDecodeNullable(_$AsistenciaTypeEnumMap, json['type']),
  photoUrl: json['photo_url'] as String?,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AsistenciaToJson(_Asistencia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'attended_at': instance.attendedAt?.toIso8601String(),
      'type': _$AsistenciaTypeEnumMap[instance.type],
      'photo_url': instance.photoUrl,
      'user': instance.user,
    };

const _$AsistenciaTypeEnumMap = {
  AsistenciaType.entry: 'in',
  AsistenciaType.exitToLunch: 'exit_to_lunch',
  AsistenciaType.entryFromLunch: 'entry_from_lunch',
  AsistenciaType.exit: 'out',
};
