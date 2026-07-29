import 'package:ri_rh_v2/data/repositories/horario/horario_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/utils/result.dart';

class HorarioRepositoryLocal extends HorarioRepository {
  HorarioRepositoryLocal({
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  @override
  Future<Result<List<Horario>>> getHorarios() async {
    final horarios = _localDataService.getHorarios();
    return Result.ok(horarios);
  }
}