import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class CambiarEstadoPracticanteParams {
  const CambiarEstadoPracticanteParams({
    required this.practicanteId,
    required this.nuevoEstado,
    this.fechaBaja,
    this.cartaLiberacion,
  });

  final int practicanteId;
  final StatusPracticante nuevoEstado;
  final DateTime? fechaBaja;
  final PlatformFile? cartaLiberacion;
}

class PracticantesViewmodel extends ChangeNotifier {
  PracticantesViewmodel({
    required this._log,
    required this._practicantesRepository,
  }) {
    search = Command0(_search)..execute();
    cambiarEstado = Command1(_cambiarEstado);
  }

  final AppLogger _log;
  final PracticantesRepository _practicantesRepository;

  late final Command0 search;
  late final Command1<String, CambiarEstadoPracticanteParams> cambiarEstado;

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
    if (searchText.isNotEmpty) {
      _practicantes = _practicantes.where(
        (practicante) => practicante.base.nombre.toLowerCase().contains(searchText.toLowerCase())
      ).toList();
    }
    notifyListeners();
    return const Result.ok(null);
  }

  Future<Result<String>> _cambiarEstado(CambiarEstadoPracticanteParams params) async {
    final result = await _practicantesRepository.cambiarEstado(
      params.practicanteId,
      params.nuevoEstado,
      fechaBaja: params.fechaBaja,
      cartaLiberacion: params.cartaLiberacion,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to cambiar estado de practicante', error: result.error);
        return result;
      case Ok():
    }

    _practicantesRepository.invalidateCache();
    await search.execute();
    return result;
  }
}