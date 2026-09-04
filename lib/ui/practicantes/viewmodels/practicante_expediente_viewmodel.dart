import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/horario/horario_repository.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/repositories/users/users_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class PracticanteExpedienteViewmodel extends ChangeNotifier {
  PracticanteExpedienteViewmodel({
    required this._practicanteId,
    required this._log,
    required this._practicantesRepository,
    required this._usersRepository,
    required this._horarioRepository,
  }) {
    load = Command0(_load)..execute();
    loadHorarios = Command0(_loadHorarios)..execute();
    assignHorario = Command1(_assignHorario);
    createCustomHorario = Command1(_createCustomHorario);
  }

  final int _practicanteId;
  final AppLogger _log;
  final PracticantesRepository _practicantesRepository;
  final UsersRepository _usersRepository;
  final HorarioRepository _horarioRepository;
  late final Command0 load;

  late Practicante _practicante;
  Practicante get practicante => _practicante;

  late final Command0 loadHorarios;
  List<Horario> _horarios = [];
  List<Horario> get horarios => _horarios;

  late final Command1<void, int> assignHorario;
  late final Command1<Horario, Horario> createCustomHorario;

  Future<Result<void>> _load() async {
    final result = await _practicantesRepository.getPracticante(_practicanteId);
    switch(result) {
      case Error():
        _log.warning('Failed to load practicante with ID $_practicanteId', error: result.error);
        return result;
      case Ok():
    }
    _practicante = result.value;
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
    final userId = _practicante.base.user?.id;
    if (userId == null) {
      return Result.error(Exception('Practicante sin usuario asociado'));
    }

    final result = await _usersRepository.updateUserHorario(userId, horarioId);
    switch (result) {
      case Error():
        _log.warning('Failed to assign horario', error: result.error);
        return result;
      case Ok():
    }

    _practicantesRepository.invalidateCache();
    _horarioRepository.invalidateCache();
    await Future.wait([load.execute(), loadHorarios.execute()]);
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