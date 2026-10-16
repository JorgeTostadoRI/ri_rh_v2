import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato_detalle.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/utils/result.dart';

class VacantesRepositoryLocal extends VacantesRepository {
  int _sequentialId = 0;
  final _solicitudes = List<SolicitudVacante>.empty(growable: true);
  final _candidatosDetalle = <int, CandidatoDetalle>{};

  @override
  Future<Result<List<SolicitudVacante>>> getSolicitudes() async {
    return Result.ok(_solicitudes.toList());
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
    final result = SolicitudVacante(
      id: ++_sequentialId,
      puesto: puestoId,
      rol: rol,
      cantidad: cantidad,
      area: area,
      turno: turnoId,
      justificacion: justificacion,
      createdAt: DateTime.now(),
    );
    _solicitudes.add(result);
    return Result.ok(result);
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
    final index = _solicitudes.indexWhere((s) => s.id == id);
    if (index == -1) return Result.error(Exception('Not found'));
    final updated = _solicitudes[index].copyWith(
      puesto: puestoId,
      rol: rol,
      cantidad: cantidad,
      area: area,
      turno: turnoId,
      justificacion: justificacion,
    );
    _solicitudes[index] = updated;
    return Result.ok(updated);
  }

  @override
  Future<Result<SolicitudVacante>> cambiarEstatus(int id, String estatus) async {
    final index = _solicitudes.indexWhere((s) => s.id == id);
    if (index == -1) return Result.error(Exception('Not found'));
    final updated = _solicitudes[index].copyWith(estatus: EstatusVacante.values.byName(estatus));
    _solicitudes[index] = updated;
    return Result.ok(updated);
  }

  @override
  Future<Result<SolicitudVacante>> iniciarCandidato({
    required int id,
    required String nombre,
    required String correo,
    required PlatformFile cartaOferta,
  }) async {
    final index = _solicitudes.indexWhere((s) => s.id == id);
    if (index == -1) return Result.error(Exception('Not found'));
    final updated = _solicitudes[index].copyWith(
      candidatos: [
        ..._solicitudes[index].candidatos,
        Candidato(nombre: nombre, correo: correo, createdAt: DateTime.now()),
      ],
    );
    _solicitudes[index] = updated;
    return Result.ok(updated);
  }

  @override
  Future<Result<CandidatoDetalle>> getCandidatoDetalle(int id) async {
    final candidato = _candidatosDetalle[id] ?? CandidatoDetalle(id: id, nombre: '', correo: '');
    return Result.ok(candidato);
  }

  @override
  Future<Result<CandidatoDetalle>> actualizarDetalleContratacion(DetalleContratacionParams params) async {
    final actual = _candidatosDetalle[params.id] ?? CandidatoDetalle(id: params.id, nombre: '', correo: '');
    final actualizado = actual.copyWith(
      salarioDiario: params.salarioDiario,
      fechaIngreso: params.fechaIngreso,
      tipoContrato: params.tipoContrato,
      periodoTipo: params.periodoTipo,
      tipoJornada: params.tipoJornada,
      rotacionDetalle: params.rotacionDetalle,
      diasLaborados: params.diasLaborados,
      diaDescanso: params.diaDescanso,
      horaEntrada: params.horaEntrada,
      horaComidaInicio: params.horaComidaInicio,
      horaComidaFin: params.horaComidaFin,
      horaSalida: params.horaSalida,
      formaPago: params.formaPago,
      modalidadPago: params.modalidadPago,
      bonoAsistencia: params.bonoAsistencia,
      bonoPuntualidad: params.bonoPuntualidad,
      valesDespensaMonedero: params.valesDespensaMonedero,
      percibeComisiones: params.percibeComisiones,
      comisionesDetalle: params.comisionesDetalle,
      herramientas: params.herramientas,
      entregaEquipo: params.entregaEquipo,
      equiposEntregados: params.equiposEntregados,
    );
    _candidatosDetalle[params.id] = actualizado;
    return Result.ok(actualizado);
  }

  @override
  Future<Result<CandidatoDetalle>> solicitarContrato(int id) async {
    final actual = _candidatosDetalle[id] ?? CandidatoDetalle(id: id, nombre: '', correo: '');
    final actualizado = actual.copyWith(contratoSolicitadoEn: DateTime.now());
    _candidatosDetalle[id] = actualizado;
    return Result.ok(actualizado);
  }

  @override
  Future<Result<CandidatoDetalle>> rechazarDocumentacion(int id, String motivo) async {
    final actual = _candidatosDetalle[id] ?? CandidatoDetalle(id: id, nombre: '', correo: '');
    final actualizado = actual.copyWith(estado: CandidatoEstado.iniciado, motivoRechazoRh: motivo);
    _candidatosDetalle[id] = actualizado;
    return Result.ok(actualizado);
  }

  @override
  Future<Result<VistaPreviaDocumentos>> obtenerVistaPreviaDocumentos(int id) async {
    return Result.ok((url: 'https://example.com/fake.docx', nombreArchivo: 'fake.docx'));
  }
}
