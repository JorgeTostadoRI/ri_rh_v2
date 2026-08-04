
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incidencia_pending_count_response.freezed.dart';
part 'incidencia_pending_count_response.g.dart';

@freezed
abstract class IncidenciaPendingCountResponse with _$IncidenciaPendingCountResponse {
  const factory IncidenciaPendingCountResponse({
    required int total,
    required int permisos,
    required int horasExtra,
    required int vacaciones,
    required int incapacidades,
    required int requerimientosJudiciales,
  }) = _IncidenciaPendingCountResponse;

  factory IncidenciaPendingCountResponse.fromJson(Map<String, Object?> json) => _$IncidenciaPendingCountResponseFromJson(json);
}