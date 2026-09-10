import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
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
}