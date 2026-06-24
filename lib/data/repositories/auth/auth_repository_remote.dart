import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/auth_api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/login_request/login_request.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/login_response/login_response.dart';
import 'package:ri_rh_v2/data/services/shared_preferences_service.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required ApiClient apiClient,
    required AuthApiClient authApiClient,
    required SharedPreferencesService sharedPreferencesService,
  }) : _apiClient = apiClient,
       _authApiClient = authApiClient,
       _sharedPreferencesService = sharedPreferencesService {
    _apiClient.authHeaderProvider = _authHeaderProvider;
  }

  final AuthApiClient _authApiClient;
  final ApiClient _apiClient;
  final SharedPreferencesService _sharedPreferencesService;

  bool? _isAuthenticated;
  String? _authToken;
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
          _log.i('User logged in');
          // Set auth status
          _isAuthenticated = true;
          _authToken = result.value.token;
          // Store in Shared preferences
          return await _sharedPreferencesService.saveToken(result.value.token);
        case Error<LoginResponse>():
          _log.w('Error logging in', error: result.error);
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> loginFingerprint({required String fingerprint}) async {
    throw UnimplementedError();
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
      return result;
    } finally {
      notifyListeners();
    }
  }

  String? _authHeaderProvider() =>
      _authToken != null ? 'Token $_authToken' : null;
}