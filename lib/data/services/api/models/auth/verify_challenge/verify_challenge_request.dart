import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_challenge_request.freezed.dart';
part 'verify_challenge_request.g.dart';

@freezed
abstract class VerifyChallengeRequest with _$VerifyChallengeRequest {
    const factory VerifyChallengeRequest({
        required String authSessionId,
        required String deviceId,
        required String nonce,
        required String signature,
        required String username,
    }) = _VerifyChallengeRequest;

    factory VerifyChallengeRequest.fromJson(Map<String, Object?> json) => _$VerifyChallengeRequestFromJson(json);
}