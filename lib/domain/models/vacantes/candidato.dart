import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidato.freezed.dart';
part 'candidato.g.dart';

enum CandidatoEstado {
  iniciado,
  completado,
  expirado,
  cancelado;
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
  }) = _Candidato;

  factory Candidato.fromJson(Map<String, Object?> json) => _$CandidatoFromJson(json);
}
