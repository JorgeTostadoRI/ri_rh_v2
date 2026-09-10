import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class CambiarEstatusEmpleadoParams {
  const CambiarEstatusEmpleadoParams({
    required this.empleadoId,
    required this.nuevoEstatus,
    this.fechaBaja,
    this.cartaRenuncia,
    this.finiquitoFirmado,
    this.bajaImss,
    this.comprobanteTransferencia,
    this.convenioTerminacion,
  });

  final int empleadoId;
  final EmpleadoEstatus nuevoEstatus;
  final DateTime? fechaBaja;
  final PlatformFile? cartaRenuncia;
  final PlatformFile? finiquitoFirmado;
  final PlatformFile? bajaImss;
  final PlatformFile? comprobanteTransferencia;
  final PlatformFile? convenioTerminacion;
}

class EmpleadosViewmodel extends ChangeNotifier {
  EmpleadosViewmodel({
    required this._log,
    required this._empleadosRepository,
  }) {
    load = Command0(_load)..execute();
    cambiarEstatus = Command1(_cambiarEstatus);
  }

  final EmpleadosRepository _empleadosRepository;

  final AppLogger _log;
  late final Command0 load;
  late final Command1<String, CambiarEstatusEmpleadoParams> cambiarEstatus;

  List<Empleado> _empleados = [];
  List<Empleado> get empleados => _empleados;

  String searchText = '';

  Future<Result<void>> _load() async {
    _log.debug('Search empleados: $searchText');
    final result = await _empleadosRepository.getEmpleados();
    switch (result) {
      case Error():
        _log.warning('Failed to load empleados', error: result.error);
        _empleados = [];
      case Ok():
        _empleados = result.value;
        if (searchText.isNotEmpty) {
          _empleados = _empleados.where((emp) => emp.base.nombre.toLowerCase().contains(searchText.toLowerCase())).toList();
        }
    }
    notifyListeners();
    return result;
  }

  Future<Result<String>> _cambiarEstatus(CambiarEstatusEmpleadoParams params) async {
    final result = await _empleadosRepository.cambiarEstatus(
      params.empleadoId,
      params.nuevoEstatus,
      fechaBaja: params.fechaBaja,
      cartaRenuncia: params.cartaRenuncia,
      finiquitoFirmado: params.finiquitoFirmado,
      bajaImss: params.bajaImss,
      comprobanteTransferencia: params.comprobanteTransferencia,
      convenioTerminacion: params.convenioTerminacion,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to cambiar estatus de empleado', error: result.error);
        return result;
      case Ok():
    }

    _empleadosRepository.invalidateCache();
    await load.execute();
    return result;
  }
}