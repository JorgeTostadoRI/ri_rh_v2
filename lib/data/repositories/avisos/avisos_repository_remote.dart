import 'package:ri_rh_v2/data/repositories/avisos/avisos_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AvisosRepositoryRemote extends AvisosRepository {
  AvisosRepositoryRemote({
    required this._apiClient,
  });

  final ApiClient _apiClient;

  @override
  Future<Result<List<Aviso>>> getAvisos({DateTime? query}) async {
    return _apiClient.getAvisos(query: query);
  }
}