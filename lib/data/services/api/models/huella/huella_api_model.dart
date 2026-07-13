import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'huella_api_model.freezed.dart';
part 'huella_api_model.g.dart';

@freezed
abstract class HuellaApiModel with _$HuellaApiModel {
  const factory HuellaApiModel({
      // Populated on creation
      int? id,
      DateTime? createdAt,
      DateTime? updatedAt,

      /// Fingerprint template encoded as base64 string
      required String template,
      required String hand,
      required String finger,
      required int usuario,

      // Available on read requests after after creation
      @JsonKey(includeToJson: false)
      UserInfo? userInfo,
  }) = _HuellaApiModel;

  factory HuellaApiModel.fromJson(Map<String, Object?> json) => _$HuellaApiModelFromJson(json);
}

@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    required int id,
    required String username,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, Object?> json) => _$UserInfoFromJson(json);
}