// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Signature _$SignatureFromJson(Map<String, dynamic> json) => _Signature(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  usuario: (json['usuario'] as num).toInt(),
);

Map<String, dynamic> _$SignatureToJson(_Signature instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'usuario': instance.usuario,
    };
