import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/auth_api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/challenge/auth_challenge.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/login_request/login_request.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/login_response/login_response.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/verify_challenge/verify_challenge_request.dart';
import 'package:ri_rh_v2/data/services/device_auth_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/data/services/shared_preferences_service.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:synchronized/synchronized.dart';

const String _rhDepartmentName = 'Recursos Humanos';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required this._log,
    required this._apiClient,
    required this._authApiClient,
    required this._sharedPreferencesService,
    required this._deviceAuthService,
  }) {
    _apiClient.authHeaderProvider = _authHeaderProvider;
  }

  final AppLogger _log;
  final AuthApiClient _authApiClient;
  final ApiClient _apiClient;
  final SharedPreferencesService _sharedPreferencesService;
  final DeviceAuthService _deviceAuthService;

  bool? _isAuthenticated;
  String? _authToken;
  User? _currentUser;

  final Lock _userLock = Lock();

  /// Fetch token from shared preferences
  Future<void> _fetch() async {
    final result = await _sharedPreferencesService.fetchToken();
    switch (result) {
      case Error():
        _log.error(
          'AuthRepository | Failed to fech Token from SharedPreferences',
          error: result.error,
        );
        _authToken = null;
        _isAuthenticated = null;
        return;
      case Ok():
        _authToken = result.value;
        _isAuthenticated = result.value != null;
    }

    final resultUser = await _fetchUser();
    switch (resultUser) {
      case Error():
        _log.info('Reset auth credentials');
        _authToken = null;
        _isAuthenticated = false;
        _currentUser = null;
      case Ok():
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    // Status is cached
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }
    // No status cached, fetch from storage
    await _fetch();
    return _isAuthenticated ?? false;
  }

  @override
  Future<bool> get isRH async {
    if (_isAuthenticated == null) {
      await _fetch();
    }

    final authenticated = _isAuthenticated ?? false;
    if (!authenticated) {
      return false;
    }

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
  Future<Result<User>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _authApiClient.login(
        LoginRequest(username: username, password: password),
      );
      switch (result) {
        case Ok<LoginResponse>():
          _log.info('AuthRepository | User logged in via password');
          return _saveCredentials(result.value);
        case Error<LoginResponse>():
          _log.warning('AuthRepository | Error logging in', error: result.error);
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<User>> loginViaChallenge(String username) async {
    try {
      final challengeRes = await _authApiClient.createChallenge();
      switch (challengeRes) {
        case Ok():
          break;
        case Error():
          _log.warning('AuthRepository | Failed to create challenge', error: challengeRes.error);
          return Result.error(challengeRes.error);
      }

      final request = await _generateVerifyRequest(challengeRes.value, username);
      final result = await _authApiClient.verifyChallenge(request);
      switch (result) {
        case Ok():
          _log.info('AuthRepository | User logged in via challenge');
          return _saveCredentials(result.value);
        case Error():
          _log.warning('AuthRepository | Error logging in', error: result.error);
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    _log.info('AuthRepository | User logged out');
    try {
      // Clear stored auth token
      final result = await _sharedPreferencesService.saveToken(null);
      if (result is Error<void>) {
        _log.fatal('AuthRepository | Failed to clear stored auth token');
      }

      // Clear token in ApiClient
      _authToken = null;

      // Clear authenticated status
      _isAuthenticated = false;
      _currentUser = null;
      return result;
    } finally {
      notifyListeners();
    }
  }

  @override
  User? getCurrentUser() => _currentUser;

  @override
  Future<Result<void>> updateRole(String role) async {
    if (_currentUser == null) {
      return Result.error(Exception('Not logged in'));
    }

    final resultPatch = await _apiClient.patchUser(_currentUser!.id, {
      'rol': role,
    });
    switch (resultPatch) {
      case Error():
        return Result.error(resultPatch.error);
      case Ok():
    }
    _currentUser = resultPatch.value;
    notifyListeners();
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> updateDepartment(Departamento department) async {
    if (_currentUser == null) {
      return Result.error(Exception('Not logged in'));
    }

    final resultPatch = await _apiClient.patchUser(_currentUser!.id, {
      'departamento_id': department.id,
    });
    switch (resultPatch) {
      case Error():
        return Result.error(resultPatch.error);
      case Ok():
    }
    _currentUser = resultPatch.value;
    notifyListeners();
    return const Result.ok(null);
  }

  String? _authHeaderProvider() =>
      _authToken != null ? 'Token $_authToken' : null;

  Future<VerifyChallengeRequest> _generateVerifyRequest(AuthChallenge challenge, String username) async {
    final signature = await _deviceAuthService.signPayload(challenge.nonce);

    final verifyRequest = VerifyChallengeRequest(
      authSessionId: challenge.authSessionId,
      deviceId: const String.fromEnvironment('device_id'),
      nonce: challenge.nonce,
      signature: signature,
      username: username,
    );
    return verifyRequest;
  }

  Future<Result<User>> _saveCredentials(LoginResponse login) async {
    // Set auth status
    _isAuthenticated = true;
    _authToken = login.token;
    _currentUser = User(
      id: login.user.id,
      username: login.user.username,
      nombre: login.user.nombre,
      telefono: login.user.telefono,
      correo: login.user.correo,
      rol: login.user.rol,
      // TODO: map all DepartamentoApiModel to Departamento
      departamento: Departamento(
        id: login.user.departamento.id,
        nombre: login.user.departamento.nombre,
        descripcion: login.user.departamento.descripcion,
        presupuesto: double.parse(login.user.departamento.presupuesto),
        divisa: login.user.departamento.divisa,
      ),
      departamentosPermitidos: login.user.departamentosPermitidos.map(
        (dep) => Departamento(
          id: dep.id,
          nombre: dep.nombre,
          descripcion: dep.descripcion,
          presupuesto: double.parse(dep.presupuesto),
          divisa: dep.divisa,
        ),
      ).toList(),
      liderPermitido: login.user.liderPermitido,
    );
    // Store in Shared preferences
    final savedToken = await _sharedPreferencesService.saveToken(login.token);
    switch (savedToken) {
      case Ok():
        return Result.ok(_currentUser!);
      case Error():
        _reset();
        return Result.error(savedToken.error);
    }
  }

  void _reset() {
    _isAuthenticated = false;
    _authToken = null;
    _currentUser = null;
  }

  Future<Result<void>> _fetchUser() async {
    if (_authToken == null) return Result.error(Exception('No token'));

    final cached = _currentUser;
    if (cached != null) return const Result.ok(null);

    return _userLock.synchronized(() async {
      // Check if we cached the user while waiting for the lock
      final cachedAfterLock = _currentUser;
      if (cachedAfterLock != null) return const Result.ok(null);

      final resultUser = await _apiClient.getCurrentUser();
      switch (resultUser) {
        case Error():
          _log.error('Failed to fetch current user', error: resultUser.error);
          return Result.error(resultUser.error);
        case Ok():
      }
      _currentUser = resultUser.value;
      return const Result.ok(null);
    });
  }
}