// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthChallenge _$AuthChallengeFromJson(Map<String, dynamic> json) =>
    _AuthChallenge(
      authSessionId: json['auth_session_id'] as String,
      nonce: json['nonce'] as String,
      expiresInSeconds: (json['expires_in_seconds'] as num).toInt(),
    );

Map<String, dynamic> _$AuthChallengeToJson(_AuthChallenge instance) =>
    <String, dynamic>{
      'auth_session_id': instance.authSessionId,
      'nonce': instance.nonce,
      'expires_in_seconds': instance.expiresInSeconds,
    };
