// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hora_por_hora_resumen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HoraPorHoraResumen _$HoraPorHoraResumenFromJson(Map<String, dynamic> json) =>
    _HoraPorHoraResumen(
      id: (json['id'] as num).toInt(),
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      state: $enumDecode(_$IncidenciaStateEnumMap, json['state']),
      approvedByRef: (json['approved_by'] as num?)?.toInt(),
      rhApprovedByRef: (json['rh_approved_by'] as num?)?.toInt(),
      checador: json['checador'] == null
          ? null
          : HoraPorHoraChecador.fromJson(
              json['checador'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$HoraPorHoraResumenToJson(_HoraPorHoraResumen instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'state': _$IncidenciaStateEnumMap[instance.state]!,
      'approved_by': instance.approvedByRef,
      'rh_approved_by': instance.rhApprovedByRef,
      'checador': instance.checador,
    };

const _$IncidenciaStateEnumMap = {
  IncidenciaState.pending: 'PE',
  IncidenciaState.rejected: 'RE',
  IncidenciaState.approved: 'AP',
};

_HoraPorHoraChecador _$HoraPorHoraChecadorFromJson(Map<String, dynamic> json) =>
    _HoraPorHoraChecador(
      isSuspicious: json['is_suspicious'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$HoraPorHoraChecadorToJson(
  _HoraPorHoraChecador instance,
) => <String, dynamic>{
  'is_suspicious': instance.isSuspicious,
  'message': instance.message,
};
