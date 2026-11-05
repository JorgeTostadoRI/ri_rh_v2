// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revision_abandono.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RevisionAbandono _$RevisionAbandonoFromJson(Map<String, dynamic> json) =>
    _RevisionAbandono(
      procede: json['procede'] as bool,
      motivo: json['motivo'] as String? ?? '',
      ultimaChecada: json['ultima_checada'] == null
          ? null
          : DateTime.parse(json['ultima_checada'] as String),
      dias:
          (json['dias'] as List<dynamic>?)
              ?.map(
                (e) => DiaRevisadoAbandono.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RevisionAbandonoToJson(_RevisionAbandono instance) =>
    <String, dynamic>{
      'procede': instance.procede,
      'motivo': instance.motivo,
      'ultima_checada': instance.ultimaChecada?.toIso8601String(),
      'dias': instance.dias,
    };

_DiaRevisadoAbandono _$DiaRevisadoAbandonoFromJson(Map<String, dynamic> json) =>
    _DiaRevisadoAbandono(
      fecha: DateTime.parse(json['fecha'] as String),
      checadas: (json['checadas'] as num).toInt(),
    );

Map<String, dynamic> _$DiaRevisadoAbandonoToJson(
  _DiaRevisadoAbandono instance,
) => <String, dynamic>{
  'fecha': instance.fecha.toIso8601String(),
  'checadas': instance.checadas,
};
