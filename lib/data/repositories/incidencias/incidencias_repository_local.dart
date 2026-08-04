import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia_query.dart';
import 'package:ri_rh_v2/utils/result.dart';

class IncidenciasRepositoryLocal extends IncidenciasRepository {
  final AuthRepository _authRepository;
  final LocalDataService _localDataService;
  
  IncidenciasRepositoryLocal({
    required this._authRepository,
    required this._localDataService,
  });

  int _sequentialId = 0;

  final List<Incidencia> _incidencias = List<Incidencia>.empty(growable: true);

  @override
  Future<Result<void>> createIncidencia(Incidencia incidencia) async {
    final currentUser = _authRepository.getCurrentUser();
    if (currentUser == null) {
      return Result.error(Exception('Not logged in'));
    }
    final users = _localDataService.getUsers();

    final incidenciaWithId = incidencia.copyWith(
      id: _sequentialId++,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      state: IncidenciaState.pending,
      solicitor: currentUser,
      revisor: users.last,
    );
    _incidencias.add(incidenciaWithId);
    return const Result.ok(null);
  }

  @override
  Future<Result<List<Incidencia>>> getIncidencias(String category, {IncidenciaQuery? query}) async {
    final incidenciasOfCategory = _incidencias.where((incidencia) => incidencia.categoryId == category).toList();
    return Result.ok(incidenciasOfCategory);
  }

  @override
  Future<Result<Incidencia>> approveIncidencia(String category, int id) async {
    final index = _incidencias.indexWhere((x) => x.id == id && x.categoryId == category);
    if (index == -1) {
      return Result.error(Exception('Not found'));
    }
    final approvedIncidencia = _incidencias[index].copyWith(
      state: IncidenciaState.approved,
      revisor: null,
    );

    _incidencias[index] = approvedIncidencia;
    return Result.ok(approvedIncidencia);
  }

  @override
  Future<Result<Incidencia>> rejectIncidencia(String category, int id) async {
    final index = _incidencias.indexWhere((x) => x.id == id && x.categoryId == category);
    if (index == -1) {
      return Result.error(Exception('Not found'));
    }
    final rejectedIncidencia = _incidencias[index].copyWith(
      state: IncidenciaState.rejected,
      revisor: null,
    );

    _incidencias[index] = rejectedIncidencia;
    return Result.ok(rejectedIncidencia);
  }
}