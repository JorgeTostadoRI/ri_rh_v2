import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato_detalle.dart';
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

  @override
  Future<Result<SolicitudVacante>> iniciarCandidato({
    required int id,
    required String nombre,
    required String correo,
    required PlatformFile cartaOferta,
  }) async {
    return _apiClient.iniciarCandidato(id, nombre: nombre, correo: correo, cartaOferta: cartaOferta);
  }

  @override
  Future<Result<CandidatoDetalle>> getCandidatoDetalle(int id) async {
    return _apiClient.getCandidatoDetalle(id);
  }

  @override
  Future<Result<CandidatoDetalle>> actualizarDetalleContratacion(DetalleContratacionParams params) async {
    return _apiClient.actualizarDetalleContratacion(params);
  }

  @override
  Future<Result<CandidatoDetalle>> solicitarContrato(int id) async {
    return _apiClient.solicitarContrato(id);
  }

  @override
  Future<Result<CandidatoDetalle>> rechazarDocumentacion(int id, String motivo) async {
    return _apiClient.rechazarDocumentacion(id, motivo);
  }

  @override
  Future<Result<VistaPreviaDocumentos>> obtenerVistaPreviaDocumentos(int id) async {
    return _apiClient.obtenerVistaPreviaDocumentos(id);
  }

  @override
  Future<Result<AltaCompletada>> completarAltaCandidato(int id, CompletarAltaParams params) async {
    return _apiClient.completarAltaCandidato(id, params);
  }
}
