// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incidencia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Incidencia _$IncidenciaFromJson(Map<String, dynamic> json) => _Incidencia(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  state: $enumDecodeNullable(_$IncidenciaStateEnumMap, json['state']),
  solicitor: json['solicitor'] == null
      ? null
      : User.fromJson(json['solicitor'] as Map<String, dynamic>),
  approvedBy: json['approved_by'] == null
      ? null
      : User.fromJson(json['approved_by'] as Map<String, dynamic>),
  rhApprovedBy: json['rh_approved_by'] == null
      ? null
      : User.fromJson(json['rh_approved_by'] as Map<String, dynamic>),
  rejectionReason: json['rejection_reason'] as String?,
  rejectedBy: json['rejected_by'] == null
      ? null
      : User.fromJson(json['rejected_by'] as Map<String, dynamic>),
  pdfUrl: json['pdf_url'] as String?,
  start: DateTime.parse(json['start'] as String),
  end: DateTime.parse(json['end'] as String),
  reason: json['reason'] as String,
  files: (json['files'] as List<dynamic>)
      .map((e) => IncidenciaFile.fromJson(e as Map<String, dynamic>))
      .toList(),
  category: $enumDecode(_$IncidenciaCategoryEnumMap, json['category']),
);

Map<String, dynamic> _$IncidenciaToJson(_Incidencia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'state': _$IncidenciaStateEnumMap[instance.state],
      'solicitor': instance.solicitor,
      'approved_by': instance.approvedBy,
      'rh_approved_by': instance.rhApprovedBy,
      'rejection_reason': instance.rejectionReason,
      'rejected_by': instance.rejectedBy,
      'pdf_url': instance.pdfUrl,
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
