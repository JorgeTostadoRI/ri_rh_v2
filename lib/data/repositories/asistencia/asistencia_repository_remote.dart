import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/asistencia/asistencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AsistenciaRepositoryRemote implements AsistenciaRepository {
  AsistenciaRepositoryRemote({
    required this._apiClient,
  });

  final ApiClient _apiClient;

  @override
  Future<Result<Asistencia>> createAsistencia(Asistencia asistencia) async {
    try {
      final asistenciaApiModel = AsistenciaApiModel(
        photoFile: asistencia.photoFile,
        userRef: asistencia.user.id,
      );

      final result = await _apiClient.postAsistencia(asistenciaApiModel);
      switch (result) {
        case Ok():
          final createdAsistencia = Asistencia.fromApiModel(result.value, user: asistencia.user);
          return Result.ok(createdAsistencia);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch(error) {
      return Result.error(error);
    }
  }
}