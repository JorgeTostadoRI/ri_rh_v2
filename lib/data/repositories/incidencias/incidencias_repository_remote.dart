import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia_query.dart';
import 'package:ri_rh_v2/utils/result.dart';

class IncidenciasRepositoryRemote extends IncidenciasRepository {
  IncidenciasRepositoryRemote({
    required this._apiClient,
  });

  final ApiClient _apiClient;

  @override
  Future<Result<Incidencia>> createIncidencia(Incidencia incidencia) async {
    try {
      return _apiClient.postIncidencia(incidencia);
    } on Exception catch(error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<Incidencia>>> getIncidencias(String category, {IncidenciaQuery? query}) async {
    final resultIncidencias = await _apiClient.getIncidencias(category, query: query);
    switch (resultIncidencias) {
      case Error():
        return Result.error(resultIncidencias.error);
      case Ok():
    }

    final incidencias = resultIncidencias.value
      .map((incidencia) => incidencia.copyWith(categoryId: category))
      .toList();
    return Result.ok(incidencias);
  }
}