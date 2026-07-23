import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class LoginViewmodel {
  LoginViewmodel({
    required this._log,
    required this._authRepository,
  }) {
    login = Command1<void, (String username, String password)>(_login);
  }

  final AuthRepository _authRepository;

  final AppLogger _log;

  late Command1 login;

  Future<Result<void>> _login((String, String) credentials) async {
    final (username, password) = credentials;
    final result = await _authRepository.login(
      username: username,
      password: password,
    );

    switch (result) {
      case Ok():
        break;
      case Error():
        _log.warning('LoginViewmodel | Login failed', error: result.error);
    }
    return result;
  }
}