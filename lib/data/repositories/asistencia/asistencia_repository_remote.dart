import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/asistencia/asistencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AsistenciaRepositoryRemote implements AsistenciaRepository {
  AsistenciaRepositoryRemote({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<void>> createAsistencia(Asistencia asistencia) async {
    try {
      final asistenciaApiModel = AsistenciaApiModel(
        photo: asistencia.photo,
        empleado: asistencia.empleado,
      );

      return _apiClient.postAsistencia(asistenciaApiModel);
    } on Exception catch(error) {
      return Result.error(error);
    }
  }
}