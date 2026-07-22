import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel({
    required this._authRepository,
  }) {
    logout = Command0(_logout);
  }

  final AuthRepository _authRepository;

  late Command0<void> logout;

  User? getUser() => _authRepository.getCurrentUser();

  Future<Result<void>> _logout() {
    return _authRepository.logout();
  }
}