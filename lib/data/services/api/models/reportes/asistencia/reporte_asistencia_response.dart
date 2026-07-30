import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/asistencia/asistencia_api_model.dart';

part 'reporte_asistencia_response.freezed.dart';
part 'reporte_asistencia_response.g.dart';

@freezed
abstract class ReporteAsistenciaResponse with _$ReporteAsistenciaResponse {
  const factory ReporteAsistenciaResponse({
    required DateTime startDate,
    required DateTime endDate,
    required List<ReporteAsistenciaUser> users,
  }) = _ReporteAsistenciaResponse;

  factory ReporteAsistenciaResponse.fromJson(Map<String, Object?> json) => _$ReporteAsistenciaResponseFromJson(json);
}

@freezed
abstract class ReporteAsistenciaUser with _$ReporteAsistenciaUser {
  const factory ReporteAsistenciaUser({
    required int id,
    required String username,
    required String nombre,
    required String rol,
    @JsonKey(name: 'departamento')
    required int departamentoRef,
    required List<AsistenciaApiModel> asistencia,
  }) = _ReporteAsistenciaUser;

  factory ReporteAsistenciaUser.fromJson(Map<String, Object?> json) => _$ReporteAsistenciaUserFromJson(json);
}
