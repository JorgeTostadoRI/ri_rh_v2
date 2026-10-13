import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class VacantesRepository {
  /// Solicitudes de vacante hechas por el usuario en sesión (Dirección/admin
  /// ve todas; cualquier otro líder solo ve las propias — lo decide el
  /// backend).
  Future<Result<List<SolicitudVacante>>> getSolicitudes();

  /// Solicita una vacante para un puesto. El backend asigna el solicitante
  /// (usuario en sesión) y el estatus inicial ('pendiente').
  Future<Result<SolicitudVacante>> createSolicitud({
    required int puestoId,
    required String rol,
    required int cantidad,
    required String area,
    required int turnoId,
    required String justificacion,
  });

  /// Edita los campos de una solicitud ya creada. Solo Dirección puede
  /// hacerlo (lo valida el backend).
  Future<Result<SolicitudVacante>> updateSolicitud({
    required int id,
    required int puestoId,
    required String rol,
    required int cantidad,
    required String area,
    required int turnoId,
    required String justificacion,
  });

  /// Acepta o rechaza una solicitud. Solo Dirección puede hacerlo (lo
  /// valida el backend).
  Future<Result<SolicitudVacante>> cambiarEstatus(int id, String estatus);

  /// Inicia un candidato (Fase E) para una solicitud ya aceptada: adjunta su
  /// carta oferta y encola el correo con el link para que llene sus datos.
  /// Se puede llamar varias veces sobre la misma solicitud si `cantidad > 1`.
  /// Solo líder de RH puede hacerlo (lo valida el backend).
  Future<Result<SolicitudVacante>> iniciarCandidato({
    required int id,
    required String nombre,
    required String correo,
    required PlatformFile cartaOferta,
  });
}
