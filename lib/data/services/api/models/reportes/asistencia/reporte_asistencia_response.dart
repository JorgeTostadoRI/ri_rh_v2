import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/asistencia_daily/asistencia_daily_api_model.dart';

part 'reporte_asistencia_response.freezed.dart';
part 'reporte_asistencia_response.g.dart';

@freezed
abstract class ReporteAsistenciaResponse with _$ReporteAsistenciaResponse {
  const factory ReporteAsistenciaResponse({
    required DateTime startDate,
    required DateTime endDate,
    @JsonKey(name: 'users')
    required List<ReporteAsistenciaResponseItem> items,
  }) = _ReporteAsistenciaResponse;

  factory ReporteAsistenciaResponse.fromJson(Map<String, Object?> json) => _$ReporteAsistenciaResponseFromJson(json);
}

@freezed
abstract class ReporteAsistenciaResponseItem with _$ReporteAsistenciaResponseItem {
  const factory ReporteAsistenciaResponseItem({
    required int id,
    required String username,
    required String nombre,
    String? rol,
    @JsonKey(name: 'departamento')
    int? departamentoRef,
    required int totalMinutesLate,
    required List<AsistenciaDailyApiModel> asistencia,
  }) = _ReporteAsistenciaResponseItem;

  factory ReporteAsistenciaResponseItem.fromJson(Map<String, Object?> json) => _$ReporteAsistenciaResponseItemFromJson(json);
}
