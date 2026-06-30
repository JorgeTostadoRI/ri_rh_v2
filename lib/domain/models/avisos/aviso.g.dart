// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aviso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Aviso _$AvisoFromJson(Map<String, dynamic> json) => _Aviso(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  attachment: json['attachment'] as String?,
  content: json['content'] as String,
  showAt: DateTime.parse(json['show_at'] as String),
);

Map<String, dynamic> _$AvisoToJson(_Aviso instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'attachment': instance.attachment,
  'content': instance.content,
  'show_at': instance.showAt.toIso8601String(),
};
