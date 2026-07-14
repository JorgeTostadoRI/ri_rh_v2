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

  void _initializeData() {
    final empleados = _localDataService.getEmpleados();
    _empleados.addAll(empleados);
    _initialized = true;
  }

  @override
  Future<Result<List<Empleado>>> getEmpleados() async {
    if (!_initialized) _initializeData();

    final empleados = _empleados.toList();
    return Result.ok(empleados);
  }
}