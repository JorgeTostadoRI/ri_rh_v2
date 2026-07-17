import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/utils/result.dart';

class EmpleadosRepositoryRemote extends EmpleadosRepository {
  EmpleadosRepositoryRemote({
    required this._apiClient,
  });

  final ApiClient _apiClient;

  @override
  Future<Result<Empleado>> getEmpleado(int id) {
    return _apiClient.getEmpleado(id);
  }

  @override
  Future<Result<List<Empleado>>> getEmpleados() {
    return _apiClient.getEmpleados();
  }
}