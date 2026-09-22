// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dia_festivo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiaFestivo _$DiaFestivoFromJson(Map<String, dynamic> json) => _DiaFestivo(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  fecha: DateTime.parse(json['fecha'] as String),
  nombre: json['nombre'] as String? ?? '',
);

Map<String, dynamic> _$DiaFestivoToJson(_DiaFestivo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'fecha': instance.fecha.toIso8601String(),
      'nombre': instance.nombre,
    };
