// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incidencia_pending_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidenciaPendingCountResponse _$IncidenciaPendingCountResponseFromJson(
  Map<String, dynamic> json,
) => _IncidenciaPendingCountResponse(
  total: (json['total'] as num).toInt(),
  permisos: (json['permisos'] as num).toInt(),
  horasExtra: (json['horas_extra'] as num).toInt(),
  vacaciones: (json['vacaciones'] as num).toInt(),
  incapacidades: (json['incapacidades'] as num).toInt(),
  requerimientosJudiciales: (json['requerimientos_judiciales'] as num).toInt(),
);

Map<String, dynamic> _$IncidenciaPendingCountResponseToJson(
  _IncidenciaPendingCountResponse instance,
) => <String, dynamic>{
  'total': instance.total,
  'permisos': instance.permisos,
  'horas_extra': instance.horasExtra,
  'vacaciones': instance.vacaciones,
  'incapacidades': instance.incapacidades,
  'requerimientos_judiciales': instance.requerimientosJudiciales,
};
