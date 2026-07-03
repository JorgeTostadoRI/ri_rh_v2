import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aviso.freezed.dart';
part 'aviso.g.dart';

@freezed
abstract class Aviso with _$Aviso {
    const factory Aviso({
        // Populated on creation
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? attachment,

        required String content,
        required DateTime showAt,

        @JsonKey(includeFromJson: false, includeToJson: false)
        // The file to upload on creation
        PlatformFile? attachmentFile,
    }) = _Aviso;

    factory Aviso.fromJson(Map<String, dynamic> json) => _$AvisoFromJson(json);
}
