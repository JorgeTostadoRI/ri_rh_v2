import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/auth_api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/challenge/auth_challenge.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/login_request/login_request.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/login_response/login_response.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/verify_challenge/verify_challenge_request.dart';
import 'package:ri_rh_v2/data/services/device_auth_service.dart';
import 'package:ri_rh_v2/data/services/shared_preferences_service.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required this._apiClient,
    required this._authApiClient,
    required this._sharedPreferencesService,
    required this._deviceAuthService,
  }) {
    _apiClient.authHeaderProvider = _authHeaderProvider;
  }

  final AuthApiClient _authApiClient;
  final ApiClient _apiClient;
  final SharedPreferencesService _sharedPreferencesService;
  final DeviceAuthService _deviceAuthService;

  bool? _isAuthenticated;
  String? _authToken;
  User? _currentUser;
  final _log = Logger();

  /// Fetch token from shared preferences
  Future<void> _fetch() async {
    final result = await _sharedPreferencesService.fetchToken();
    switch (result) {
      case Ok<String?>():
        _authToken = result.value;
        _isAuthenticated = result.value != null;
      case Error<String?>():
        _log.e(
          'Failed to fech Token from SharedPreferences',
          error: result.error,
        );
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
  Future<Result<void>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _authApiClient.login(
        LoginRequest(username: username, password: password),
      );
      switch (result) {
        case Ok<LoginResponse>():
          _log.i('User logged in via password');
          return _saveCredentials(result.value);
        case Error<LoginResponse>():
          _log.w('Error logging in', error: result.error);
          return result;
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> loginViaChallenge(String username) async {
    try {
      final challengeRes = await _authApiClient.createChallenge();
      switch (challengeRes) {
        case Ok():
          break;
        case Error():
          _log.w('Error logging in', error: challengeRes.error);
          return Result.error(challengeRes.error);
      }

      final request = await _generateVerifyRequest(challengeRes.value, username);
      final result = await _authApiClient.verifyChallenge(request);
      switch (result) {
        case Ok():
          _log.i('User logged in via challenge');
          return _saveCredentials(result.value);
        case Error():
          _log.w('Error logging in', error: result.error);
          return result;
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    _log.i('User logged out');
    try {
      // Clear stored auth token
      final result = await _sharedPreferencesService.saveToken(null);
      if (result is Error<void>) {
        _log.f('Failed to clear stored auth token');
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

  Future<Result<void>> _saveCredentials(LoginResponse login) async {
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
      departamento: Departamento(
        id: login.user.departamento.id,
        nombre: login.user.departamento.nombre,
        descripcion: login.user.departamento.descripcion,
        presupuesto: double.parse(login.user.departamento.presupuesto),
        divisa: login.user.departamento.divisa,
      ),
      departamentosPermitidos: [],
      liderPermitido: login.user.liderPermitido,
      empleadoId: login.user.empleadoId,
    );
    // Store in Shared preferences
    return await _sharedPreferencesService.saveToken(login.token);
  }
}