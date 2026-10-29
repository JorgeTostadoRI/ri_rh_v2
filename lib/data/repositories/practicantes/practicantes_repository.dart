import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/credenciales_generadas/credenciales_generadas.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class PracticantesRepository {
  /// List practicantes.
  Future<Result<List<Practicante>>> getPracticantes();

  /// Retrieve practicante.
  Future<Result<Practicante>> getPracticante(int id);

  /// Forces the next [getPracticantes]/[getPracticante] call to fetch fresh
  /// data instead of returning a cached result.
  void invalidateCache();

  /// Transitions a practicante/residente between alta and baja. Returns a
  /// confirmation message from the backend (e.g. unpaid nominas removed as
  /// a side effect).
  Future<Result<String>> cambiarEstado(int practicanteId, StatusPracticante nuevoEstado, {
    DateTime? fechaBaja,
    PlatformFile? cartaLiberacion,
  });

  /// Da de alta un nuevo Practicante/Residente. El backend crea y vincula un
  /// Usuarios automáticamente; si vino generado, el resultado trae
  /// `credencialesGeneradas` poblado (una sola vez).
  Future<Result<Practicante>> createPracticante(PracticanteCreateParams params);

  /// Catálogos disponibles para el formulario de alta.
  Future<Result<List<Puesto>>> getPuestos();
  Future<Result<List<Universidad>>> getUniversidades();

  /// Crea un puesto/universidad nuevo en el catálogo (para cuando no existe
  /// el que se necesita al dar de alta).
  Future<Result<Puesto>> createPuesto(String nombre, String tipos);
  Future<Result<Universidad>> createUniversidad(String nombre, String direccion, String numeroContacto);

  /// Catálogo de departamentos, para asignarle uno al Usuarios que se crea
  /// al dar de alta.
  Future<Result<List<Departamento>>> getDepartamentos();

  /// Asigna la fecha de terminación a un practicante que todavía no la tiene
  /// (solo RH, una sola vez -- el backend lo valida).
  Future<Result<void>> asignarFechaTerminacion(int practicanteId, DateTime fecha);

  /// Regenera la contraseña del Usuarios vinculado a este practicante,
  /// invalidando la anterior. Se muestra una sola vez.
  Future<Result<CredencialesGeneradas>> regenerarPassword(int practicanteId);

  /// El jefe directo consulta la evaluación de un practicante por terminar
  /// sus prácticas (por el token que le llegó por correo). El backend
  /// responde 403 si quien la abre no es su jefe directo. `publica`: sin
  /// sesión, solo para la jefa que contesta desde el link del correo.
  Future<Result<EvaluacionPracticanteDetalle>> getEvaluacion(String token, {bool publica = false});

  /// El jefe directo contesta. `motivo` es obligatorio cuando `respuesta`
  /// es `terminar`; `contratacion` (puesto, rol y justificación) cuando es
  /// `contratar` -- con eso se le crea la solicitud a Dirección.
  Future<Result<void>> responderEvaluacion(
    String token,
    EvaluacionPracticanteRespuesta respuesta, {
    String? motivo,
    PropuestaContratacion? contratacion,
    bool publica = false,
  });

  /// Pestaña "Practicantes" de Reclutamiento (solo RH): practicantes en
  /// alta con fecha de terminación y en qué va su evaluación.
  Future<Result<List<SeguimientoPracticanteItem>>> getSeguimientoEvaluaciones();

  /// Practicantes de los que el usuario en sesión es jefe directo y que
  /// esperan su evaluación.
  Future<Result<List<PracticantePorEvaluarItem>>> getMisEvaluacionesPendientes();
}

/// Lo que propone el jefe al contestar "contratar" -- va a Dirección como
/// solicitud de vacante.
typedef PropuestaContratacion = ({int puestoId, String rol, String justificacion});

/// Respuesta del jefe directo en la evaluación de un practicante por
/// terminar sus prácticas -- null mientras no contesta.
enum EvaluacionPracticanteRespuesta { contratar, terminar }

/// En qué va un practicante con fecha de terminación: todavía lejos de
/// terminar (`enCurso`), a 7 días o menos sin respuesta del jefe
/// (`evaluacionPendiente`), o ya con su respuesta.
enum EtapaSeguimientoPracticante { enCurso, evaluacionPendiente, contratar, terminar }

typedef EvaluacionPracticanteDetalle = ({
  String nombreCompleto,
  String tipo,
  String puesto,
  DateTime? fechaTerminacion,
  EvaluacionPracticanteRespuesta? evaluacionRespuesta,
  String evaluacionMotivo,
  DateTime? evaluacionRespondidaEn,
  // Para contestar "contratar": catálogo de puestos y lo prellenado (lo que
  // ya tiene, o lo que propuso si Dirección se lo regresó).
  List<({int id, String nombre, String? rol})> puestos,
  int? puestoId,
  String? rol,
  String justificacion,
  // Estatus de la solicitud a Dirección ('pendiente', 'aceptada',
  // 'rechazada', 'retroalimentacion'), null si todavía no hay.
  String? solicitudEstatus,
  String comentarioDireccion,
  // False si su jefe es de Dirección: su "contratar" ya va aprobado.
  bool requiereAprobacionDireccion,
});

typedef PracticantePorEvaluarItem = ({
  int id,
  String nombreCompleto,
  String tipo,
  String puesto,
  DateTime fechaTerminacion,
  String evaluacionToken,
});

typedef SeguimientoPracticanteItem = ({
  int id,
  String nombreCompleto,
  String tipo,
  String puesto,
  String jefe,
  DateTime fechaTerminacion,
  EtapaSeguimientoPracticante etapa,
  DateTime? evaluacionNotificadaEn,
  String evaluacionMotivo,
  DateTime? evaluacionRespondidaEn,
  // Su contratación: la solicitud a Dirección ('pendiente', 'aceptada',
  // 'rechazada', 'retroalimentacion') y, ya aprobada, el candidato
  // ('iniciado' / 'completado'). Null mientras no existan.
  String? solicitudEstatus,
  String comentarioDireccion,
  String? candidatoEstado,
  bool contratoSolicitado,
});
