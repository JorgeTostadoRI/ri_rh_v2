import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';

part 'hora_por_hora_resumen.freezed.dart';
part 'hora_por_hora_resumen.g.dart';

/// Hora por hora (tiempo por tiempo) en resumen: las que paga un Permiso
/// (`horas_por_hora_resumen`, con aprobaciones y checada) o las que el
/// usuario todavia puede ligar a un permiso (`/horas-por-hora/disponibles/`,
/// solo fechas y estado).
@freezed
abstract class HoraPorHoraResumen with _$HoraPorHoraResumen {
    const factory HoraPorHoraResumen({
        required int id,
        required DateTime start,
        required DateTime end,
        required IncidenciaState state,
        @JsonKey(name: 'approved_by')
        int? approvedByRef,
        @JsonKey(name: 'rh_approved_by')
        int? rhApprovedByRef,
        HoraPorHoraChecador? checador,
    }) = _HoraPorHoraResumen;

    factory HoraPorHoraResumen.fromJson(Map<String, Object?> json) => _$HoraPorHoraResumenFromJson(json);
}

/// Si el checador respalda las horas de una Hora por hora.
@freezed
abstract class HoraPorHoraChecador with _$HoraPorHoraChecador {
    const factory HoraPorHoraChecador({
        @JsonKey(name: 'is_suspicious')
        required bool isSuspicious,
        required String message,
    }) = _HoraPorHoraChecador;

    factory HoraPorHoraChecador.fromJson(Map<String, Object?> json) => _$HoraPorHoraChecadorFromJson(json);
}
