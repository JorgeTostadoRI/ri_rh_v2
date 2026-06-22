import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asistencia_api_model.freezed.dart';
part 'asistencia_api_model.g.dart';

@freezed
abstract class AsistenciaApiModel with _$AsistenciaApiModel {
    const factory AsistenciaApiModel({
        // Populados en creacion
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? type,
        bool? isLate,

        // Archivo opcional, será el path al archivo en servidor
        @JsonKey(name: 'photo')
        String? photoPath,
        // Debe ser populado para subir imagen
        @JsonKey(includeFromJson: false, includeToJson: false)
        XFile? photoFile,

        // ID del empleado
        required int empleado,
    }) = _AsistenciaApiModel;

    factory AsistenciaApiModel.fromJson(Map<String, Object?> json) => _$AsistenciaApiModelFromJson(json);
}
