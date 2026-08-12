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
  items: (json['users'] as List<dynamic>)
      .map(
        (e) =>
            ReporteAsistenciaResponseItem.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ReporteAsistenciaResponseToJson(
  _ReporteAsistenciaResponse instance,
) => <String, dynamic>{
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate.toIso8601String(),
  'users': instance.items,
};

_ReporteAsistenciaResponseItem _$ReporteAsistenciaResponseItemFromJson(
  Map<String, dynamic> json,
) => _ReporteAsistenciaResponseItem(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  nombre: json['nombre'] as String,
  rol: json['rol'] as String,
  departamentoRef: (json['departamento'] as num).toInt(),
  totalMinutesLate: (json['total_minutes_late'] as num).toInt(),
  asistencia: (json['asistencia'] as List<dynamic>)
      .map((e) => AsistenciaDailyApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReporteAsistenciaResponseItemToJson(
  _ReporteAsistenciaResponseItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'nombre': instance.nombre,
  'rol': instance.rol,
  'departamento': instance.departamentoRef,
  'total_minutes_late': instance.totalMinutesLate,
  'asistencia': instance.asistencia,
};
