import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/avisos/avisos_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:table_calendar/table_calendar.dart';

class AvisosViewmodel extends ChangeNotifier {
  AvisosViewmodel({
    required this._log,
    required this._avisosRepository,
    required this._authRepository,
  }) {
    final today = DateTime.now();
    _focusedDay = today;
    _selectedDay = today;
    load = Command1(_load)..execute(today);
    create = Command1(_create);
    edit = Command1(_edit);
    delete = Command1(_delete);
  }

  final AppLogger _log;
  final AvisosRepository _avisosRepository;
  final AuthRepository _authRepository;

  late Command1<void, DateTime> load;

  late Command1<void, Aviso> create;

  late Command1<void, Aviso> edit;

  late Command1<void, int> delete;

  late DateTime _focusedDay;
  DateTime get focusedDay => _focusedDay;

  DateTime get firstDay => DateTime(2026, 6, 1);
  DateTime get lastDay => DateTime.now().add(const Duration(days: 365));

  late DateTime _selectedDay;

  final LinkedHashMap<DateTime, List<Aviso>> _avisosCache = LinkedHashMap(
    equals: isSameDay,
  );
  List<Aviso> _avisos = [];
  List<Aviso> get avisos => _avisos;

  bool _hasPermissions = false;
  bool get hasPermissions => _hasPermissions;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    _selectedDay = selectedDay;
    _focusedDay = focusedDay;
    load.execute(selectedDay);
    notifyListeners();
  }

  bool selectedDayPredicate(DateTime day) {
    return isSameDay(_selectedDay, day);
  }

  Future<Result<void>> _load(DateTime day) async {
    _hasPermissions = await _authRepository.isRH;

    final isoString = day.toShortIsoString();
    if (_avisosCache[day] == null) {
      final result = await _avisosRepository.getAvisos(query: day);

      switch (result) {
        case Ok():
          _avisosCache[day] = result.value;
          _avisos = _avisosCache[day]!;
          _log.debug('AvisosViewmodel | Cached avisos for $isoString');
        case Error():
          _avisos = [];
          _log.warning('AvisosViewmodel | Error obtaining avisos for $isoString', error: result.error);
      }
      notifyListeners();
      return result;
    } else {
      _avisos = _avisosCache[day]!;
      notifyListeners();
      return const Result.ok(null);
    }
  }

  Future<Result<void>> _create(Aviso aviso) async {
    final result = await _avisosRepository.createAviso(aviso);
    switch (result) {
      case Ok():
        _avisos.add(result.value);
        _avisosCache[_focusedDay] = _avisos;
      case Error():
        _log.error('AvisosViewmodel | Error creating aviso', error: result.error);
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _edit(Aviso aviso) async {
    final result = await _avisosRepository.editAviso(aviso);
    switch (result) {
      case Ok():
        _avisos.removeWhere((search) => search.id == result.value.id);
        _avisos.add(result.value);
        _avisosCache[_focusedDay] = _avisos;
      case Error():
        _log.error('AvisosViewmodel | Error editing aviso', error: result.error);
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _delete(int id) async {
    final result = await _avisosRepository.deleteAviso(id);
    switch (result) {
      case Ok():
        _avisos.removeWhere((aviso) => aviso.id == id);
        _avisosCache[_focusedDay] = _avisos;
      case Error():
        _log.error('AvisosViewmodel | Error deleting aviso', error: result.error);
    }
    notifyListeners();
    return result;
  }
}