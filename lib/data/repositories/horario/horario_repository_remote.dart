import 'package:ri_rh_v2/data/repositories/horario/horario_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/utils/result.dart';

class HorarioRepositoryRemote extends HorarioRepository {
  HorarioRepositoryRemote({
    required this._apiClient,
  });

  final ApiClient _apiClient;

  List<Horario>? _cachedHorarios;

  @override
  Future<Result<List<Horario>>> getHorarios() async {
    if (_cachedHorarios == null) {
      final result = await _apiClient.getHorarios();
      switch (result) {
        case Error():
          return Result.error(result.error);
        case Ok():
      }
      _cachedHorarios = result.value;
    }

    return Result.ok(_cachedHorarios!);
  }
}