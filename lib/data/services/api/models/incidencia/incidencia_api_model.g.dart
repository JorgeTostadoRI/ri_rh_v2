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
      solicitorRef: (json['solicitor'] as num?)?.toInt(),
      approvedByRef: (json['approved_by'] as num?)?.toInt(),
      rhApprovedByRef: (json['rh_approved_by'] as num?)?.toInt(),
      rejectionReason: json['rejection_reason'] as String?,
      rejectedByRef: (json['rejected_by'] as num?)?.toInt(),
      pdfUrl: json['pdf'] as String?,
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
      'solicitor': instance.solicitorRef,
      'approved_by': instance.approvedByRef,
      'rh_approved_by': instance.rhApprovedByRef,
      'rejection_reason': instance.rejectionReason,
      'rejected_by': instance.rejectedByRef,
      'pdf': instance.pdfUrl,
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
