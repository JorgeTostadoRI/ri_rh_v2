// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistencia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Asistencia _$AsistenciaFromJson(Map<String, dynamic> json) => _Asistencia(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  type: $enumDecodeNullable(_$AsistenciaTypeEnumMap, json['type']),
  isLate: json['is_late'] as bool?,
  photoPath: json['photo'] as String?,
  usuario: (json['usuario'] as num).toInt(),
);

Map<String, dynamic> _$AsistenciaToJson(_Asistencia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'type': _$AsistenciaTypeEnumMap[instance.type],
      'is_late': instance.isLate,
      'photo': instance.photoPath,
      'usuario': instance.usuario,
    };

const _$AsistenciaTypeEnumMap = {
  AsistenciaType.entry: 'in',
  AsistenciaType.exit: 'exit',
};
