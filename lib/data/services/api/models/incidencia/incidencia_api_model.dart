import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_file.dart';

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
        @JsonKey(name: 'revisor')
        int? revisorRef,

        // Se puede agregar por RH
        @JsonKey(name: 'solicitor')
        int? solicitorRef,
        // Agregado al rechazar la incidencia
        String? rejectionReason,
        
        required DateTime start,
        required DateTime end,
        required String reason,
        required List<IncidenciaFile> files,

        required IncidenciaCategory category,
    }) = _IncidenciaApiModel;

    factory IncidenciaApiModel.fromJson(Map<String, Object?> json) => _$IncidenciaApiModelFromJson(json);
}
