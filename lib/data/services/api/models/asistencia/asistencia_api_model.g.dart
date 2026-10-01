// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistencia_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AsistenciaApiModel _$AsistenciaApiModelFromJson(Map<String, dynamic> json) =>
    _AsistenciaApiModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      attendedAt: json['attended_at'] == null
          ? null
          : DateTime.parse(json['attended_at'] as String),
      type: $enumDecodeNullable(_$AsistenciaTypeEnumMap, json['type']),
      faltaNoReportada: json['falta_no_reportada'] == null
          ? null
          : DateTime.parse(json['falta_no_reportada'] as String),
      faltaNoReportadaHoraAviso: json['falta_no_reportada_hora_aviso'] == null
          ? null
          : DateTime.parse(json['falta_no_reportada_hora_aviso'] as String),
      faltaNoReportadaHoraLimite: json['falta_no_reportada_hora_limite'] == null
          ? null
          : DateTime.parse(json['falta_no_reportada_hora_limite'] as String),
      photoUrl: json['photo'] as String?,
      userRef: (json['usuario'] as num).toInt(),
    );

Map<String, dynamic> _$AsistenciaApiModelToJson(_AsistenciaApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'attended_at': instance.attendedAt?.toIso8601String(),
      'type': _$AsistenciaTypeEnumMap[instance.type],
      'falta_no_reportada': instance.faltaNoReportada?.toIso8601String(),
      'falta_no_reportada_hora_aviso': instance.faltaNoReportadaHoraAviso
          ?.toIso8601String(),
      'falta_no_reportada_hora_limite': instance.faltaNoReportadaHoraLimite
          ?.toIso8601String(),
      'photo': instance.photoUrl,
      'usuario': instance.userRef,
    };

const _$AsistenciaTypeEnumMap = {
  AsistenciaType.entry: 'in',
  AsistenciaType.exitToLunch: 'exit_to_lunch',
  AsistenciaType.entryFromLunch: 'entry_from_lunch',
  AsistenciaType.exit: 'out',
};
