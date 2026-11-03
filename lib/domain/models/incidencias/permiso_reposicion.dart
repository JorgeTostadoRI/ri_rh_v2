import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';

part 'permiso_reposicion.freezed.dart';
part 'permiso_reposicion.g.dart';

/// Permiso de día completo que paga una Hora por hora (tiempo por tiempo):
/// resumen que manda el backend en `permiso_resumen`.
@freezed
abstract class PermisoReposicion with _$PermisoReposicion {
    const factory PermisoReposicion({
        required int id,
        required DateTime start,
        required DateTime end,
        required IncidenciaState state,
    }) = _PermisoReposicion;

    factory PermisoReposicion.fromJson(Map<String, Object?> json) => _$PermisoReposicionFromJson(json);
}
