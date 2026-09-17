import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/credenciales_generadas/credenciales_generadas.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/utils/result.dart';

class EmpleadosRepositoryLocal extends EmpleadosRepository {
  EmpleadosRepositoryLocal({
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  bool _initialized = false;
  final List<Empleado> _empleados = List.empty(growable: true);

  Future<void> _initializeData() async {
    final empleados = await _localDataService.getEmpleados();
    _empleados.addAll(empleados);
    _initialized = true;
  }

  @override
  Future<Result<List<Empleado>>> getEmpleados() async {
    if (!_initialized) await _initializeData();

    final empleados = _empleados.toList();
    return Result.ok(empleados);
  }

  @override
  Future<Result<Empleado>> getEmpleado(int id) async {
    if (!_initialized) await _initializeData();

    final index = _empleados.indexWhere((emp) => emp.base.id == id);
    if (index == -1) {
      return Result.error(Exception('Not found'));
    }

    return Result.ok(_empleados[index]);
  }

  @override
  void invalidateCache() {
    _initialized = false;
    _empleados.clear();
  }

  @override
  Future<Result<String>> cambiarEstatus(int empleadoId, EmpleadoEstatus nuevoEstatus, {
    DateTime? fechaBaja,
    PlatformFile? cartaRenuncia,
    PlatformFile? finiquitoFirmado,
    PlatformFile? bajaImss,
    PlatformFile? comprobanteTransferencia,
    PlatformFile? convenioTerminacion,
  }) async {
    return const Result.ok('Estatus actualizado correctamente');
  }

  @override
  Future<Result<Empleado>> createEmpleado(EmpleadoCreateParams params) async {
    return Result.error(Exception('No soportado en modo local'));
  }

  @override
  Future<Result<List<Puesto>>> getPuestos() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<Puesto>> createPuesto(String nombre, String tipos) async {
    return Result.ok(Puesto(nombre: nombre, tipo: TipoPuesto.values.byName(tipos)));
  }

  @override
  Future<Result<List<Departamento>>> getDepartamentos() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<CredencialesGeneradas>> regenerarPassword(int empleadoId) async {
    return Result.error(Exception('No soportado en modo local'));
  }
}