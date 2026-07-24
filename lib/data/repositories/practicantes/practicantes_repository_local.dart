import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/utils/result.dart';

class PracticantesRepositoryLocal extends PracticantesRepository {
  PracticantesRepositoryLocal({
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  @override
  Future<Result<List<Practicante>>> getPracticantes() async {
    final practicantes = await _localDataService.getPracticantes();
    return Result.ok(practicantes);
  }
}