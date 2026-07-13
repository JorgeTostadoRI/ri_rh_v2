import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asistencia.freezed.dart';
part 'asistencia.g.dart';

enum AsistenciaType {
  @JsonValue('in')
  entry,
  @JsonValue('exit')
  exit;

  factory AsistenciaType.fromString(String value) {
    return switch (value) {
      'in' => AsistenciaType.entry,
      'out' => AsistenciaType.exit,
      _ => throw Exception('Invalid value for AsistenciaType')
    };
  }
}

@freezed
abstract class Asistencia with _$Asistencia {
    const factory Asistencia({
        // Populados en creacion
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        AsistenciaType? type,
        bool? isLate,

        // Archivo opcional, será el path al archivo en servidor
        @JsonKey(name: 'photo')
        String? photoPath,
        // Debe ser populado para subir imagen
        @JsonKey(includeFromJson: false, includeToJson: false)
        XFile? photoFile,

        // ID del usuario
        required int usuario,
    }) = _Asistencia;

    factory Asistencia.fromJson(Map<String, Object?> json) => _$AsistenciaFromJson(json);
}
