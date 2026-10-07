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
  });

  /// Edita los campos de una solicitud ya creada. Solo Dirección puede
  /// hacerlo (lo valida el backend).
  Future<Result<SolicitudVacante>> updateSolicitud({
    required int id,
    required int puestoId,
    required String rol,
    required int cantidad,
  });

  /// Acepta o rechaza una solicitud. Solo Dirección puede hacerlo (lo
  /// valida el backend).
  Future<Result<SolicitudVacante>> cambiarEstatus(int id, String estatus);
}
