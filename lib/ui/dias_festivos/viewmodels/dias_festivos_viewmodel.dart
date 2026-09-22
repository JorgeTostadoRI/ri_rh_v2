import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/dias_festivos/dias_festivos_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/dias_festivos/dia_festivo.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class DiasFestivosViewmodel extends ChangeNotifier {
  DiasFestivosViewmodel({
    required this._log,
    required this._diasFestivosRepository,
    required this._authRepository,
  }) {
    load = Command0(_load)..execute();
    create = Command1(_create);
    delete = Command1(_delete);
  }

  final AppLogger _log;
  final DiasFestivosRepository _diasFestivosRepository;
  final AuthRepository _authRepository;

  late Command0 load;
  late Command1<void, DiaFestivo> create;
  late Command1<void, int> delete;

  List<DiaFestivo> _diasFestivos = [];
  List<DiaFestivo> get diasFestivos => _diasFestivos;

  bool _hasPermissions = false;
  bool get hasPermissions => _hasPermissions;

  void _sort() {
    _diasFestivos.sort((a, b) => a.fecha.compareTo(b.fecha));
  }

  Future<Result<void>> _load() async {
    _hasPermissions = await _authRepository.isRH;

    final result = await _diasFestivosRepository.getDiasFestivos();
    switch (result) {
      case Ok():
        _diasFestivos = result.value;
        _sort();
      case Error():
        _log.warning(
          'DiasFestivosViewmodel | Error obteniendo dias festivos',
          error: result.error,
        );
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _create(DiaFestivo diaFestivo) async {
    final result = await _diasFestivosRepository.createDiaFestivo(diaFestivo);
    switch (result) {
      case Ok():
        _diasFestivos.add(result.value);
        _sort();
      case Error():
        _log.error(
          'DiasFestivosViewmodel | Error creando dia festivo',
          error: result.error,
        );
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _delete(int id) async {
    final result = await _diasFestivosRepository.deleteDiaFestivo(id);
    switch (result) {
      case Ok():
        _diasFestivos.removeWhere((diaFestivo) => diaFestivo.id == id);
      case Error():
        _log.error(
          'DiasFestivosViewmodel | Error borrando dia festivo',
          error: result.error,
        );
    }
    notifyListeners();
    return result;
  }
}
