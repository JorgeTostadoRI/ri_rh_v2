import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AsistenciaRepositoryLocal extends AsistenciaRepository {
  int _sequentialId = 0;
  AsistenciaType _asistenciaType = AsistenciaType.entry;

  final _asistencias = List<Asistencia>.empty(growable: true);

  @override
  Future<Result<Asistencia>> createAsistencia(Asistencia asistencia) async {
    final asistenciaWithId = asistencia.copyWith(
      id: _sequentialId++,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      type: _asistenciaType,
    );
    _asistencias.add(asistenciaWithId);

    if (_asistenciaType == AsistenciaType.entry) {
      _asistenciaType = AsistenciaType.exit;
    } else {
      _asistenciaType = AsistenciaType.entry;
    }

    return Result.ok(asistenciaWithId);
  }
}