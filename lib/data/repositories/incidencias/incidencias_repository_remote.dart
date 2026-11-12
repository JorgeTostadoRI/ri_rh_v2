import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/hora_por_hora_resumen.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia/incidencia_query.dart';
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
      final incidenciaApiModel = IncidenciaApiModel(
        start: incidencia.start,
        end: incidencia.end,
        reason: incidencia.reason,
        files: incidencia.files,
        solicitorRef: incidencia.solicitor?.id,
        category: incidencia.category,
        videoFile: incidencia.videoFile,
        horasPorHoraRefs: incidencia.horasPorHoraRefs,
      );
      final resultIncidencia = await _apiClient.postIncidencia(incidenciaApiModel);
      switch (resultIncidencia) {
        case Error():
          return Result.error(resultIncidencia.error);
        case Ok():
      }
      final incidenciaWithValues = Incidencia.fromApiModel(
        resultIncidencia.value,
        users: await _usersPara([resultIncidencia.value]),
      );
      return Result.ok(incidenciaWithValues);
    } on Exception catch(error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<Incidencia>>> getIncidencias({IncidenciaQuery? query}) async {
    try {
      final resultIncidencias = await _apiClient.getIncidencias(query: query);
      switch (resultIncidencias) {
        case Error():
          return Result.error(resultIncidencias.error);
        case Ok():
      }

      final users = await _usersPara(resultIncidencias.value);
      final incidencias = resultIncidencias.value
        .map((incidenciaApiModel) => Incidencia.fromApiModel(
          incidenciaApiModel,
          users: users,
        ))
        .toList();
      return Result.ok(incidencias);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Incidencia>>> getIncidenciasToReview({IncidenciaQuery? query}) async {
    try {
      final resultIncidencias = await _apiClient.getIncidenciasToReview(query: query);
      switch (resultIncidencias) {
        case Error():
          return Result.error(resultIncidencias.error);
        case Ok():
      }

      final users = await _usersPara(resultIncidencias.value);
      final incidencias = resultIncidencias.value
        .map((incidenciaApiModel) => Incidencia.fromApiModel(
          incidenciaApiModel,
          users: users,
        ))
        .toList();
      return Result.ok(incidencias);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Incidencia>> approveIncidencia(Incidencia incidencia, {bool? conGoce, String? conGoceJustificacion}) async {
    try {
      final resultApproval = await _apiClient.approveIncidencia(
        incidencia.category.url,
        incidencia.id!,
        conGoce: conGoce,
        conGoceJustificacion: conGoceJustificacion,
      );
      switch (resultApproval) {
        case Error():
          return Result.error(resultApproval.error);
        case Ok():
      }

      final approvedIncidencia = Incidencia.fromApiModel(
        resultApproval.value,
        users: await _usersPara([resultApproval.value]),
      );
      return Result.ok(approvedIncidencia);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Incidencia>> rejectIncidencia(Incidencia incidencia) async {
    if (incidencia.rejectionReason == null || incidencia.rejectionReason!.isEmpty) {
      return Result.error(Exception('Needs a rejection reason'));
    }

    try {
      final resultApproval = await _apiClient.rejectIncidencia(
        incidencia.id!,
        category: incidencia.category.url,
        rejectionReason: incidencia.rejectionReason!,
      );
      switch (resultApproval) {
        case Error():
          return Result.error(resultApproval.error);
        case Ok():
      }

      final rejectedIncidencia = Incidencia.fromApiModel(
        resultApproval.value,
        users: await _usersPara([resultApproval.value]),
      );
      return Result.ok(rejectedIncidencia);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<int>> getIncidenciasToReviewCount() async {
    return _apiClient.getIncidenciasPendingCount();
  }

  @override
  Future<Result<List<HoraPorHoraResumen>>> getHorasPorHoraDisponibles() {
    return _apiClient.getHorasPorHoraDisponibles();
  }

  @override
  Future<Result<Incidencia>> generatePDF(Incidencia incidencia, bool force) async {
    try {
      final result = await _apiClient.generateIncidenciaPDF(incidencia.id!, incidencia.category.url, force);

      switch (result) {
        case Error():
          return Result.error(result.error);
        case Ok():
      }

      final incidenciaWithPDF = Incidencia.fromApiModel(result.value, users: await _usersPara([result.value]));

      return Result.ok(incidenciaWithPDF);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  /// Usuarios para convertir [modelos]. La lista se guarda mientras la app
  /// esté abierta; si falta alguno de los usuarios que referencian (ej. un
  /// empleado dado de alta, o con su primera incidencia, después de abrir la
  /// app), se vuelve a pedir una vez. Sin esto, una sola incidencia de un
  /// usuario nuevo tiraba la lista completa hasta reiniciar la app.
  Future<List<User>> _usersPara(Iterable<IncidenciaApiModel> modelos) async {
    final users = await _getUsers();
    if (_contieneTodos(users, modelos)) return users;
    return _getUsers(descartar: users);
  }

  static bool _contieneTodos(List<User> users, Iterable<IncidenciaApiModel> modelos) {
    final ids = {for (final user in users) user.id};
    return modelos.every((m) => [
      m.solicitorRef,
      m.approvedByRef,
      m.rhApprovedByRef,
      m.rejectedByRef,
      m.conGoceApprovedByRef,
    ].every((ref) => ref == null || ids.contains(ref)));
  }

  /// Con [descartar], vuelve a pedir la lista si la guardada sigue siendo esa
  /// (si otra llamada ya la refrescó mientras tanto, usa la nueva).
  Future<List<User>> _getUsers({List<User>? descartar}) async {
    final cached = _cachedUsers;
    if (cached != null && !identical(cached, descartar)) return cached;

    return _usersLock.synchronized(() async {
      // Check if we cached the users while waiting to acquire the lock
      final cachedAfterLock = _cachedUsers;
      if (cachedAfterLock != null && !identical(cachedAfterLock, descartar)) return cachedAfterLock;

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
