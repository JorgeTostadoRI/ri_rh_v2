// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporte_incidencia_nomina_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReporteIncidenciaNominaResponse _$ReporteIncidenciaNominaResponseFromJson(
  Map<String, dynamic> json,
) => _ReporteIncidenciaNominaResponse(
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  items: (json['items'] as List<dynamic>)
      .map(
        (e) => ReporteIncidenciaNominaResponseItem.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$ReporteIncidenciaNominaResponseToJson(
  _ReporteIncidenciaNominaResponse instance,
) => <String, dynamic>{
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate.toIso8601String(),
  'items': instance.items,
};

_ReporteIncidenciaNominaResponseItem
_$ReporteIncidenciaNominaResponseItemFromJson(Map<String, dynamic> json) =>
    _ReporteIncidenciaNominaResponseItem(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      nombre: json['nombre'] as String,
      fullName: json['full_name'] as String,
      isPracticante: json['is_practicante'] as bool,
      departamentoRef: (json['departamento'] as num?)?.toInt(),
      dias: (json['dias'] as List<dynamic>)
          .map(
            (e) => ReporteIncidenciaNominaResponseDia.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      minutesLate: (json['minutes_late'] as num).toInt(),
      extraHours: (json['extra_hours'] as num).toDouble(),
    );

Map<String, dynamic> _$ReporteIncidenciaNominaResponseItemToJson(
  _ReporteIncidenciaNominaResponseItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'nombre': instance.nombre,
  'full_name': instance.fullName,
  'is_practicante': instance.isPracticante,
  'departamento': instance.departamentoRef,
  'dias': instance.dias,
  'minutes_late': instance.minutesLate,
  'extra_hours': instance.extraHours,
};

_ReporteIncidenciaNominaResponseDia
_$ReporteIncidenciaNominaResponseDiaFromJson(Map<String, dynamic> json) =>
    _ReporteIncidenciaNominaResponseDia(
      date: DateTime.parse(json['date'] as String),
      codigo: json['codigo'] as String,
    );

Map<String, dynamic> _$ReporteIncidenciaNominaResponseDiaToJson(
  _ReporteIncidenciaNominaResponseDia instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'codigo': instance.codigo,
};
