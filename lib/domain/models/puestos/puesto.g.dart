// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puesto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Puesto _$PuestoFromJson(Map<String, dynamic> json) => _Puesto(
  id: (json['id'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  tipo: $enumDecode(_$TipoPuestoEnumMap, json['tipos']),
);

Map<String, dynamic> _$PuestoToJson(_Puesto instance) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'tipos': _$TipoPuestoEnumMap[instance.tipo]!,
};

const _$TipoPuestoEnumMap = {
  TipoPuesto.administrativo: 'administrativo',
  TipoPuesto.directo: 'directo',
  TipoPuesto.indirecto: 'indirecto',
};
