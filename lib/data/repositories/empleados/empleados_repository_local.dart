import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
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
}