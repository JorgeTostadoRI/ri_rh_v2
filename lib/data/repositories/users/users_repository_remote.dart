import 'package:ri_rh_v2/data/repositories/users/users_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/query/user/user_query.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

class UsersRepositoryRemote extends UsersRepository {
  UsersRepositoryRemote({
    required this._apiClient,
  });

  final ApiClient _apiClient;

  @override
  Future<Result<List<User>>> getUsers({UserQuery? query}) async {
    final result = await _apiClient.getUsers(query: query);
    switch (result) {
      case Error():
        return Result.error(result.error);
      case Ok():
    }
    return Result.ok(result.value);
  }

  @override
  Future<Result<void>> updateUserHorario(int userId, int? horarioId) async {
    final result = await _apiClient.patchUser(userId, {
      'horario_id': horarioId,
    });
    switch (result) {
      case Error():
        return Result.error(result.error);
      case Ok():
    }
    return const Result.ok(null);
  }
}