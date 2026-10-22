import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';

abstract final class Routes {
  static const home = '/';
  static const login = '/login';
  static const ingreso = '/ingreso';
  static const ingresoManual = '$ingreso/manual';
  static const incidencias = '/incidencias';
  static const pendingIncidencias = '$incidencias-pending';
  static const misIncidencias = '$incidencias-mine';
  static const newIncidencia = ':categoriaId/new';
  static const avisos = '/avisos';
  static const empleados = '/empleados';
  static const newEmpleado = 'new';
  static const expedienteEmpleado = ':empleadoId';
  static const huellas = 'huellas';
  static const practicantes = '/practicantes';
  static const newPracticante = 'new';
  static const expedientePracticante = ':practicanteId';
  static const reportes = '/reportes';
  static const diasFestivos = '/dias-festivos';
  static const reclutamiento = '/reclutamiento';
  static const revisionCandidato = 'candidatos/:candidatoId';
  static const evaluacion = '/evaluacion';
  static const evaluacionToken = ':token';
  static String newIncidenciaOfCategory(IncidenciaCategory category) => '$incidencias/${category.url}/new';
  static String expedienteOfEmpleado(Empleado empleado) => '$empleados/${empleado.base.id}';
  static String expedienteOfEmpleadoId(int empleadoId) => '$empleados/$empleadoId';
  static String huellasOfEmpleado(Empleado empleado) => '$empleados/${empleado.base.id}/$huellas';
  static String expedienteOfPracticante(Practicante practicante) => '$practicantes/${practicante.base.id}';
  static String huellasOfPracticante(Practicante practicante) => '$practicantes/${practicante.base.id}/$huellas';
  static String revisionOfCandidato(int candidatoId) => '$reclutamiento/candidatos/$candidatoId';
  static String evaluacionOfToken(String token) => '$evaluacion/$token';
}