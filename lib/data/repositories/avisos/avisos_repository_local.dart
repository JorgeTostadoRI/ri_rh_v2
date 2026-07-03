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

  int _sequentialId = 0;
  bool _initialized = false;
  final _avisos = List<Aviso>.empty(growable: true);

  void _initializeData() {
    var avisos = _localDataService.getAvisos();
    _avisos.addAll(avisos);
    _sequentialId = _avisos.last.id ?? 0;
    _initialized = true;
  }

  @override
  Future<Result<List<Aviso>>> getAvisos({DateTime? query}) async {
    if (!_initialized) {
      _initializeData();
    }

    // copy the list
    List<Aviso> avisos = _avisos.toList();
    if (query != null) {
      avisos = avisos.where((e) => isSameDay(e.showAt, query)).toList();
    }
    return Result.ok(avisos);
  }

  @override
  Future<Result<Aviso>> createAviso(Aviso aviso) async {
    final result = aviso.copyWith(
      id: _sequentialId++,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      attachment: aviso.attachmentFile?.path,
      attachmentFile: null,
    );
    _avisos.add(result);
    return Result.ok(result);
  }

  @override
  Future<Result<Aviso>> editAviso(Aviso aviso) async {
    if (aviso.id == null) {
      return Result.error(Exception('Aviso must have an id'));
    }
    final index = _avisos.indexWhere((search) => search.id == aviso.id);
    if (index == -1) {
      return Result.error(Exception('Aviso not found'));
    }
    final result = aviso.copyWith(
      updatedAt: DateTime.now(),
      attachment: aviso.attachmentFile?.path,
      attachmentFile: null,
    );
    _avisos[index] = result;
    return Result.ok(aviso);
  }

  @override
  Future<Result<void>> deleteAviso(int id) async {
    _avisos.removeWhere((aviso) => aviso.id == id);
    return const Result.ok(null);
  }
}