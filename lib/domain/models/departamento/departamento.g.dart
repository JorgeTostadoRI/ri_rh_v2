// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departamento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Departamento _$DepartamentoFromJson(Map<String, dynamic> json) =>
    _Departamento(
      id: (json['id'] as num).toInt(),
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String,
      presupuesto: (json['presupuesto'] as num).toDouble(),
      divisa: $enumDecode(_$DivisaEnumMap, json['divisa']),
      lider: json['lider'] == null
          ? null
          : Lider.fromJson(json['lider'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartamentoToJson(_Departamento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'descripcion': instance.descripcion,
      'presupuesto': instance.presupuesto,
      'divisa': _$DivisaEnumMap[instance.divisa]!,
      'lider': instance.lider,
    };

const _$DivisaEnumMap = {
  Divisa.MEX: 'MEX',
  Divisa.MXN: 'MXN',
  Divisa.USD: 'USD',
};

_Lider _$LiderFromJson(Map<String, dynamic> json) => _Lider(
  id: (json['id'] as num).toInt(),
  nombre: json['nombre'] as String,
  telefono: json['telefono'] as String,
  correo: json['correo'] as String,
);

Map<String, dynamic> _$LiderToJson(_Lider instance) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'telefono': instance.telefono,
  'correo': instance.correo,
};
