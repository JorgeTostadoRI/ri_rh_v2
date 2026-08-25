import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

const String _rhDepartmentName = 'Recursos Humanos';

class AuthRepositoryDev extends AuthRepository {
  AuthRepositoryDev({
    required this._log,
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  final AppLogger _log;
  User? _currentUser;

  @override
  Future<bool> get isAuthenticated => Future.value(_currentUser != null);

  @override
  Future<bool> get isRH async {
    if (_currentUser == null) {
      return false;
    }

    final departamento = _currentUser!.departamento;
    if (departamento == null) {
      return false;
    }

    return departamento.nombre == _rhDepartmentName;
  }

  @override
  Future<Result<User>> login({required String username, required String password}) async {
    try {
      final matchedUser = _localDataService.getUsers().firstWhere((user) => user.username == username);
      _log.debug('AuthRepository | logged in');
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
      _log.debug('AuthRepository | logged in');
      _currentUser = matchedUser;
      return Result.ok(_currentUser!);
    } on StateError {
      return Result.error(Exception('Failed challenge'));
    }
  }

  @override
  Future<Result<void>> logout() async {
    _currentUser = null;
    _log.debug('AuthRepository | logged out');
    notifyListeners();
    return const Result.ok(null);
  }

  @override
  User? getCurrentUser() {
    return _currentUser;
  }

  @override
  Future<Result<void>> updateRole(String role) async {
    if (_currentUser == null) {
      return Result.error(Exception('Not logged in'));
    }

    _currentUser = _currentUser!.copyWith(
      rol: role,
    );
    notifyListeners();
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> updateDepartment(Departamento department) async {
    if (_currentUser == null) {
      return Result.error(Exception('Not logged in'));
    }

    _currentUser = _currentUser!.copyWith(
      departamento: department,
    );
    notifyListeners();
    return const Result.ok(null);
  }
}