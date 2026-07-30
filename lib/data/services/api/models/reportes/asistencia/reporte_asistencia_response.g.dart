// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporte_asistencia_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReporteAsistenciaResponse _$ReporteAsistenciaResponseFromJson(
  Map<String, dynamic> json,
) => _ReporteAsistenciaResponse(
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  users: (json['users'] as List<dynamic>)
      .map((e) => ReporteAsistenciaUser.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReporteAsistenciaResponseToJson(
  _ReporteAsistenciaResponse instance,
) => <String, dynamic>{
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate.toIso8601String(),
  'users': instance.users,
};

_ReporteAsistenciaUser _$ReporteAsistenciaUserFromJson(
  Map<String, dynamic> json,
) => _ReporteAsistenciaUser(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  nombre: json['nombre'] as String,
  rol: json['rol'] as String,
  departamentoRef: (json['departamento'] as num).toInt(),
  asistencia: (json['asistencia'] as List<dynamic>)
      .map((e) => AsistenciaApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalMinutesLate: (json['total_minutes_late'] as num).toInt(),
);

Map<String, dynamic> _$ReporteAsistenciaUserToJson(
  _ReporteAsistenciaUser instance,
) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'nombre': instance.nombre,
  'rol': instance.rol,
  'departamento': instance.departamentoRef,
  'asistencia': instance.asistencia,
  'total_minutes_late': instance.totalMinutesLate,
};
