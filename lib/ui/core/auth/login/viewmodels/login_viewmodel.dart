import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class LoginViewmodel {
  LoginViewmodel({
    required this._authRepository,
  }) {
    login = Command1<void, (String username, String password)>(_login);
  }

  final AuthRepository _authRepository;

  final Logger _logger = Logger();

  late Command1 login;

  Future<Result<void>> _login((String, String) credentials) async {
    final (username, password) = credentials;
    final result = await _authRepository.login(
      username: username,
      password: password,
    );
    if (result is Error<void>) {
      _logger.e('Login failed', error: result.error);
    }
    return result;
  }
}