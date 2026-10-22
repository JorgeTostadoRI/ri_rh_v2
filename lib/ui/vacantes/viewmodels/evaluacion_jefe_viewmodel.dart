import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Actividad 16: el jefe directo contesta, desde su propia pantalla
/// (autenticada), la evaluación de un empleado con contrato "determinado"
/// que está por vencer -- llega aquí por el link del correo de la
/// actividad 15, o por el botón "Evaluación pendiente" del panel de RH.
class EvaluacionJefeViewmodel extends ChangeNotifier {
  EvaluacionJefeViewmodel({
    required this.token,
    required AppLogger log,
    required EmpleadosRepository empleadosRepository,
  }) : _log = log,
       _empleadosRepository = empleadosRepository {
    load = Command1(_load)..execute(token);
    responder = Command1(_responder);
  }

  final String token;
  final AppLogger _log;
  final EmpleadosRepository _empleadosRepository;

  late final Command1<EvaluacionDetalle, String> load;
  EvaluacionDetalle? _detalle;
  EvaluacionDetalle? get detalle => _detalle;

  late final Command1<void, ({EvaluacionRespuesta respuesta, String? motivo})> responder;

  Future<Result<EvaluacionDetalle>> _load(String token) async {
    final result = await _empleadosRepository.getEvaluacionDetalle(token);
    switch (result) {
      case Error():
        _log.warning('Failed to load evaluacion detalle', error: result.error);
      case Ok():
        _detalle = result.value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _responder(({EvaluacionRespuesta respuesta, String? motivo}) params) async {
    final result = await _empleadosRepository.responderEvaluacion(token, params.respuesta, motivo: params.motivo);
    switch (result) {
      case Error():
        _log.warning('Failed to responder evaluacion', error: result.error);
        return result;
      case Ok():
    }
    await load.execute(token);
    return result;
  }
}
