// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_challenge_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyChallengeRequest _$VerifyChallengeRequestFromJson(
  Map<String, dynamic> json,
) => _VerifyChallengeRequest(
  authSessionId: json['auth_session_id'] as String,
  deviceId: json['device_id'] as String,
  nonce: json['nonce'] as String,
  signature: json['signature'] as String,
  username: json['username'] as String,
);

Map<String, dynamic> _$VerifyChallengeRequestToJson(
  _VerifyChallengeRequest instance,
) => <String, dynamic>{
  'auth_session_id': instance.authSessionId,
  'device_id': instance.deviceId,
  'nonce': instance.nonce,
  'signature': instance.signature,
  'username': instance.username,
};
