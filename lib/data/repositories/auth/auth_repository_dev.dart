import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AuthRepositoryDev extends AuthRepository {
  AuthRepositoryDev({
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  final Logger _logger = Logger();
  User? _currentUser;

  @override
  Future<bool> get isAuthenticated => Future.value(_currentUser != null);

  @override
  Future<bool> get isRH async {
    if (_currentUser == null) {
      return false;
    }

    final departamentos = _currentUser!.departamentosPermitidos.map((dep) => dep.nombre).toSet();
    return departamentos.contains('Recursos Humanos');
  }

  @override
  Future<Result<User>> login({required String username, required String password}) async {
    try {
      final matchedUser = _localDataService.getUsers().firstWhere((user) => user.username == username);
      _logger.d('logged in');
      _currentUser = matchedUser;
      notifyListeners();
      return Result.ok(_currentUser!);
    } on StateError {
      return Result.error(Exception('Invalid credentials'));
    }
  }

  @override
  Future<Result<User>> loginViaChallenge(String username) async {
    try {
      final matchedUser = _localDataService.getUsers().firstWhere((user) => user.username == username);
      _logger.d('logged in');
      _currentUser = matchedUser;
      return Result.ok(_currentUser!);
    } on StateError {
      return Result.error(Exception('Failed challenge'));
    }
  }

  @override
  Future<Result<void>> logout() async {
    _currentUser = null;
    _logger.d('logged out');
    notifyListeners();
    return const Result.ok(null);
  }

  @override
  User? getCurrentUser() {
    return _currentUser;
  }
}