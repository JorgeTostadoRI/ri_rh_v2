import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  /// Returns true when the user is logged in
  /// Returns [Future] because it will load a stored auth state the first time.
  Future<bool> get isAuthenticated;

  /// Perform login via user credentials
  Future<Result<void>> login({required String username, required String password});

  /// Perform login via user fingerprint
  Future<Result<void>> loginFingerprint({required String fingerprint});

  /// Perform logout
  Future<Result<void>> logout();

  /// Get user in session
  User? getCurrentUser();
}