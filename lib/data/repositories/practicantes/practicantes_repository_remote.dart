import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/utils/result.dart';

class PracticantesRepositoryRemote extends PracticantesRepository {
  PracticantesRepositoryRemote({
    required this._log,
    required this._apiClient,
  });
  
  final AppLogger _log;
  final ApiClient _apiClient;

  List<Puesto>? _cachedPuestos;
  List<Universidad>? _cachedUniversidades;

  @override
  Future<Result<List<Practicante>>> getPracticantes() async {
    try {
      if (_cachedPuestos == null) {
        final resultPuestos = await _apiClient.getPuestos();
        switch (resultPuestos) {
          case Error():
            return Result.error(resultPuestos.error);
          case Ok():
        }

        _cachedPuestos = resultPuestos.value;
      }

      if (_cachedUniversidades == null) {
        final resultUniversidades = await _apiClient.getUniversidades();
        switch (resultUniversidades) {
          case Error():
            return Result.error(resultUniversidades.error);
          case Ok():
        }

        _cachedUniversidades = resultUniversidades.value;
      }

      final resultPracticantes = await _apiClient.getPracticantes();
      switch (resultPracticantes) {
        case Error():
          _log.warning('PracticantesRepository | Failed to get practicantes', error: resultPracticantes.error);
          return Result.error(resultPracticantes.error);
        case Ok():
      }
      final practicantes = resultPracticantes.value
      .map((apiPracticante) => Practicante.fromApiModel(
        model: apiPracticante,
        universidades: _cachedUniversidades!,
        puestos: _cachedPuestos!,
      )).toList();
      return Result.ok(practicantes);
    } on Exception catch (e) {
      _log.error('PracticantesRepository | Error getting practicantes', error: e);
      return Result.error(e);
    }
  }
}