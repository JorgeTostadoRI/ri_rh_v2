import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/config/app_error.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

typedef RegisterParams = ({String username, String password, XFile photo});

class IngresoManualViewmodel extends ChangeNotifier {
  IngresoManualViewmodel({
    required this._log,
    required this._authRepository,
    required this._asistenciaRepository,
  }) {
    isAuthenticated = _authRepository.isAuthenticated;

    register = Command1(_register);
  }

  final AppLogger _log;
  final AuthRepository _authRepository;
  final AsistenciaRepository _asistenciaRepository;

  late final Command1<void, RegisterParams>  register;

  late Future<bool> isAuthenticated;
  User? get currentUser => _authRepository.getCurrentUser();

  Future<Result<void>> _register(RegisterParams params) async {
    final isAuthenticated = await _authRepository.isAuthenticated;

    if (!isAuthenticated) {
      final loggedIn = await _authRepository.login(username: params.username, password: params.password);

      switch(loggedIn) {
        case Error():
          _log.warning('Failed to log in', error: loggedIn.error);
          return Result.error(LoginError());
        case Ok():
      }
    }

    final currentUser = _authRepository.getCurrentUser();
    if (currentUser == null) {
      return Result.error(Exception('No user'));
    }

    if (kIsWeb && !currentUser.isRemote) {
      return Result.error(NoRemoteAllowed());
    }

    final result = await _asistenciaRepository.createAsistencia(
      Asistencia(
        user: currentUser,
        photoFile: params.photo,
      )
    );

    switch(result) {
      case Error():
        _log.warning('Failed to register attendance', error: result.error);
        return Result.error(result.error);
      case Ok():
        _log.info('Attendance registered for ${result.value.user.username}');
    }

    return const Result.ok(null);
  }
}