import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/repositories/horario/horario_repository.dart';
import 'package:ri_rh_v2/data/repositories/users/users_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class EmpleadoExpedienteViewmodel extends ChangeNotifier {
  EmpleadoExpedienteViewmodel({
    required this.empleadoId,
    required this._log,
    required this._empleadosRepository,
    required this._usersRepository,
    required this._horarioRepository,
  }) {
    load = Command1(_load)..execute(empleadoId);
    loadHorarios = Command0(_loadHorarios)..execute();
    assignHorario = Command1(_assignHorario);
    createCustomHorario = Command1(_createCustomHorario);
  }

  final int empleadoId;
  final EmpleadosRepository _empleadosRepository;
  final UsersRepository _usersRepository;
  final HorarioRepository _horarioRepository;
  final AppLogger _log;

  late final Command1<Empleado, int> load;
  late Empleado _empleado;
  Empleado get empleado => _empleado;

  late final Command0 loadHorarios;
  List<Horario> _horarios = [];
  List<Horario> get horarios => _horarios;

  late final Command1<void, int> assignHorario;
  late final Command1<Horario, Horario> createCustomHorario;

  Future<Result<Empleado>> _load(int id) async {
    final result = await _empleadosRepository.getEmpleado(id);
    switch (result) {
      case Error():
        _log.warning('Failed to load empleado expediente', error: result.error);
      case Ok():
        _empleado = result.value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _loadHorarios() async {
    final result = await _horarioRepository.getHorarios();
    switch (result) {
      case Error():
        _log.warning('Failed to load horarios', error: result.error);
        return result;
      case Ok():
    }
    _horarios = result.value;
    notifyListeners();
    return const Result.ok(null);
  }

  Future<Result<void>> _assignHorario(int horarioId) async {
    final userId = _empleado.base.user?.id;
    if (userId == null) {
      return Result.error(Exception('Empleado sin usuario asociado'));
    }

    final result = await _usersRepository.updateUserHorario(userId, horarioId);
    switch (result) {
      case Error():
        _log.warning('Failed to assign horario', error: result.error);
        return result;
      case Ok():
    }

    _empleadosRepository.invalidateCache();
    _horarioRepository.invalidateCache();
    await Future.wait([load.execute(empleadoId), loadHorarios.execute()]);
    return const Result.ok(null);
  }

  Future<Result<Horario>> _createCustomHorario(Horario horario) async {
    final result = await _horarioRepository.createHorario(horario);
    switch (result) {
      case Error():
        _log.warning('Failed to create custom horario', error: result.error);
      case Ok():
    }
    return result;
  }
}