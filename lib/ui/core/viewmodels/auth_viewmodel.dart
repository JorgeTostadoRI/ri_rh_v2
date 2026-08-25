import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthViewmodel({
    required this._authRepository,
  });

  Future<bool> get isAuthenticated => _authRepository.isAuthenticated;
}