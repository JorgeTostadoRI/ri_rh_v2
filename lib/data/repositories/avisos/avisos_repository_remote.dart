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

  @override
  Future<Result<Aviso>> createAviso(Aviso aviso) async {
    return _apiClient.postAviso(aviso);
  }

  @override
  Future<Result<Aviso>> editAviso(Aviso aviso) async {
    return _apiClient.patchAviso(aviso);
  }

  @override
  Future<Result<void>> deleteAviso(int id) async {
    return _apiClient.deleteAviso(id);
  }
}