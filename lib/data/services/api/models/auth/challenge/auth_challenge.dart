import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_challenge.freezed.dart';
part 'auth_challenge.g.dart';

@freezed
abstract class AuthChallenge with _$AuthChallenge {
    const factory AuthChallenge({
        required String authSessionId,
        required String nonce,
        required int expiresInSeconds,
    }) = _AuthChallenge;

    factory AuthChallenge.fromJson(Map<String, Object?> json) => _$AuthChallengeFromJson(json);
}