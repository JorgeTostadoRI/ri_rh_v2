import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asistencia.freezed.dart';
part 'asistencia.g.dart';

@freezed
abstract class Asistencia with _$Asistencia {
    const factory Asistencia({
        // Populados en creacion
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? type,
        bool? isLate,

        // Archivo opcional, debe ser el path
        String? photo,

        // ID del empleado
        // TODO: cambiar por Empleado
        required int empleado,
    }) = _Asistencia;

    factory Asistencia.fromJson(Map<String, Object?> json) => _$AsistenciaFromJson(json);
}
