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
  Future<Result<Puesto>> createPuesto(String nombre, String tipos);

  /// Catálogo de departamentos, para asignarle uno al Usuarios que se crea
  /// al dar de alta.
  Future<Result<List<Departamento>>> getDepartamentos();

  /// Regenera la contraseña del Usuarios vinculado a este empleado,
  /// invalidando la anterior. Se muestra una sola vez.
  Future<Result<CredencialesGeneradas>> regenerarPassword(int empleadoId);
}