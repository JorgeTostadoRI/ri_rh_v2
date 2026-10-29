import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/credenciales_generadas/credenciales_generadas.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class EmpleadosRepository {
  Future<Result<List<Empleado>>> getEmpleados();

  Future<Result<Empleado>> getEmpleado(int id);

  /// Forces the next [getEmpleados]/[getEmpleado] call to fetch fresh data
  /// instead of returning a cached result.
  void invalidateCache();

  /// Transitions an empleado through its lifecycle (activo, proceso de
  /// finiquito, finiquitado). Returns a confirmation message from the
  /// backend (e.g. unpaid nominas removed as a side effect).
  Future<Result<String>> cambiarEstatus(int empleadoId, EmpleadoEstatus nuevoEstatus, {
    DateTime? fechaBaja,
    PlatformFile? cartaRenuncia,
    PlatformFile? finiquitoFirmado,
    PlatformFile? bajaImss,
    PlatformFile? comprobanteTransferencia,
    PlatformFile? convenioTerminacion,
  });

  /// Da de alta un nuevo Empleado. El backend crea y vincula un Usuarios
  /// automáticamente; si vino generado, el resultado trae
  /// `credencialesGeneradas` poblado (una sola vez).
  Future<Result<Empleado>> createEmpleado(EmpleadoCreateParams params);

  /// Catálogo de puestos disponibles para el formulario de alta.
  Future<Result<List<Puesto>>> getPuestos();

  /// Crea un puesto nuevo en el catálogo (para cuando no existe el que se
  /// necesita al dar de alta).
  Future<Result<Puesto>> createPuesto(
    String nombre,
    String tipos, {
    String? rol,
    String? responsabilidades,
    List<int>? departamentoIds,
    List<PreguntaPuesto>? preguntas,
  });

  /// Adjunta/reemplaza el archivo de tabulador salarial (Excel) de un
  /// puesto ya creado.
  Future<Result<Puesto>> uploadTabuladorSalarial(int puestoId, PlatformFile file);

  /// Edita un puesto existente del catálogo.
  Future<Result<Puesto>> updatePuesto(
    int id, {
    required String nombre,
    required String tipos,
    String? rol,
    String? responsabilidades,
    List<int>? departamentoIds,
    List<PreguntaPuesto>? preguntas,
  });

  /// Elimina un puesto del catálogo. Falla si tiene empleados o
  /// practicantes/residentes asignados (el backend lo protege).
  Future<Result<void>> deletePuesto(int id);

  /// Catálogo de departamentos, para asignarle uno al Usuarios que se crea
  /// al dar de alta.
  Future<Result<List<Departamento>>> getDepartamentos();

  /// Regenera la contraseña del Usuarios vinculado a este empleado,
  /// invalidando la anterior. Se muestra una sola vez.
  Future<Result<CredencialesGeneradas>> regenerarPassword(int empleadoId);

  /// Para la pestaña "Altas IMSS" de Reclutamiento: todos los empleados
  /// que vienen de una vacante, cada uno con su paso de Fase 2 (el envío al
  /// contador es automático cada viernes -- no hay botón manual).
  Future<Result<List<AltaImssItem>>> getAltasImssLista();

  /// Genera (o regenera) solo el PDF individual de "Solicitud de alta de
  /// trabajador" de un empleado, para revisar/descargar sin mandar nada.
  Future<Result<VistaPreviaAltaImss>> obtenerVistaPreviaAltaImss(int empleadoId);

  /// RH sube el acuse de aceptación de alta del IMSS que le mandó el
  /// contador por fuera del sistema -- se archiva en el expediente.
  Future<Result<void>> subirAltaImss(int empleadoId, PlatformFile archivo);

  /// Actividad 18: RH sube y archiva el contrato definitivo ya firmado
  /// (solo aplica a empleados con contrato "determinado", una vez vencido
  /// su periodo de prueba/capacitación).
  Future<Result<void>> subirContratoDefinitivo(int empleadoId, PlatformFile archivo);

  /// Actividad 15: cuántos empleados con contrato "determinado" están a 7
  /// días o menos de que venza su periodo de prueba/capacitación y todavía
  /// no contesta el jefe -- para el badge de "Reclutamiento" en el sidebar.
  Future<Result<int>> getEvaluacionesPendientesCount();

  /// Actividad 16: el jefe directo consulta, desde su propia pantalla,
  /// los datos de la evaluación pendiente de un empleado (por el token que
  /// le llegó por correo o por el botón "Evaluación pendiente" del panel
  /// de RH). `publica`: sin sesión, solo para la jefa que contesta desde el
  /// link del correo (ver ri_rh/evaluacion_sin_sesion.py en el backend).
  Future<Result<EvaluacionDetalle>> getEvaluacionDetalle(String token, {bool publica = false});

  /// Actividad 16: el jefe contesta -- la respuesta ejecuta directo la
  /// solicitud del contrato nuevo a los abogados, o el aviso de no
  /// renovación (que también arranca el proceso de baja). `motivo` es
  /// obligatorio cuando `respuesta` es `noRenovar`.
  Future<Result<void>> responderEvaluacion(String token, EvaluacionRespuesta respuesta, {String? motivo, bool publica = false});
}

/// Paso de "Fase 2" (seguimiento posterior a la contratación) en el que va
/// un empleado -- separado de los 6 pasos de reclutamiento (`CandidatoStage`).
/// Los pasos 3 (`evaluacionPendiente`/`evaluacionRespondida`) y 4
/// (`contratoFirmado`/`bajaIniciada`) solo aplican cuando
/// `AltaImssItem.fase2TotalSteps` es 4 (contrato "determinado"); con 2
/// pasos el seguimiento termina en `archivado`.
enum Fase2Stage {
  pendienteEnvio,
  enviado,
  archivado,
  evaluacionPendiente,
  evaluacionRespondida,
  contratoFirmado,
  bajaIniciada,
}

/// Actividad 16: respuesta del jefe directo sobre un contrato "determinado"
/// que está por vencer -- null mientras no haya contestado.
enum EvaluacionRespuesta { renovar, noRenovar }

typedef AltaImssItem = ({
  int id,
  String nombreCompleto,
  String puesto,
  DateTime fechaAlta,
  Fase2Stage fase2Stage,
  int fase2TotalSteps,
  DateTime? fechaVencimientoPeriodo,
  bool evaluacionPendiente,
  EvaluacionRespuesta? evaluacionRespuesta,
  String evaluacionMotivoNoRenovacion,
  DateTime? evaluacionRespondidaEn,
  String evaluacionToken,
});

typedef VistaPreviaAltaImss = ({String url, String nombreArchivo});

typedef EvaluacionDetalle = ({
  String nombreCompleto,
  String puesto,
  DateTime? fechaVencimientoPeriodo,
  EvaluacionRespuesta? evaluacionRespuesta,
  String evaluacionMotivoNoRenovacion,
  DateTime? evaluacionRespondidaEn,
});