import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidato.freezed.dart';
part 'candidato.g.dart';

enum CandidatoEstado {
  iniciado,
  completado,
  expirado,
  cancelado,
  contratado;
}

/// Candidato concreto que RH decide avanzar para una SolicitudVacante (Fase
/// E). Puede haber varios por solicitud si `cantidad > 1`.
@freezed
abstract class Candidato with _$Candidato {
  const factory Candidato({
    int? id,
    required String nombre,
    required String correo,
    @Default(CandidatoEstado.iniciado) CandidatoEstado estado,
    @JsonKey(name: 'fecha_expiracion') DateTime? fechaExpiracion,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'contrato_solicitado_en') DateTime? contratoSolicitadoEn,
  }) = _Candidato;

  factory Candidato.fromJson(Map<String, Object?> json) => _$CandidatoFromJson(json);
}

/// Progreso de UN candidato dentro del flujo completo de la solicitud --
/// los dos primeros pasos siempre están "hechos" (un Candidato solo existe
/// si la solicitud ya fue aceptada), y los últimos tres reflejan su propio
/// avance (no el de los demás candidatos de la misma solicitud).
enum CandidatoStage {
  pendiente,
  aceptada,
  iniciado,
  completado,
  contratoSolicitado,
  contratado,
}

extension CandidatoStageGetters on Candidato {
  CandidatoStage get stage {
    if (estado == CandidatoEstado.contratado) return CandidatoStage.contratado;
    if (contratoSolicitadoEn != null) return CandidatoStage.contratoSolicitado;
    if (estado == CandidatoEstado.completado) return CandidatoStage.completado;
    return CandidatoStage.iniciado;
  }
}
