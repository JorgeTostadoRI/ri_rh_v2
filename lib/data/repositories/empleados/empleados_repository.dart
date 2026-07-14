import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class EmpleadosRepository {
  Future<Result<List<Empleado>>> getEmpleados();

  Future<Result<Empleado>> getEmpleado(int id);
}