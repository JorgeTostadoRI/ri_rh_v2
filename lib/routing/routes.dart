import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';

abstract final class Routes {
  static const home = '/';
  static const login = '/login';
  static const ingreso = '/ingreso';
  static const incidencias = '/incidencias';
  static const newIncidencia = ':categoriaId/new';
  static const avisos = '/avisos';
  static const empleados = '/empleados';
  static const expedienteEmpleado = ':empleadoId';
  static const huellas = '/huellas';
  static String newIncidenciaOfCategory(IncidenciaCategory category) => '$incidencias/${category.id}/new';
  static String expedienteOfEmpleado(Empleado empleado) => '$empleados/${empleado.id}';
  static String huellasOfEmpleado(Empleado empleado) => '$empleados/${empleado.id}/huellas';
}