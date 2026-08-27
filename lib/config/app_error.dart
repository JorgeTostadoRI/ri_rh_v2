sealed class AppError implements Exception {}

class LoginError extends AppError {}

/// User is not assigned as remote
class NoRemoteAllowed extends AppError {}