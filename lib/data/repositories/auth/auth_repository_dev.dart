import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AuthRepositoryDev extends AuthRepository {
  AuthRepositoryDev({
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  final Logger _logger = Logger();

  @override
  Future<bool> get isAuthenticated => Future.value(_localDataService.isAuthenticated);

  @override
  Future<Result<void>> login({required String username, required String password}) async {
    _localDataService.isAuthenticated = true;
    _logger.d('logged in');
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> loginFingerprint({required String fingerprint}) async {
    _localDataService.isAuthenticated = true;
    _logger.d('logged in');
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> logout() async {
    _localDataService.isAuthenticated = false;
    _logger.d('logged out');
    return const Result.ok(null);
  }
}