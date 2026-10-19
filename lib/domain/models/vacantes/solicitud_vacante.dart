import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato.dart';

part 'solicitud_vacante.freezed.dart';
part 'solicitud_vacante.g.dart';

enum EstatusVacante {
  pendiente,
  aceptada,
  rechazada;
}

/// Etapas a nivel SOLICITUD (no por candidato -- para eso está
/// CandidatoStage en candidato.dart), calculadas en el frontend a partir de
/// los datos crudos que regresa el backend -- mismo patrón que
/// IncidenciaApprovalStage en lib/domain/models/incidencias/incidencia.dart
/// (no existe un campo "stage" en el backend, se deriva aquí). Esta barra
/// solo se muestra mientras no hay ningún candidato todavía (ver
/// vacantes_screen.dart) -- por eso se queda en 3 pasos nada más.
enum SolicitudVacanteStage {
  pendiente,
  aceptada,
  candidatoIniciado,
}

@freezed
abstract class SolicitudVacante with _$SolicitudVacante {
  const factory SolicitudVacante({
    int? id,
    required int puesto,
    @JsonKey(name: 'puesto_nombre') String? puestoNombre,
    required String rol,
    required int cantidad,
    @Default('') String area,
    int? turno,
    @JsonKey(name: 'turno_nombre') String? turnoNombre,
    @Default('') String justificacion,
    int? solicitante,
    @JsonKey(name: 'solicitante_nombre') String? solicitanteNombre,
    @Default(EstatusVacante.pendiente) EstatusVacante estatus,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(<Candidato>[]) List<Candidato> candidatos,
  }) = _SolicitudVacante;

  factory SolicitudVacante.fromJson(Map<String, Object?> json) => _$SolicitudVacanteFromJson(json);
}

extension SolicitudVacanteStageGetters on SolicitudVacante {
  SolicitudVacanteStage get stage {
    if (candidatos.isNotEmpty) return SolicitudVacanteStage.candidatoIniciado;
    if (estatus == EstatusVacante.aceptada) return SolicitudVacanteStage.aceptada;
    return SolicitudVacanteStage.pendiente;
  }
}
