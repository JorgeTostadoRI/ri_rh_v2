import 'package:ri_rh_v2/data/repositories/users/users_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/query/user/user_query.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

class UsersRepositoryLocal extends UsersRepository {
  UsersRepositoryLocal({
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  @override
  Future<Result<List<User>>> getUsers({UserQuery? query}) async {
    final users = _localDataService.getUsers();
    return Result.ok(users);
  }

  @override
  Future<Result<void>> updateUserHorario(int userId, int? horarioId) async {
    return const Result.ok(null);
  }
}