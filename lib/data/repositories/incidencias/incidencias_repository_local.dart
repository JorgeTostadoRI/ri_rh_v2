import 'package:ri_rh_v2/config/incidencia_categories.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_pending_count_response.dart';
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
  Future<Result<List<Incidencia>>> getIncidenciasToReview(String category) async {
    final incidenciasToReview = _incidencias.where(
      (incidencia) {
        final isOfCategory = incidencia.categoryId == category;
        final isPending = incidencia.state == IncidenciaState.pending;
        return isOfCategory && isPending;
      }).toList();
    return Result.ok(incidenciasToReview);
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
  Future<Result<Incidencia>> rejectIncidencia(
    int id,
    {
      required String category,
      required String rejectionReason,
    }
  ) async {
    final index = _incidencias.indexWhere((x) => x.id == id && x.categoryId == category);
    if (index == -1) {
      return Result.error(Exception('Not found'));
    }
    final rejectedIncidencia = _incidencias[index].copyWith(
      state: IncidenciaState.rejected,
      revisor: null,
      rejectionReason: rejectionReason,
    );

    _incidencias[index] = rejectedIncidencia;
    return Result.ok(rejectedIncidencia);
  }

  @override
  Future<Result<IncidenciaPendingCountResponse>> getIncidenciasPendingCount() async {
    final currentUser = _authRepository.getCurrentUser();
    if (currentUser == null) {
      return Result.ok(
        IncidenciaPendingCountResponse(
          total: 0,
          permisos: 0,
          horasExtra: 0,
          vacaciones: 0,
          incapacidades: 0,
          requerimientosJudiciales: 0,
        )
      );
    }

    int permisos = 0;
    int horasExtra = 0;
    int vacaciones = 0;
    int incapacidades = 0;
    int requerimientos = 0;

    int total = _incidencias.fold(0, (sum, incidencia) {
      if (incidencia.state == IncidenciaState.pending && incidencia.revisor == currentUser) {
        sum += 1;
      }
      return sum;
    });

    for (final incidencia in _incidencias) {
      if (incidencia.state == IncidenciaState.pending && incidencia.revisor == currentUser) {
        switch (incidencia.categoryId) {
          case permisoCategory:
            permisos += 1;
          case horasExtraCategory:
            horasExtra += 1;
          case vacacionesCategory:
            vacaciones += 1;
          case incapacidadCategory:
            incapacidades += 1;
          case requerimientoJudicialCategory:
            requerimientos += 1;
        }
      }
    }

    return Result.ok(
      IncidenciaPendingCountResponse(
        total: total,
        permisos: permisos,
        horasExtra: horasExtra,
        vacaciones: vacaciones,
        incapacidades: incapacidades,
        requerimientosJudiciales: requerimientos,
      )
    );
  }
}