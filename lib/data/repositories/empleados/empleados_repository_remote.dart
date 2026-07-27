import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

class EmpleadosRepositoryRemote extends EmpleadosRepository {
  EmpleadosRepositoryRemote({
    required this._log,
    required this._apiClient,
  });

  final AppLogger _log;
  final ApiClient _apiClient;

  List<Puesto>? _cachedPuestos;
  List<User>? _cachedUsers;
  List<Empleado>? _cachedEmpleados;
  DateTime _cacheTime = DateTime(1970, 01, 01);


  @override
  Future<Result<Empleado>> getEmpleado(int id) async {
    if (!isEmpleadosCacheExpired) {
      final index = _cachedEmpleados!.indexWhere((emp) => emp.base.id == id);
      if (index == -1) {
        return Result.error(Exception('Empleado not found'));
      }

      return Result.ok(_cachedEmpleados![index]);
    }

    await Future.wait([_cachePuestos(), _cacheUsers()]);

    final resultEmpleado = await _apiClient.getEmpleado(id);
    switch (resultEmpleado) {
      case Error():
        _log.warning('Failed to fetch empleados', error: resultEmpleado.error);
        return Result.error(resultEmpleado.error);
      case Ok():
    }

    final empleado = Empleado.fromApiModel(
      model: resultEmpleado.value,
      users: _cachedUsers!,
      puestos: _cachedPuestos!,
    );
    return Result.ok(empleado);
  }

  @override
  Future<Result<List<Empleado>>> getEmpleados() async {
    if (!isEmpleadosCacheExpired) {
      return Result.ok(_cachedEmpleados!);
    }

    try {
      await Future.wait([_cachePuestos(), _cacheUsers()]);
    } on Exception catch (e) {
      return Result.error(e);
    }

    final result = await _apiClient.getEmpleados();
    switch(result) {
      case Error():
        _cachedEmpleados = null;
        return Result.error(result.error);
      case Ok():
    }

    _cachedEmpleados = result.value
    .map((apiEmpleado) => Empleado.fromApiModel(
      model: apiEmpleado,
      users: _cachedUsers!,
      puestos: _cachedPuestos!,
    )).toList();
    _cacheTime = DateTime.now();

    return Result.ok(_cachedEmpleados!);
  }

  Future<void> _cacheUsers() async {
    if (_cachedUsers == null) {
      final resultUsers = await _apiClient.getUsers();
      switch (resultUsers) {
        case Error():
          _log.warning('Failed to fetch users for empleados', error: resultUsers.error);
          throw resultUsers.error;
        case Ok():
      }
      _cachedUsers = resultUsers.value;
    }
  }

  Future<void> _cachePuestos() async {
    if (_cachedPuestos == null) {
      final resultPuestos = await _apiClient.getPuestos();
      switch (resultPuestos) {
        case Error():
          _log.warning('Failed to fetch puestos for empleados', error: resultPuestos.error);
          throw resultPuestos.error;
        case Ok():
      }
      _cachedPuestos = resultPuestos.value;
    }
  }

  bool get isEmpleadosCacheExpired {
    return _cachedEmpleados == null || _cacheTime.difference(DateTime.now()).abs().inMinutes > 5;
  } 
}