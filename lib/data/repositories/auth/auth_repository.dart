import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  /// Returns true when the user is logged in
  /// Returns [Future] because it will load a stored auth state the first time.
  Future<bool> get isAuthenticated;

  /// Returns true when the user has access to RH resources
  /// Returns [Future] because it will load a stored auth state the first time.
  Future<bool> get isRH;

  /// Perform login via user credentials
  Future<Result<User>> login({required String username, required String password});

  /// Perform login via auth challenge
  Future<Result<User>> loginViaChallenge(String username);

  /// Perform logout
  Future<Result<void>> logout();

  /// Get user in session
  User? getCurrentUser();

  Future<Result<void>> updateRole(String role);

  Future<Result<void>> updateDepartment(Departamento department);
}