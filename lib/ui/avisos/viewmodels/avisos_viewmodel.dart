import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/repositories/avisos/avisos_repository.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:table_calendar/table_calendar.dart';

class AvisosViewmodel extends ChangeNotifier {
  AvisosViewmodel({
    required this._avisosRepository,
  }) {
    final today = DateTime.now();
    _focusedDay = today;
    _selectedDay = today;
    load = Command1(_load)..execute(today);
    create = Command1(_create);
    delete = Command1(_delete);
  }

  final AvisosRepository _avisosRepository;

  final Logger _logger = Logger();

  late Command1<void, DateTime> load;

  late Command1<void, Aviso> create;

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
    final isoString = day.toShortIsoString();
    if (_avisosCache[day] == null) {
      final result = await _avisosRepository.getAvisos(query: day);

      switch (result) {
        case Ok():
          _avisosCache[day] = result.value;
          _avisos = _avisosCache[day]!;
          _logger.d('Cached avisos for $isoString');
        case Error():
          _avisos = [];
          _logger.w('Error obtaining avisos for $isoString', error: result.error);
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
        _logger.e('Error creating aviso', error: result.error);
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
        _logger.e('Error deleting aviso', error: result.error);
    }
    notifyListeners();
    return result;
  }
}