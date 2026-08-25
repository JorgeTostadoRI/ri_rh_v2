import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel({
    required this._log,
    required this._authRepository,
  }) {
    logout = Command0(_logout);
    updateRole = Command1(_updateRole);
    updateDepartment = Command1(_updateDepartment);
  }

  final AppLogger _log;
  final AuthRepository _authRepository;

  late Command0<void> logout;
  late Command1<void, String> updateRole;
  late Command1<void, Departamento> updateDepartment;

  User? getUser() => _authRepository.getCurrentUser();

  Future<Result<void>> _logout() {
    return _authRepository.logout();
  }

  Future<Result<void>> _updateRole(String role) async {
    final resultUpdate = await _authRepository.updateRole(role);
    switch (resultUpdate) {
      case Error():
        _log.error('Failed to update user role');
        return Result.error(resultUpdate.error);
      case Ok():
    }
    notifyListeners();
    return const Result.ok(null);
  }

  Future<Result<void>> _updateDepartment(Departamento department) async {
    final resultUpdate = await _authRepository.updateDepartment(department);
    switch (resultUpdate) {
      case Error():
        _log.error('Failed to update user department');
        return Result.error(resultUpdate.error);
      case Ok():
    }
    notifyListeners();
    return const Result.ok(null);
  }
}