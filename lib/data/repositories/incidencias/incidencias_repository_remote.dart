import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
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
}