// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'huella_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HuellaApiModel _$HuellaApiModelFromJson(Map<String, dynamic> json) =>
    _HuellaApiModel(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      template: json['template'] as String,
      hand: json['hand'] as String,
      finger: json['finger'] as String,
      usuario: (json['usuario'] as num).toInt(),
      userInfo: json['user_info'] == null
          ? null
          : UserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HuellaApiModelToJson(_HuellaApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'template': instance.template,
      'hand': instance.hand,
      'finger': instance.finger,
      'usuario': instance.usuario,
    };

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
);

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
};
