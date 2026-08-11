import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/asistencia/asistencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';

part 'asistencia.freezed.dart';
part 'asistencia.g.dart';

enum AsistenciaType {
  @JsonValue('in')
  entry,
  @JsonValue('exit_to_lunch')
  exitToLunch,
  @JsonValue('entry_from_lunch')
  entryFromLunch,
  @JsonValue('out')
  exit;

  factory AsistenciaType.fromString(String value) {
    return switch (value) {
      'in' => AsistenciaType.entry,
      'exit_to_lunch' => AsistenciaType.exitToLunch,
      'entry_from_lunch' => AsistenciaType.entryFromLunch,
      'out' => AsistenciaType.exit,
      _ => throw Exception('Invalid value for AsistenciaType')
    };
  }
}

@freezed
abstract class Asistencia with _$Asistencia {
    const factory Asistencia({
        // Populados en creacion
        @Default(0)
        int id,
        DateTime? createdAt,
        DateTime? updatedAt,
        DateTime? attendedAt,
        AsistenciaType? type,

        String? photoUrl,
        // Debe ser populado para subir imagen
        @JsonKey(includeFromJson: false, includeToJson: false)
        XFile? photoFile,

        required User user,
    }) = _Asistencia;

    factory Asistencia.fromJson(Map<String, Object?> json) => _$AsistenciaFromJson(json);

    factory Asistencia.fromApiModel(
      AsistenciaApiModel model,
      {
        required User user,
      }
    ) => Asistencia(
      id: model.id,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      attendedAt: model.attendedAt,
      type: model.type,
      photoUrl: model.photoUrl,
      user: user,
    );
}
