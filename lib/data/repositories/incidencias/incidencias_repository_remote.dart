import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_api_model.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_pending_count_response.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia_query.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:synchronized/synchronized.dart';

class IncidenciasRepositoryRemote extends IncidenciasRepository {
  IncidenciasRepositoryRemote({
    required this._apiClient,
  });

  final ApiClient _apiClient;

  List<User>? _cachedUsers;
  final Lock _usersLock = Lock();

  @override
  Future<Result<Incidencia>> createIncidencia(Incidencia incidencia) async {
    try {
      final users = await _getUsers();

      final incidenciaApiModel = IncidenciaApiModel(
        start: incidencia.start,
        end: incidencia.end,
        reason: incidencia.reason,
        files: incidencia.files,
        categoryId: incidencia.categoryId,
        solicitorRef: incidencia.solicitor?.id,
      );
      final resultIncidencia = await _apiClient.postIncidencia(incidenciaApiModel);
      switch (resultIncidencia) {
        case Error():
          return Result.error(resultIncidencia.error);
        case Ok():
      }
      final incidenciaWithValues = Incidencia.fromApiModel(
        resultIncidencia.value,
        category: incidencia.categoryId,
        users: users,
      );
      return Result.ok(incidenciaWithValues);
    } on Exception catch(error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<Incidencia>>> getIncidencias(String category, {IncidenciaQuery? query}) async {
    try {
      final users = await _getUsers();

      final resultIncidencias = await _apiClient.getIncidencias(category, query: query);
      switch (resultIncidencias) {
        case Error():
          return Result.error(resultIncidencias.error);
        case Ok():
      }

      final incidencias = resultIncidencias.value
        .map((incidenciaApiModel) => Incidencia.fromApiModel(
          incidenciaApiModel,
          category: category,
          users: users,
        ))
        .toList();
      return Result.ok(incidencias);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Incidencia>> approveIncidencia(String category, int id) async {
    try {
      final users = await _getUsers();

      final resultApproval = await _apiClient.approveIncidencia(category, id);
      switch (resultApproval) {
        case Error():
          return Result.error(resultApproval.error);
        case Ok():
      }

      final incidencia = Incidencia.fromApiModel(
        resultApproval.value,
        category: category,
        users: users,
      );
      return Result.ok(incidencia);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Incidencia>> rejectIncidencia(
    int id,
    {
      required String category,
      required String rejectionReason,
    }
  ) async {
    try {
      final users = await _getUsers();

      final resultApproval = await _apiClient.rejectIncidencia(
        id,
        category: category,
        rejectionReason: rejectionReason,
      );
      switch (resultApproval) {
        case Error():
          return Result.error(resultApproval.error);
        case Ok():
      }

      final incidencia = Incidencia.fromApiModel(
        resultApproval.value,
        category: category,
        users: users,
      );
      return Result.ok(incidencia);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<IncidenciaPendingCountResponse>> getIncidenciasPendingCount() async {
    return _apiClient.getIncidenciasPendingCount();
  }

  Future<List<User>> _getUsers() async {
    final cached = _cachedUsers;
    if (cached != null) return cached;

    return _usersLock.synchronized(() async {
      // Check if we cached the users while waiting to acquire the lock
      final cachedAfterLock = _cachedUsers;
      if (cachedAfterLock != null) return cachedAfterLock;

        final resultUsers = await _apiClient.getUsers();
        switch (resultUsers) {
          case Error():
            throw resultUsers.error;
          case Ok():
            _cachedUsers = resultUsers.value;
            return _cachedUsers!;
        }
    });
  }
}