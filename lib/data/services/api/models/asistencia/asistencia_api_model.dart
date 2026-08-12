import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';

part 'asistencia_api_model.freezed.dart';
part 'asistencia_api_model.g.dart';

@freezed
abstract class AsistenciaApiModel with _$AsistenciaApiModel {
    const factory AsistenciaApiModel({
        // Populados en creacion
        @Default(0)
        int id,
        DateTime? createdAt,
        DateTime? updatedAt,
        DateTime? attendedAt,
        AsistenciaType? type,

        // Archivo opcional, será el path al archivo en servidor
        @JsonKey(name: 'photo')
        String? photoUrl,
        // Debe ser populado para subir imagen
        @JsonKey(includeFromJson: false, includeToJson: false)
        XFile? photoFile,

        @JsonKey(name: 'usuario')
        required int userRef,
    }) = _AsistenciaApiModel;

    factory AsistenciaApiModel.fromJson(Map<String, Object?> json) => _$AsistenciaApiModelFromJson(json);
}
