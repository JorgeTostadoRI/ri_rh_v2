import 'package:freezed_annotation/freezed_annotation.dart';

part 'reporte_incidencia_nomina_response.freezed.dart';
part 'reporte_incidencia_nomina_response.g.dart';

@freezed
abstract class ReporteIncidenciaNominaResponse
    with _$ReporteIncidenciaNominaResponse {
  const factory ReporteIncidenciaNominaResponse({
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    required List<ReporteIncidenciaNominaResponseItem> items,
  }) = _ReporteIncidenciaNominaResponse;

  factory ReporteIncidenciaNominaResponse.fromJson(Map<String, Object?> json) =>
      _$ReporteIncidenciaNominaResponseFromJson(json);
}

@freezed
abstract class ReporteIncidenciaNominaResponseItem
    with _$ReporteIncidenciaNominaResponseItem {
  const factory ReporteIncidenciaNominaResponseItem({
    required int id,
    required String username,
    required String nombre,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'is_practicante') required bool isPracticante,
    @JsonKey(name: 'departamento') int? departamentoRef,
    required List<ReporteIncidenciaNominaResponseDia> dias,
    @JsonKey(name: 'minutes_late') required int minutesLate,
    @JsonKey(name: 'extra_hours') required double extraHours,
  }) = _ReporteIncidenciaNominaResponseItem;

  factory ReporteIncidenciaNominaResponseItem.fromJson(
    Map<String, Object?> json,
  ) => _$ReporteIncidenciaNominaResponseItemFromJson(json);
}

@freezed
abstract class ReporteIncidenciaNominaResponseDia
    with _$ReporteIncidenciaNominaResponseDia {
  const factory ReporteIncidenciaNominaResponseDia({
    required DateTime date,
    required String codigo,
  }) = _ReporteIncidenciaNominaResponseDia;

  factory ReporteIncidenciaNominaResponseDia.fromJson(
    Map<String, Object?> json,
  ) => _$ReporteIncidenciaNominaResponseDiaFromJson(json);
}
