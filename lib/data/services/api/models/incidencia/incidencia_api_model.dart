import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/incidencias/checador_discrepancy.dart';
import 'package:ri_rh_v2/domain/models/incidencias/hora_por_hora_resumen.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_file.dart';
import 'package:ri_rh_v2/domain/models/incidencias/permiso_reposicion.dart';

part 'incidencia_api_model.freezed.dart';
part 'incidencia_api_model.g.dart';

@freezed
abstract class IncidenciaApiModel with _$IncidenciaApiModel {
    const factory IncidenciaApiModel({
        // Populados en creacion
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        IncidenciaState? state,

        // Se puede agregar por RH
        @JsonKey(name: 'solicitor')
        int? solicitorRef,

        @JsonKey(name: 'approved_by')
        int? approvedByRef,
        @JsonKey(name: 'rh_approved_by')
        int? rhApprovedByRef,

        // Agregado al rechazar la incidencia
        String? rejectionReason,
        @JsonKey(name: 'rejected_by')
        int? rejectedByRef,

        @JsonKey(name: 'pdf')
        String? pdfUrl,

        @JsonKey(name: 'checador_discrepancy')
        ChecadorDiscrepancy? checadorDiscrepancy,

        // Solo aplican para Permiso
        @JsonKey(name: 'con_goce')
        bool? conGoce,
        @JsonKey(name: 'con_goce_approved_by')
        int? conGoceApprovedByRef,
        // El backend no la manda al propio solicitante.
        @JsonKey(name: 'con_goce_justificacion')
        String? conGoceJustificacion,

        // Solo aplican para Permiso por tiempo por tiempo: las Hora por hora
        // que lo pagan.
        @JsonKey(name: 'tiempo_por_tiempo')
        bool? tiempoPorTiempo,
        @JsonKey(name: 'horas_por_hora_resumen')
        List<HoraPorHoraResumen>? horasPorHora,
        // Se mandan al pedir el permiso (`horas_por_hora`), ver postIncidencia.
        @JsonKey(includeFromJson: false, includeToJson: false)
        List<int>? horasPorHoraRefs,

        // Solo aplica para Hora por hora: el Permiso que paga, ya ligado.
        @JsonKey(name: 'permiso_resumen')
        PermisoReposicion? permisoResumen,

        @JsonKey(name: 'video')
        String? videoUrl,
        // Debe ser populado para subir el video grabado.
        @JsonKey(includeFromJson: false, includeToJson: false)
        XFile? videoFile,

        required DateTime start,
        required DateTime end,
        required String reason,
        required List<IncidenciaFile> files,

        required IncidenciaCategory category,
    }) = _IncidenciaApiModel;

    factory IncidenciaApiModel.fromJson(Map<String, Object?> json) => _$IncidenciaApiModelFromJson(json);
}
