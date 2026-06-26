// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incidencia_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidenciaFile _$IncidenciaFileFromJson(Map<String, dynamic> json) =>
    _IncidenciaFile(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      filepath: json['filepath'] as String,
    );

Map<String, dynamic> _$IncidenciaFileToJson(_IncidenciaFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'filepath': instance.filepath,
    };
