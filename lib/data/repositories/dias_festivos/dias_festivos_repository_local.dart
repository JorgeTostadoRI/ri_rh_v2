import 'package:ri_rh_v2/data/repositories/dias_festivos/dias_festivos_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/dias_festivos/dia_festivo.dart';
import 'package:ri_rh_v2/utils/result.dart';

class DiasFestivosRepositoryLocal extends DiasFestivosRepository {
  DiasFestivosRepositoryLocal({required this._localDataService});

  final LocalDataService _localDataService;

  int _sequentialId = 0;
  bool _initialized = false;
  final _diasFestivos = List<DiaFestivo>.empty(growable: true);

  void _initializeData() {
    final diasFestivos = _localDataService.getDiasFestivos();
    _diasFestivos.addAll(diasFestivos);
    _sequentialId = _diasFestivos.isEmpty ? 0 : (_diasFestivos.last.id ?? 0);
    _initialized = true;
  }

  @override
  Future<Result<List<DiaFestivo>>> getDiasFestivos() async {
    if (!_initialized) {
      _initializeData();
    }
    return Result.ok(_diasFestivos.toList());
  }

  @override
  Future<Result<DiaFestivo>> createDiaFestivo(DiaFestivo diaFestivo) async {
    final result = diaFestivo.copyWith(
      id: ++_sequentialId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _diasFestivos.add(result);
    return Result.ok(result);
  }

  @override
  Future<Result<void>> deleteDiaFestivo(int id) async {
    _diasFestivos.removeWhere((diaFestivo) => diaFestivo.id == id);
    return const Result.ok(null);
  }
}
