import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/utils/result.dart';

class PracticantesRepositoryLocal extends PracticantesRepository {
  PracticantesRepositoryLocal({
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  List<Practicante>? _cachedPracticantes = [];

  @override
  Future<Result<List<Practicante>>> getPracticantes() async {
    final practicantes = await _localDataService.getPracticantes();
    _cachedPracticantes = practicantes;
    return Result.ok(practicantes);
  }

  @override
  Future<Result<Practicante>> getPracticante(int id) async {
    if (_cachedPracticantes == null) {
      final resultPracticantes = await getPracticantes();
      switch (resultPracticantes) {
        case Error():
          return Result.error(resultPracticantes.error);
        case Ok():
      }
    }

    final index = _cachedPracticantes!.indexWhere((practicante) => practicante.base.id == id);
    if (index == -1) {
      return Result.error(Exception('Practicante not found'));
    }

    return Result.ok(_cachedPracticantes![index]);
  }

  @override
  void invalidateCache() {
    _cachedPracticantes = null;
  }
}