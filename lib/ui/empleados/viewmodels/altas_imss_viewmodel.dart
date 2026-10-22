import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Pestaña "Altas IMSS" de Reclutamiento: todos los empleados venidos de
/// una vacante, cada uno mostrando su paso de Fase 2 -- permite ver/
/// descargar el PDF individual, y subir el acuse de aceptación cuando el
/// contador se lo regrese a RH por fuera del sistema. El envío al contador
/// es automático cada viernes, no hay botón manual. La respuesta a la
/// evaluación (actividad 16) la da el jefe directo desde su propia
/// pantalla (ver `EvaluacionJefeViewmodel`), no desde aquí.
class AltasImssViewmodel extends ChangeNotifier {
  AltasImssViewmodel({
    required AppLogger log,
    required EmpleadosRepository empleadosRepository,
  }) : _log = log,
       _empleadosRepository = empleadosRepository {
    load = Command0(_load)..execute();
    vistaPrevia = Command1(_vistaPrevia);
    subirAltaImss = Command1(_subirAltaImss);
    subirContratoDefinitivo = Command1(_subirContratoDefinitivo);
  }

  final AppLogger _log;
  final EmpleadosRepository _empleadosRepository;

  late final Command0<List<AltaImssItem>> load;
  late final Command1<VistaPreviaAltaImss, int> vistaPrevia;
  late final Command1<void, ({int empleadoId, PlatformFile archivo})> subirAltaImss;
  late final Command1<void, ({int empleadoId, PlatformFile archivo})> subirContratoDefinitivo;

  List<AltaImssItem>? _items;
  List<AltaImssItem>? get items => _items;

  Future<Result<List<AltaImssItem>>> _load() async {
    final result = await _empleadosRepository.getAltasImssLista();
    switch (result) {
      case Error():
        _log.warning('Failed to load altas IMSS lista', error: result.error);
      case Ok():
        _items = result.value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<VistaPreviaAltaImss>> _vistaPrevia(int empleadoId) async {
    final result = await _empleadosRepository.obtenerVistaPreviaAltaImss(empleadoId);
    if (result case Error()) {
      _log.warning('Failed to obtener vista previa de alta IMSS', error: result.error);
    }
    return result;
  }

  Future<Result<void>> _subirAltaImss(({int empleadoId, PlatformFile archivo}) params) async {
    final result = await _empleadosRepository.subirAltaImss(params.empleadoId, params.archivo);
    switch (result) {
      case Error():
        _log.warning('Failed to subir alta IMSS', error: result.error);
        return result;
      case Ok():
    }
    await load.execute();
    return result;
  }

  Future<Result<void>> _subirContratoDefinitivo(({int empleadoId, PlatformFile archivo}) params) async {
    final result = await _empleadosRepository.subirContratoDefinitivo(params.empleadoId, params.archivo);
    switch (result) {
      case Error():
        _log.warning('Failed to subir contrato definitivo', error: result.error);
        return result;
      case Ok():
    }
    await load.execute();
    return result;
  }
}
