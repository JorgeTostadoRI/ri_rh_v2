import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incidencia_file.freezed.dart';
part 'incidencia_file.g.dart';

@freezed
abstract class IncidenciaFile with _$IncidenciaFile {
    const factory IncidenciaFile({
        // Populados en creacion
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,

        @JsonKey(name: 'file')
        required String filepath,
        @JsonKey(includeFromJson: false, includeToJson: false)
        PlatformFile? file,
    }) = _IncidenciaFile;

    factory IncidenciaFile.fromJson(Map<String, Object?> json) => _$IncidenciaFileFromJson(json);
}