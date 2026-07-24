import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class PracticanteExpedienteViewmodel extends ChangeNotifier {
  PracticanteExpedienteViewmodel({
    required this._practicanteId,
    required this._log,
    required this._practicantesRepository,
  }) {
    load = Command0(_load)..execute();
  }

  final int _practicanteId;
  final AppLogger _log;
  final PracticantesRepository _practicantesRepository;
  late final Command0 load;

  late Practicante _practicante;
  Practicante get practicante => _practicante;

  Future<Result<void>> _load() async {
    final result = await _practicantesRepository.getPracticante(_practicanteId);
    switch(result) {
      case Error():
        return result;
      case Ok():
    }
    _practicante = result.value;
    notifyListeners();
    return result;
  }
}