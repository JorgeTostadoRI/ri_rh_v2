import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

class PracticantesRepositoryRemote extends PracticantesRepository {
  PracticantesRepositoryRemote({
    required this._log,
    required this._apiClient,
  });
  
  final AppLogger _log;
  final ApiClient _apiClient;

  List<User>? _cachedUsers;
  List<Puesto>? _cachedPuestos;
  List<Universidad>? _cachedUniversidades;

  @override
  Future<Result<List<Practicante>>> getPracticantes() async {
    try {
      await Future.wait([_cacheUsers(), _cachePuestos(), _cacheUniversidades()]);
    } on Exception catch (e) {
      _log.warning('Failed to cache dependencies for practicantes', error: e);
      return Result.error(e);
    }

    try {
      final resultPracticantes = await _apiClient.getPracticantes();
      switch (resultPracticantes) {
        case Error():
          _log.warning('Failed to fetch practicantes', error: resultPracticantes.error);
          return Result.error(resultPracticantes.error);
        case Ok():
      }
      final practicantes = resultPracticantes.value
      .map((apiPracticante) => Practicante.fromApiModel(
        model: apiPracticante,
        users: _cachedUsers!,
        universidades: _cachedUniversidades!,
        puestos: _cachedPuestos!,
      )).toList();
      return Result.ok(practicantes);
    } on Exception catch (e, stackTrace) {
      _log.error('Failed mapping practicantes', error: e, stackTrace: stackTrace);
      return Result.error(e);
    }
  }

  @override
  Future<Result<Practicante>> getPracticante(int id) async {
    try {
      await Future.wait([_cacheUsers(), _cachePuestos(), _cacheUniversidades()]);
    } on Exception catch (e) {
      return Result.error(e);
    }

    try {
      final resultPracticante = await _apiClient.getPracticante(id);
      switch (resultPracticante) {
        case Error():
          _log.warning('Failed to fetch practicante with ID $id', error: resultPracticante.error);
          return Result.error(resultPracticante.error);
        case Ok():
      }
      final practicante = Practicante.fromApiModel(
        model: resultPracticante.value,
        users: _cachedUsers!,
        puestos: _cachedPuestos!,
        universidades: _cachedUniversidades!,
      );
      return Result.ok(practicante);
    } on Exception catch (e, stackTrace) {
      _log.error('Failed mapping practicante', error: e, stackTrace: stackTrace);
      return Result.error(e);
    }
  }

  Future<void> _cacheUsers() async {
    if (_cachedUsers == null) {
      final resultUsers = await _apiClient.getUsers();
      switch (resultUsers) {
        case Error():
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
          throw resultPuestos.error;
        case Ok():
      }

      _cachedPuestos = resultPuestos.value;
    }
  }

  Future<void> _cacheUniversidades() async {
    if (_cachedUniversidades == null) {
      final resultUniversidades = await _apiClient.getUniversidades();
      switch (resultUniversidades) {
        case Error():
          throw resultUniversidades.error;
        case Ok():
      }

      _cachedUniversidades = resultUniversidades.value;
    }
  }

  @override
  void invalidateCache() {
    _cachedUsers = null;
  }
}