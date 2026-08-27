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
  static const newIncidencia = ':categoriaId/new';
  static const avisos = '/avisos';
  static const empleados = '/empleados';
  static const expedienteEmpleado = ':empleadoId';
  static const huellas = 'huellas';
  static const practicantes = '/practicantes';
  static const expedientePracticante = ':practicanteId';
  static const reportes = '/reportes';
  static String newIncidenciaOfCategory(IncidenciaCategory category) => '$incidencias/${category.url}/new';
  static String expedienteOfEmpleado(Empleado empleado) => '$empleados/${empleado.base.id}';
  static String huellasOfEmpleado(Empleado empleado) => '$empleados/${empleado.base.id}/$huellas';
  static String expedienteOfPracticante(Practicante practicante) => '$practicantes/${practicante.base.id}';
  static String huellasOfPracticante(Practicante practicante) => '$practicantes/${practicante.base.id}/$huellas';
}