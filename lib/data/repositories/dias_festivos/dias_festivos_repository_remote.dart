import 'package:ri_rh_v2/data/repositories/dias_festivos/dias_festivos_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/dias_festivos/dia_festivo.dart';
import 'package:ri_rh_v2/utils/result.dart';

class DiasFestivosRepositoryRemote extends DiasFestivosRepository {
  DiasFestivosRepositoryRemote({required this._apiClient});

  final ApiClient _apiClient;

  @override
  Future<Result<List<DiaFestivo>>> getDiasFestivos() async {
    return _apiClient.getDiasFestivos();
  }

  @override
  Future<Result<DiaFestivo>> createDiaFestivo(DiaFestivo diaFestivo) async {
    return _apiClient.postDiaFestivo(diaFestivo);
  }

  @override
  Future<Result<void>> deleteDiaFestivo(int id) async {
    return _apiClient.deleteDiaFestivo(id);
  }
}
