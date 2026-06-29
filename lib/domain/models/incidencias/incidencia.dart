import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_file.dart';

part 'incidencia.freezed.dart';
part 'incidencia.g.dart';

enum IncidenciaState {
  @JsonValue('PE')
  pending,
  @JsonValue('RE')
  rejected,
  @JsonValue('AP')
  approved,
}

@freezed
abstract class Incidencia with _$Incidencia {
    const factory Incidencia({
        // Populados en creacion
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        IncidenciaState? state,
        int? revisor,

        // Se puede agregar por RH
        int? solicitor,
        
        required DateTime start,
        required DateTime end,
        required String reason,
        required List<IncidenciaFile> files,

        @JsonKey(defaultValue: '')
        required String categoryId,
    }) = _Incidencia;

    factory Incidencia.fromJson(Map<String, Object?> json) => _$IncidenciaFromJson(json);
}
