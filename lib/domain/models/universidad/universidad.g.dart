// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'universidad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Universidad _$UniversidadFromJson(Map<String, dynamic> json) => _Universidad(
  id: (json['id'] as num?)?.toInt() ?? 0,
  nombre: json['nombre'] as String,
  direccion: json['direccion'] as String,
  numeroContacto: json['numero_contacto'] as String,
);

Map<String, dynamic> _$UniversidadToJson(_Universidad instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'direccion': instance.direccion,
      'numero_contacto': instance.numeroContacto,
    };
