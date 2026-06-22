// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistencia_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AsistenciaApiModel _$AsistenciaApiModelFromJson(Map<String, dynamic> json) =>
    _AsistenciaApiModel(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      type: json['type'] as String?,
      isLate: json['isLate'] as bool?,
      photo: json['photo'] as String?,
      empleado: (json['empleado'] as num).toInt(),
    );

Map<String, dynamic> _$AsistenciaApiModelToJson(_AsistenciaApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'type': instance.type,
      'isLate': instance.isLate,
      'photo': instance.photo,
      'empleado': instance.empleado,
    };
