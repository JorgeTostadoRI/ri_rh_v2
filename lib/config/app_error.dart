sealed class AppError implements Exception {}

class LoginError extends AppError {}

/// User is not assigned as remote
class NoRemoteAllowed extends AppError {}

/// Finger scanner device is not available
class NoScannerAvailable extends AppError {}

/// Indicates there's invalid data in a submission
class InvalidForm extends AppError {
  String message;

  InvalidForm(this.message);
}