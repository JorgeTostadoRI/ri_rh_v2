import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato_detalle.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class CandidatoRevisionViewmodel extends ChangeNotifier {
  CandidatoRevisionViewmodel({
    required this.candidatoId,
    required AppLogger log,
    required VacantesRepository vacantesRepository,
    required EmpleadosRepository empleadosRepository,
  }) : _log = log,
       _vacantesRepository = vacantesRepository,
       _empleadosRepository = empleadosRepository {
    load = Command1(_load)..execute(candidatoId);
    guardarDetalles = Command1(_guardarDetalles);
    solicitarContrato = Command0(_solicitarContrato);
    rechazarDocumentacion = Command1(_rechazarDocumentacion);
    vistaPreviaDocumentos = Command0(_vistaPreviaDocumentos);
    completarAlta = Command1(_completarAlta);
  }

  final int candidatoId;
  final AppLogger _log;
  final VacantesRepository _vacantesRepository;
  final EmpleadosRepository _empleadosRepository;

  late final Command1<CandidatoDetalle, int> load;
  CandidatoDetalle? _candidato;
  CandidatoDetalle? get candidato => _candidato;

  late final Command1<CandidatoDetalle, DetalleContratacionParams> guardarDetalles;
  late final Command0<CandidatoDetalle> solicitarContrato;
  late final Command1<CandidatoDetalle, String> rechazarDocumentacion;
  late final Command0<VistaPreviaDocumentos> vistaPreviaDocumentos;
  late final Command1<AltaCompletada, CompletarAltaParams> completarAlta;

  Future<Result<CandidatoDetalle>> _load(int id) async {
    final result = await _vacantesRepository.getCandidatoDetalle(id);
    switch (result) {
      case Error():
        _log.warning('Failed to load candidato detalle', error: result.error);
      case Ok():
        _candidato = result.value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<CandidatoDetalle>> _guardarDetalles(DetalleContratacionParams params) async {
    final result = await _vacantesRepository.actualizarDetalleContratacion(params);
    switch (result) {
      case Error():
        _log.warning('Failed to update detalle contratacion', error: result.error);
      case Ok():
        _candidato = result.value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<CandidatoDetalle>> _solicitarContrato() async {
    final result = await _vacantesRepository.solicitarContrato(candidatoId);
    switch (result) {
      case Error():
        _log.warning('Failed to solicitar contrato', error: result.error);
      case Ok():
        _candidato = result.value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<CandidatoDetalle>> _rechazarDocumentacion(String motivo) async {
    final result = await _vacantesRepository.rechazarDocumentacion(candidatoId, motivo);
    switch (result) {
      case Error():
        _log.warning('Failed to rechazar documentacion', error: result.error);
      case Ok():
        _candidato = result.value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<VistaPreviaDocumentos>> _vistaPreviaDocumentos() async {
    final result = await _vacantesRepository.obtenerVistaPreviaDocumentos(candidatoId);
    if (result case Error()) {
      _log.warning('Failed to obtener vista previa de documentos', error: result.error);
    }
    return result;
  }

  Future<Result<AltaCompletada>> _completarAlta(CompletarAltaParams params) async {
    final result = await _vacantesRepository.completarAltaCandidato(candidatoId, params);
    switch (result) {
      case Error():
        _log.warning('Failed to completar alta', error: result.error);
      case Ok():
        final actual = _candidato;
        if (actual != null) {
          _candidato = actual.copyWith(
            estado: CandidatoEstado.contratado,
            empleado: result.value.empleadoId,
          );
        }
        // El Empleado se crea del lado del backend sin pasar por
        // EmpleadosRepository.createEmpleado -- hay que invalidar su cache
        // para que el expediente/la lista lo vean sin esperar a que expire.
        _empleadosRepository.invalidateCache();
    }
    notifyListeners();
    return result;
  }
}
