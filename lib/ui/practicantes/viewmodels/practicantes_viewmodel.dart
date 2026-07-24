import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class PracticantesViewmodel extends ChangeNotifier {
  PracticantesViewmodel({
    required this._log,
    required this._practicantesRepository,
  }) {
    search = Command0(_search)..execute();
  }

  final AppLogger _log;
  final PracticantesRepository _practicantesRepository;

  late final Command0 search;

  List<Practicante> _practicantes = [];
  List<Practicante> get practicantes => _practicantes;

  String searchText = '';

  Future<Result<void>> _search() async {
    _log.debug('Search practicantes: $searchText');
    final resultPracticantes = await _practicantesRepository.getPracticantes();
    switch (resultPracticantes) {
      case Error():
        _log.warning('Failed to fetch practicantes', error: resultPracticantes.error);
        return Result.error(resultPracticantes.error);
      case Ok():
    }

    _practicantes = resultPracticantes.value;
    notifyListeners();
    return const Result.ok(null);
  }
}