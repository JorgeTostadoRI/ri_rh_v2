// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incidencia_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidenciaApiModel _$IncidenciaApiModelFromJson(Map<String, dynamic> json) =>
    _IncidenciaApiModel(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      state: $enumDecodeNullable(_$IncidenciaStateEnumMap, json['state']),
      revisorRef: (json['revisor'] as num?)?.toInt(),
      solicitorRef: (json['solicitor'] as num?)?.toInt(),
      rejectionReason: json['rejection_reason'] as String?,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      reason: json['reason'] as String,
      files: (json['files'] as List<dynamic>)
          .map((e) => IncidenciaFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: $enumDecode(_$IncidenciaCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$IncidenciaApiModelToJson(_IncidenciaApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'state': _$IncidenciaStateEnumMap[instance.state],
      'revisor': instance.revisorRef,
      'solicitor': instance.solicitorRef,
      'rejection_reason': instance.rejectionReason,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'reason': instance.reason,
      'files': instance.files,
      'category': _$IncidenciaCategoryEnumMap[instance.category]!,
    };

const _$IncidenciaStateEnumMap = {
  IncidenciaState.pending: 'PE',
  IncidenciaState.rejected: 'RE',
  IncidenciaState.approved: 'AP',
};

const _$IncidenciaCategoryEnumMap = {
  IncidenciaCategory.permiso: 'permiso',
  IncidenciaCategory.horasextra: 'horasextra',
  IncidenciaCategory.vacaciones: 'vacaciones',
  IncidenciaCategory.incapacidad: 'incapacidad',
  IncidenciaCategory.requerimientojudicial: 'requerimientojudicial',
  IncidenciaCategory.falta: 'falta',
  IncidenciaCategory.retardo: 'retardo',
};
