import 'package:freezed_annotation/freezed_annotation.dart';

part 'solicitud_vacante.freezed.dart';
part 'solicitud_vacante.g.dart';

enum EstatusVacante {
  pendiente,
  aceptada,
  rechazada;
}

@freezed
abstract class SolicitudVacante with _$SolicitudVacante {
  const factory SolicitudVacante({
    int? id,
    required int puesto,
    @JsonKey(name: 'puesto_nombre') String? puestoNombre,
    required String rol,
    required int cantidad,
    int? solicitante,
    @JsonKey(name: 'solicitante_nombre') String? solicitanteNombre,
    @Default(EstatusVacante.pendiente) EstatusVacante estatus,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _SolicitudVacante;

  factory SolicitudVacante.fromJson(Map<String, Object?> json) => _$SolicitudVacanteFromJson(json);
}
