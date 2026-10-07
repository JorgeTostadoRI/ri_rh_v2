import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/utils/result.dart';

class VacantesRepositoryRemote extends VacantesRepository {
  VacantesRepositoryRemote({required this._apiClient});

  final ApiClient _apiClient;

  @override
  Future<Result<List<SolicitudVacante>>> getSolicitudes() async {
    return _apiClient.getSolicitudesVacante();
  }

  @override
  Future<Result<SolicitudVacante>> createSolicitud({
    required int puestoId,
    required String rol,
    required int cantidad,
    required String area,
    required int turnoId,
    required String justificacion,
  }) async {
    return _apiClient.createSolicitudVacante(
      puestoId: puestoId,
      rol: rol,
      cantidad: cantidad,
      area: area,
      turnoId: turnoId,
      justificacion: justificacion,
    );
  }

  @override
  Future<Result<SolicitudVacante>> updateSolicitud({
    required int id,
    required int puestoId,
    required String rol,
    required int cantidad,
    required String area,
    required int turnoId,
    required String justificacion,
  }) async {
    return _apiClient.updateSolicitudVacante(
      id,
      puestoId: puestoId,
      rol: rol,
      cantidad: cantidad,
      area: area,
      turnoId: turnoId,
      justificacion: justificacion,
    );
  }

  @override
  Future<Result<SolicitudVacante>> cambiarEstatus(int id, String estatus) async {
    return _apiClient.cambiarEstatusSolicitudVacante(id, estatus);
  }
}
