// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidato.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Candidato _$CandidatoFromJson(Map<String, dynamic> json) => _Candidato(
  id: (json['id'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  correo: json['correo'] as String,
  estado:
      $enumDecodeNullable(_$CandidatoEstadoEnumMap, json['estado']) ??
      CandidatoEstado.iniciado,
  fechaExpiracion: json['fecha_expiracion'] == null
      ? null
      : DateTime.parse(json['fecha_expiracion'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  contratoSolicitadoEn: json['contrato_solicitado_en'] == null
      ? null
      : DateTime.parse(json['contrato_solicitado_en'] as String),
);

Map<String, dynamic> _$CandidatoToJson(
  _Candidato instance,
) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'correo': instance.correo,
  'estado': _$CandidatoEstadoEnumMap[instance.estado]!,
  'fecha_expiracion': instance.fechaExpiracion?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'contrato_solicitado_en': instance.contratoSolicitadoEn?.toIso8601String(),
};

const _$CandidatoEstadoEnumMap = {
  CandidatoEstado.iniciado: 'iniciado',
  CandidatoEstado.completado: 'completado',
  CandidatoEstado.expirado: 'expirado',
  CandidatoEstado.cancelado: 'cancelado',
  CandidatoEstado.contratado: 'contratado',
};
