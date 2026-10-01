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

        // Solo presente cuando type == entry y el usuario tiene una falta
        // sin reportar del ultimo dia laboral anterior -- ver
        // ri_rh.views.asistencia.AsistenciaView.post en el backend.
        @JsonKey(name: 'falta_no_reportada')
        DateTime? faltaNoReportada,
        // Hora sugerida para ir a reportarla y hora limite antes de perder
        // la asistencia de hoy (ambas personalizadas segun la hora de
        // entrada del usuario ese dia). Solo presentes junto con
        // faltaNoReportada, y solo si el backend pudo determinarlas.
        @JsonKey(name: 'falta_no_reportada_hora_aviso')
        DateTime? faltaNoReportadaHoraAviso,
        @JsonKey(name: 'falta_no_reportada_hora_limite')
        DateTime? faltaNoReportadaHoraLimite,

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
