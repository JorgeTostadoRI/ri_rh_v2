import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AsistenciaRepositoryLocal extends AsistenciaRepository {
  int _sequentialId = 0;
  String _asistenciaType = 'in';

  final _asistencias = List<Asistencia>.empty(growable: true);

  @override
  Future<Result<void>> createAsistencia(Asistencia asistencia) async {
    final asistenciaWithId = asistencia.copyWith(
      id: _sequentialId++,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      type: _asistenciaType,
      isLate: false,
    );
    _asistencias.add(asistenciaWithId);

    if (_asistenciaType == 'in') {
      _asistenciaType = 'out';
    } else {
      _asistenciaType = 'in';
    }

    return const Result.ok(null);
  }
}