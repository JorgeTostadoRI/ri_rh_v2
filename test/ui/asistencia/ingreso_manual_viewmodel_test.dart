import 'package:camera/camera.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/config/app_error.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/ui/asistencia/view_models/ingreso_manual_viewmodel.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Login que siempre falla con [error]; lo demás no se usa en estas pruebas.
class _AuthFalla extends AuthRepository {
  _AuthFalla(this.error);

  final Exception error;

  @override
  Future<bool> get isAuthenticated async => false;

  @override
  Future<bool> get isRH async => false;

  @override
  Future<Result<User>> login({required String username, required String password}) async =>
      Result.error(error);

  @override
  Future<Result<User>> loginViaChallenge(String username) => throw UnimplementedError();

  @override
  Future<Result<void>> logout() async => const Result.ok(null);

  @override
  User? getCurrentUser() => null;

  @override
  Future<Result<void>> updateRole(String role) => throw UnimplementedError();

  @override
  Future<Result<void>> updateDepartment(Departamento department) => throw UnimplementedError();
}

class _AsistenciaNoUsada implements AsistenciaRepository {
  @override
  Future<Result<Asistencia>> createAsistencia(Asistencia asistencia) =>
      throw StateError('No debe intentar registrar si el login falló');

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

Future<Object> _errorDelRegistro(Exception errorLogin) async {
  final viewmodel = IngresoManualViewmodel(
    log: AppLogger(loggers: const []),
    authRepository: _AuthFalla(errorLogin),
    asistenciaRepository: _AsistenciaNoUsada(),
  );
  await viewmodel.register.execute((username: 'persona', password: 'clave', photo: XFile('foto.jpg')));
  return (viewmodel.register.result as Error).error;
}

void main() {
  test('403 de /api/login/ es usuario desactivado', () async {
    final error = await _errorDelRegistro(const ApiException('{error: El usuario está inactivo.}', 403));
    expect(error, isA<UsuarioInactivo>());
  });

  test('contraseña incorrecta sigue siendo error de credenciales', () async {
    final error = await _errorDelRegistro(const ApiException('{error: Contraseña incorrecta}', 400));
    expect(error, isA<LoginError>());
  });

  test('error sin status (ej. sin internet) sigue siendo error de credenciales', () async {
    final error = await _errorDelRegistro(Exception('sin conexión'));
    expect(error, isA<LoginError>());
  });
}
