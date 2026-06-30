import 'package:ri_rh_v2/data/repositories/avisos/avisos_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:table_calendar/table_calendar.dart';

class AvisosRepositoryLocal extends AvisosRepository {
  AvisosRepositoryLocal({
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  @override
  Future<Result<List<Aviso>>> getAvisos({DateTime? query}) async {
    var avisos = _localDataService.getAvisos();
    if (query != null) {
      avisos = avisos.where((e) => isSameDay(e.showAt, query)).toList();
    }
    return Result.ok(avisos);
  }
}