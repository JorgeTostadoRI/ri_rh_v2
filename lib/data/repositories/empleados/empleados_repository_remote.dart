import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/utils/result.dart';

class EmpleadosRepositoryRemote extends EmpleadosRepository {
  EmpleadosRepositoryRemote({
    required this._apiClient,
  });

  final ApiClient _apiClient;

  List<Empleado>? _empleados;
  DateTime _cacheTime = DateTime(1970, 01, 01);

  @override
  Future<Result<Empleado>> getEmpleado(int id) {
    return _apiClient.getEmpleado(id);
  }

  @override
  Future<Result<List<Empleado>>> getEmpleados() async {
    if (_empleados == null || _cacheTime.difference(DateTime.now()).abs().inMinutes > 5) {
      final result = await _apiClient.getEmpleados();
      switch(result) {
        case Ok():
          _empleados = result.value;
          _cacheTime = DateTime.now();
        case Error():
          _empleados = null;
          return result;
      }
    }

    return Result.ok(_empleados!);
  }
}