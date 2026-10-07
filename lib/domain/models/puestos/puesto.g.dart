// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puesto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreguntaPuesto _$PreguntaPuestoFromJson(Map<String, dynamic> json) =>
    _PreguntaPuesto(
      id: (json['id'] as num?)?.toInt(),
      categoria: $enumDecode(_$CategoriaPreguntaEnumMap, json['categoria']),
      texto: json['texto'] as String,
      orden: (json['orden'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PreguntaPuestoToJson(_PreguntaPuesto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoria': _$CategoriaPreguntaEnumMap[instance.categoria]!,
      'texto': instance.texto,
      'orden': instance.orden,
    };

const _$CategoriaPreguntaEnumMap = {
  CategoriaPregunta.entrevista: 'entrevista',
  CategoriaPregunta.puesto: 'puesto',
};

_Puesto _$PuestoFromJson(Map<String, dynamic> json) => _Puesto(
  id: (json['id'] as num?)?.toInt(),
  nombre: json['nombre'] as String,
  tipo: $enumDecode(_$TipoPuestoEnumMap, json['tipos']),
  rol: json['rol'] as String?,
  responsabilidades: json['responsabilidades'] as String? ?? '',
  tabuladorSalarialUrl: json['tabulador_salarial'] as String?,
  departamentos:
      (json['departamentos'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const <int>[],
  preguntas:
      (json['preguntas'] as List<dynamic>?)
          ?.map((e) => PreguntaPuesto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PreguntaPuesto>[],
);

Map<String, dynamic> _$PuestoToJson(_Puesto instance) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'tipos': _$TipoPuestoEnumMap[instance.tipo]!,
  'rol': instance.rol,
  'responsabilidades': instance.responsabilidades,
  'tabulador_salarial': instance.tabuladorSalarialUrl,
  'departamentos': instance.departamentos,
  'preguntas': instance.preguntas,
};

const _$TipoPuestoEnumMap = {
  TipoPuesto.administrativo: 'administrativo',
  TipoPuesto.directo: 'directo',
  TipoPuesto.indirecto: 'indirecto',
};
