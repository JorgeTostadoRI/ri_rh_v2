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
  revisor: (json['revisor'] as num?)?.toInt(),
  solicitor: (json['solicitor'] as num?)?.toInt(),
  start: DateTime.parse(json['start'] as String),
  end: DateTime.parse(json['end'] as String),
  reason: json['reason'] as String,
  files: (json['files'] as List<dynamic>)
      .map((e) => IncidenciaFile.fromJson(e as Map<String, dynamic>))
      .toList(),
  categoryId: json['category_id'] as String? ?? '',
);

Map<String, dynamic> _$IncidenciaToJson(_Incidencia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'state': _$IncidenciaStateEnumMap[instance.state],
      'revisor': instance.revisor,
      'solicitor': instance.solicitor,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'reason': instance.reason,
      'files': instance.files,
      'category_id': instance.categoryId,
    };

const _$IncidenciaStateEnumMap = {
  IncidenciaState.pending: 'PE',
  IncidenciaState.rejected: 'RE',
  IncidenciaState.approved: 'AP',
};
