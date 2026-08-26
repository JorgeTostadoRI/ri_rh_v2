import 'package:ri_rh_v2/domain/models/query/user/user_query.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class UsersRepository {
  Future<Result<List<User>>> getUsers({UserQuery? query});
}