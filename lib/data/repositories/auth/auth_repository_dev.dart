import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AuthRepositoryDev extends AuthRepository {
  @override
  Future<bool> get isAuthenticated => Future.value(true);

  @override
  Future<Result<void>> login({required String username, required String password}) async {
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> loginFingerprint({required String fingerprint}) async {
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> logout() async {
    return const Result.ok(null);
  }
}