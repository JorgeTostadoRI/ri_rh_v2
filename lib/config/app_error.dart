sealed class AppError implements Exception {}

class LoginError extends AppError {}

/// El login respondió que el usuario está desactivado (ej. empleado en
/// proceso de finiquito o practicante dado de baja).
class UsuarioInactivo extends AppError {}

/// User is not assigned as remote
class NoRemoteAllowed extends AppError {}

/// Finger scanner device is not available
class NoScannerAvailable extends AppError {}

/// Indicates there's invalid data in a submission
class InvalidForm extends AppError {
  String message;

  InvalidForm(this.message);
}