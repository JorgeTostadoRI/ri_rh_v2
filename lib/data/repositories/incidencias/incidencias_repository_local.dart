import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/utils/result.dart';

class IncidenciasRepositoryLocal extends IncidenciasRepository {
  int _sequentialId = 0;

  List<Incidencia> _incidencias = List<Incidencia>.empty(growable: true);

  @override
  Future<Result<void>> createIncidencia(Incidencia incidencia) async {
    final incidenciaWithId = incidencia.copyWith(
      id: _sequentialId++,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      state: IncidenciaState.pending,
      solicitor: 7,
      revisor: 10,
    );
    _incidencias.add(incidenciaWithId);
    return const Result.ok(null);
  }
}