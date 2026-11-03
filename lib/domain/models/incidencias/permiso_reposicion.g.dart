// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permiso_reposicion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PermisoReposicion _$PermisoReposicionFromJson(Map<String, dynamic> json) =>
    _PermisoReposicion(
      id: (json['id'] as num).toInt(),
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      state: $enumDecode(_$IncidenciaStateEnumMap, json['state']),
    );

Map<String, dynamic> _$PermisoReposicionToJson(_PermisoReposicion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'state': _$IncidenciaStateEnumMap[instance.state]!,
    };

const _$IncidenciaStateEnumMap = {
  IncidenciaState.pending: 'PE',
  IncidenciaState.rejected: 'RE',
  IncidenciaState.approved: 'AP',
};
