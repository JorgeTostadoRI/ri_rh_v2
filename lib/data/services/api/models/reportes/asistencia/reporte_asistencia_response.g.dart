// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporte_asistencia_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReporteAsistenciaResponse _$ReporteAsistenciaResponseFromJson(
  Map<String, dynamic> json,
) => _ReporteAsistenciaResponse(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  nombre: json['nombre'] as String,
  rol: json['rol'] as String,
  departamentoRef: (json['departamento'] as num).toInt(),
  asistencia: (json['asistencia'] as List<dynamic>)
      .map((e) => AsistenciaApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReporteAsistenciaResponseToJson(
  _ReporteAsistenciaResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'nombre': instance.nombre,
  'rol': instance.rol,
  'departamento': instance.departamentoRef,
  'asistencia': instance.asistencia,
};
