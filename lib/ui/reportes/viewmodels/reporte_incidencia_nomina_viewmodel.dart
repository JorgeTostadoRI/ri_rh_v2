import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_incidencia_nomina.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

typedef AsistenciaCorreccionArgs = ({
  int usuarioId,
  DateTime fecha,
  String campo,
  String valor,
});

class ReporteIncidenciaNominaViewmodel extends ChangeNotifier {
  final AppLogger _log;
  final ReportesRepository _reportesRepository;

  ReporteIncidenciaNominaViewmodel({
    required this._log,
    required this._reportesRepository,
  }) {
    final today = DateTime.now().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    _searchRange = DateTimeRange(start: today, end: today);
    load = Command0(_load)..execute();
    corregir = Command1(_corregir);
    generarPdf = Command0(_generarPdf);
  }

  late final Command0 load;
  late final Command1<void, AsistenciaCorreccionArgs> corregir;
  late final Command0<String?> generarPdf;

  late DateTimeRange _searchRange;
  DateTimeRange get searchRange => _searchRange;
  set searchRange(DateTimeRange value) {
    _searchRange = value;
    // El PDF generado (si habia uno) ya no corresponde al rango
    // seleccionado.
    _pdfUrl = null;
    notifyListeners();
  }

  /// Se puede generar el PDF oficial cuando el rango es una semana completa
  /// (lunes-domingo, igual formato que ese PDF) o lunes-viernes -- este
  /// segundo caso es para poder regenerarlo el mismo viernes que se envia
  /// automaticamente, sin tener que esperar a que el sabado/domingo de esa
  /// semana ya hayan pasado (el selector de fechas no deja elegir dias
  /// futuros). El backend siempre calcula la semana completa a partir del
  /// lunes sin importar hasta que dia se haya seleccionado, asi que no
  /// afecta que dia incluya el PDF generado.
  bool get isFullWeekSelected {
    if (_searchRange.start.weekday != DateTime.monday) return false;
    final dias = _searchRange.end.difference(_searchRange.start).inDays;
    return dias == 6 || dias == 4;
  }

  ReporteIncidenciaNomina? _reporte;
  ReporteIncidenciaNomina get reporte => _reporte!;

  // URL del PDF ya generado para el rango actual, o null si no se ha
  // generado (o el rango cambio despues de generarlo). Vive aqui (no como
  // estado local del widget) para que sobreviva si la vista se
  // desmonta/reconstruye mientras la generacion sigue en curso (ej. el
  // usuario cambia de tab y regresa).
  String? _pdfUrl;
  String? get pdfUrl => _pdfUrl;

  Future<Result<void>> _load() async {
    _log.debug('Search: $_searchRange');

    final result = await _reportesRepository.getReporteIncidenciaNomina(
      _searchRange.start,
      _searchRange.end,
    );
    switch (result) {
      case Error():
        _log.warning(
          'Failed to fetch incidencia nomina report',
          error: result.error,
        );
        return Result.error(result.error);
      case Ok():
    }
    _reporte = result.value;

    notifyListeners();
    return const Result.ok(null);
  }

  Future<Result<void>> _corregir(AsistenciaCorreccionArgs args) async {
    final result = await _reportesRepository.corregirAsistencia(
      usuarioId: args.usuarioId,
      fecha: args.fecha,
      campo: args.campo,
      valor: args.valor,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to correct asistencia', error: result.error);
        return Result.error(result.error);
      case Ok():
    }

    // No se usa load.execute() aqui a proposito: load y corregir son
    // Commands separados con su propio candado de reentrancia -- si un
    // usuario cambia el rango de fechas (dispara load.execute() desde la
    // UI) mientras una correccion sigue guardando, ese load quedaria
    // silenciosamente descartado por seguir "corriendo" el de aqui adentro.
    // Se refresca directo contra el repositorio en su lugar.
    final reloadResult = await _reportesRepository.getReporteIncidenciaNomina(
      _searchRange.start,
      _searchRange.end,
    );
    switch (reloadResult) {
      case Error():
        // La correccion en si ya se guardo del lado del backend en este
        // punto -- si solo el refresco posterior falla, no se debe
        // reportar la correccion como fallida (el usuario reintentaria y
        // crearia una correccion duplicada para un cambio que ya aplico).
        // La tabla se queda mostrando el valor viejo hasta el proximo
        // refresco exitoso.
        _log.warning('Failed to refresh incidencia nomina report after correction', error: reloadResult.error);
        return const Result.ok(null);
      case Ok():
    }
    _reporte = reloadResult.value;
    notifyListeners();

    return const Result.ok(null);
  }

  Future<Result<String?>> _generarPdf() async {
    // Se captura el rango vigente al iniciar la solicitud: si cambia antes
    // de que la respuesta llegue, el PDF generado ya no corresponde al
    // rango que se esta viendo y no debe mostrarse.
    final requestedRange = _searchRange;
    final result = await _reportesRepository.generarReporteIncidenciaNomina(
      date: requestedRange.start,
      force: true,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to generate incidencia nomina PDF', error: result.error);
        return Result.error(result.error);
      case Ok():
    }
    if (_searchRange == requestedRange) {
      _pdfUrl = result.value;
      notifyListeners();
    }
    return Result.ok(result.value);
  }
}
