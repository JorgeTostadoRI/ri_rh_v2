import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_api_model.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_pending_count_response.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia_query.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

class IncidenciasRepositoryRemote extends IncidenciasRepository {
  IncidenciasRepositoryRemote({
    required this._apiClient,
  });

  final ApiClient _apiClient;

  List<User>? _cachedUsers;

  @override
  Future<Result<Incidencia>> createIncidencia(Incidencia incidencia) async {
    try {
      if (_cachedUsers == null) {
        final resultUsers = await _apiClient.getUsers();
        switch (resultUsers) {
          case Error():
            return Result.error(resultUsers.error);
          case Ok():
        }

        _cachedUsers = resultUsers.value;
      }

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
        users: _cachedUsers!,
      );
      return Result.ok(incidenciaWithValues);
    } on Exception catch(error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<Incidencia>>> getIncidencias(String category, {IncidenciaQuery? query}) async {
    try {
      if (_cachedUsers == null) {
        final resultUsers = await _apiClient.getUsers();
        switch (resultUsers) {
          case Error():
            return Result.error(resultUsers.error);
          case Ok():
        }

        _cachedUsers = resultUsers.value;
      }

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
          users: _cachedUsers!,
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
      if (_cachedUsers == null) {
        final resultUsers = await _apiClient.getUsers();
        switch (resultUsers) {
          case Error():
            return Result.error(resultUsers.error);
          case Ok():
        }

        _cachedUsers = resultUsers.value;
      }

      final resultApproval = await _apiClient.approveIncidencia(category, id);
      switch (resultApproval) {
        case Error():
          return Result.error(resultApproval.error);
        case Ok():
      }

      final incidencia = Incidencia.fromApiModel(
        resultApproval.value,
        category: category,
        users: _cachedUsers!,
      );
      return Result.ok(incidencia);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Incidencia>> rejectIncidencia(String category, int id) async {
    try {
      if (_cachedUsers == null) {
        final resultUsers = await _apiClient.getUsers();
        switch (resultUsers) {
          case Error():
            return Result.error(resultUsers.error);
          case Ok():
        }

        _cachedUsers = resultUsers.value;
      }

      final resultApproval = await _apiClient.rejectIncidencia(category, id);
      switch (resultApproval) {
        case Error():
          return Result.error(resultApproval.error);
        case Ok():
      }

      final incidencia = Incidencia.fromApiModel(
        resultApproval.value,
        category: category,
        users: _cachedUsers!,
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
}