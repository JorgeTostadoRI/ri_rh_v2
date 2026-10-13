import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato.dart';

part 'solicitud_vacante.freezed.dart';
part 'solicitud_vacante.g.dart';

enum EstatusVacante {
  pendiente,
  aceptada,
  rechazada;
}

/// Etapas del flujo de reclutamiento, calculadas en el frontend a partir de
/// los datos crudos que regresa el backend -- mismo patrón que
/// IncidenciaApprovalStage en lib/domain/models/incidencias/incidencia.dart
/// (no existe un campo "stage" en el backend, se deriva aquí). Se amplía a
/// futuro conforme se construyan las fases F/G/H.
enum SolicitudVacanteStage {
  pendiente,
  aceptada,
  candidatoIniciado,
  candidatoCompletado,
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
    if (candidatos.any((c) => c.estado == CandidatoEstado.completado)) {
      return SolicitudVacanteStage.candidatoCompletado;
    }
    if (candidatos.isNotEmpty) return SolicitudVacanteStage.candidatoIniciado;
    if (estatus == EstatusVacante.aceptada) return SolicitudVacanteStage.aceptada;
    return SolicitudVacanteStage.pendiente;
  }
}
