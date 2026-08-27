import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia/incidencia_query.dart';
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

    final incidenciaWithId = incidencia.copyWith(
      id: _sequentialId++,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      state: IncidenciaState.pending,
      solicitor: currentUser,
    );
    _incidencias.add(incidenciaWithId);
    return const Result.ok(null);
  }

  @override
  Future<Result<List<Incidencia>>> getIncidencias({IncidenciaQuery? query}) async {
    final incidenciasOfCategory = _incidencias;
    return Result.ok(incidenciasOfCategory);
  }

  @override
  Future<Result<List<Incidencia>>> getIncidenciasToReview({IncidenciaQuery? query}) async {
    final currentUser = _authRepository.getCurrentUser();
    if (currentUser == null) {
      return Result.error(Exception('Not logged in'));
    }

    late List<Incidencia> incidenciasToReview;
    if ((await _authRepository.isRH) && currentUser.rol == 'LIDER') {
      incidenciasToReview = _incidencias.where((incidencia) {
        final isPending = incidencia.state == IncidenciaState.pending;
        final approvedByBoss = incidencia.approvedBy != null;
        final awaitingRHApproval = incidencia.rhApprovedBy == null;

        return isPending && approvedByBoss && awaitingRHApproval;
      }).toList();
    } else {
      incidenciasToReview = _incidencias.where((incidencia) {
        final isPending = incidencia.state == IncidenciaState.pending;
        final awaitingBossApproval = incidencia.approvedBy == null;
        final isNotSolicitor = incidencia.solicitor!.id != currentUser.id;

        return isPending && awaitingBossApproval && isNotSolicitor;
      }).toList();
    }
    return Result.ok(incidenciasToReview);
  }

  @override
  Future<Result<Incidencia>> approveIncidencia(Incidencia incidencia) async {
    final currentUser = _authRepository.getCurrentUser();
    if (currentUser == null) {
      return Result.error(Exception('Not logged in'));
    }

    final index = _incidencias.indexWhere((x) => x.id == incidencia.id);
    if (index == -1) {
      return Result.error(Exception('Not found'));
    }

    late final Incidencia approvedIncidencia;
    if (incidencia.approvedBy == null) {
      approvedIncidencia = incidencia.copyWith(
        approvedBy: currentUser,
      );
    } else {
      approvedIncidencia = incidencia.copyWith(
        state: IncidenciaState.approved,
        rhApprovedBy: currentUser,
      );
    }

    _incidencias[index] = approvedIncidencia;
    return Result.ok(approvedIncidencia);
  }

  @override
  Future<Result<Incidencia>> rejectIncidencia(Incidencia incidencia) async {
    final currentUser = _authRepository.getCurrentUser();
    if (currentUser == null) {
      return Result.error(Exception('Not logged in'));
    }
    
    if (incidencia.rejectionReason == null || incidencia.rejectionReason!.isEmpty) {
      return Result.error(Exception('Needs a rejection reason'));
    }

    final index = _incidencias.indexWhere((x) => x.id == incidencia.id);
    if (index == -1) {
      return Result.error(Exception('Not found'));
    }
    final rejectedIncidencia = incidencia.copyWith(
      state: IncidenciaState.rejected,
      rejectedBy: currentUser,
    );

    _incidencias[index] = rejectedIncidencia;
    return Result.ok(rejectedIncidencia);
  }

  @override
  Future<Result<int>> getIncidenciasToReviewCount() async {
    final currentUser = _authRepository.getCurrentUser();
    if (currentUser == null) {
      return const Result.ok(0);
    }

    late int total;
    if ((await _authRepository.isRH) && currentUser.rol == 'LIDER') {
      total = _incidencias.fold(0, (sum, incidencia) {
        final isPending = incidencia.state == IncidenciaState.pending;
        final approvedByBoss = incidencia.approvedBy != null;
        final awaitingRHApproval = incidencia.rhApprovedBy == null;

        if (isPending && approvedByBoss && awaitingRHApproval) {
          sum += 1;
        }
        return sum;
      });
    } else {
      total = _incidencias.fold(0, (sum, incidencia) {
        final isPending = incidencia.state == IncidenciaState.pending;
        final awaitingBossApproval = incidencia.approvedBy == null;
        final isNotSolicitor = incidencia.solicitor!.id != currentUser.id;

        if (isPending && awaitingBossApproval && isNotSolicitor) {
          sum += 1;
        }
        return sum;
      });
    }

    return Result.ok(total);
  }

  @override
  Future<Result<Incidencia>> generatePDF(Incidencia incidencia) async {
    final apiUrl = const String.fromEnvironment('api_url', defaultValue: 'http://localhost:8000');

    final incidenciaWithPDF = incidencia.copyWith(
      pdfUrl: '$apiUrl/incidencias/reporte.pdf',
    );

    return Result.ok(incidenciaWithPDF);
  }
}