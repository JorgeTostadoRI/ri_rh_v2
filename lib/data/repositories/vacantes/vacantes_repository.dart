import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/domain/models/credenciales_generadas/credenciales_generadas.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato_detalle.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/utils/result.dart';

typedef DetalleContratacionParams = ({
  int id,
  double? salarioDiario,
  double? montoRetencionInfonavit,
  DateTime? fechaIngreso,
  String tipoContrato,
  /// Solo para tipoContrato "determinado".
  int? duracionDias,
  String tipoJornada,
  String rotacionDetalle,
  String diasLaborados,
  String diaDescanso,
  String? horaEntrada,
  String? horaComidaInicio,
  String? horaComidaFin,
  String? horaSalida,
  String formaPago,
  String modalidadPago,
  String bonoAsistencia,
  String bonoPuntualidad,
  bool? valesDespensaMonedero,
  bool? percibeComisiones,
  String comisionesDetalle,
  String herramientas,
  bool entregaEquipo,
  List<CandidatoEquipo> equiposEntregados,
});

abstract class VacantesRepository {
  /// Solicitudes de vacante hechas por el usuario en sesión (Dirección/admin
  /// ve todas; cualquier otro líder solo ve las propias — lo decide el
  /// backend).
  Future<Result<List<SolicitudVacante>>> getSolicitudes();

  /// Cuántas solicitudes esperan que Dirección las apruebe o rechace -- la
  /// notificación de "Reclutamiento" de Dirección (solo Dirección).
  Future<Result<int>> getSolicitudesPendientesCount();

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

  /// Solo en la contratación de un practicante: en vez de aprobar o
  /// rechazar, Dirección le regresa la evaluación al jefe con un comentario.
  Future<Result<SolicitudVacante>> retroalimentar(int id, String comentario);

  /// Dirección ya aprobó contratar a un practicante: RH le manda el link al
  /// portal, prellenado con su expediente (en vez de "Iniciar candidato").
  Future<Result<SolicitudVacante>> iniciarContratacionPracticante({
    required int id,
    required String correo,
    required PlatformFile cartaOferta,
  });

  /// Fase F: detalle completo de un candidato (sus datos/documentos ya
  /// llenados, de solo lectura, más los "Detalles de contratación") para
  /// que RH lo revise.
  Future<Result<CandidatoDetalle>> getCandidatoDetalle(int id);

  /// Guarda los "Detalles de contratación" que RH llena antes de solicitar
  /// el contrato (salario, fecha de alta, horario, equipo a entregar, etc.).
  Future<Result<CandidatoDetalle>> actualizarDetalleContratacion(DetalleContratacionParams params);

  /// Genera la solicitud de contrato (y el Anexo II si aplica) y los manda
  /// por correo a los abogados. Solo se puede hacer una vez por candidato.
  Future<Result<CandidatoDetalle>> solicitarContrato(int id);

  /// Rechaza manualmente la documentación de un candidato ya completado
  /// (independiente de la IA) -- lo regresa a "iniciado", con el link
  /// reabierto y el motivo visible para que lo corrija.
  Future<Result<CandidatoDetalle>> rechazarDocumentacion(int id, String motivo);

  /// Genera la Solicitud de contrato (y el Anexo II si aplica) con lo que
  /// ya esté guardado y regresa dónde descargarlos -- para que RH los
  /// revise antes de decidir solicitar el contrato de verdad. No manda
  /// correo ni marca nada, se puede llamar las veces que haga falta.
  Future<Result<VistaPreviaDocumentos>> obtenerVistaPreviaDocumentos(int id);

  /// Fase G: RH sube el contrato ya firmado -- crea el Empleado (y su
  /// Usuarios vinculado) real a partir de todo lo que el candidato ya trae.
  /// Rol y departamento(s) no se piden aquí, el backend los resuelve solo
  /// desde la solicitud/puesto. Solo se puede hacer una vez por candidato.
  Future<Result<AltaCompletada>> completarAltaCandidato(int id, CompletarAltaParams params);
}

typedef VistaPreviaDocumentos = ({String url, String nombreArchivo});

typedef CompletarAltaParams = ({PlatformFile contratoFirmado, DateTime? fechaAlta});

typedef AltaCompletada = ({int empleadoId, String nombreCompleto, CredencialesGeneradas? credenciales});
