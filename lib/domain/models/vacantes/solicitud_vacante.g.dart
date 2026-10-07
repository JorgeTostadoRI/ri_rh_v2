// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitud_vacante.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SolicitudVacante _$SolicitudVacanteFromJson(Map<String, dynamic> json) =>
    _SolicitudVacante(
      id: (json['id'] as num?)?.toInt(),
      puesto: (json['puesto'] as num).toInt(),
      puestoNombre: json['puesto_nombre'] as String?,
      rol: json['rol'] as String,
      cantidad: (json['cantidad'] as num).toInt(),
      area: json['area'] as String? ?? '',
      turno: (json['turno'] as num?)?.toInt(),
      turnoNombre: json['turno_nombre'] as String?,
      justificacion: json['justificacion'] as String? ?? '',
      solicitante: (json['solicitante'] as num?)?.toInt(),
      solicitanteNombre: json['solicitante_nombre'] as String?,
      estatus:
          $enumDecodeNullable(_$EstatusVacanteEnumMap, json['estatus']) ??
          EstatusVacante.pendiente,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$SolicitudVacanteToJson(_SolicitudVacante instance) =>
    <String, dynamic>{
      'id': instance.id,
      'puesto': instance.puesto,
      'puesto_nombre': instance.puestoNombre,
      'rol': instance.rol,
      'cantidad': instance.cantidad,
      'area': instance.area,
      'turno': instance.turno,
      'turno_nombre': instance.turnoNombre,
      'justificacion': instance.justificacion,
      'solicitante': instance.solicitante,
      'solicitante_nombre': instance.solicitanteNombre,
      'estatus': _$EstatusVacanteEnumMap[instance.estatus]!,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$EstatusVacanteEnumMap = {
  EstatusVacante.pendiente: 'pendiente',
  EstatusVacante.aceptada: 'aceptada',
  EstatusVacante.rechazada: 'rechazada',
};
