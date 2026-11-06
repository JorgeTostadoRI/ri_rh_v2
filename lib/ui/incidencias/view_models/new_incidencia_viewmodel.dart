import 'dart:async';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ri_rh_v2/config/app_error.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_date_option.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_file.dart';
import 'package:ri_rh_v2/domain/models/incidencias/hora_por_hora_resumen.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/fingerprint_login_controller.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class NewIncidenciaViewmodel extends ChangeNotifier implements FingerprintLoginController {
  NewIncidenciaViewmodel({
    required this._log,
    required this._authRepository,
    required this._incidenciasRepository,
    required this._fingerprintRepository,
  }) {
    login = Command1(_login);

    // Warms up the fingerprint match cache; without this, scans never
    // resolve to a user unless the Ingreso screen was visited first.
    _fingerprintRepository.loadFingerprints();

    _capturesSub = _fingerprintRepository.capture()
    .listen(
      (scan) {
        if (!_acceptingScans) return;
        // The scanner keeps emitting capture events for as long as the
        // finger stays on the sensor; without this debounce every single
        // one of those events re-triggers a full login attempt.
        final now = DateTime.now();
        if (_lastScanAt != null && now.difference(_lastScanAt!) < _scanDebounce) {
          return;
        }
        _lastScanAt = now;
        login.execute(scan.template);
      },
      onError: (e) {
        _log.error('NewIncidenciaViewmodel | Capture stream error', error: e);
        if (e is NoScannerAvailable) {
          _scannerAvailable = false;
        }
      }
    );
  }

  static const _scanDebounce = Duration(seconds: 2);
  DateTime? _lastScanAt;

  final AppLogger _log;
  final AuthRepository _authRepository;
  final IncidenciasRepository _incidenciasRepository;
  final FingerprintRepository _fingerprintRepository;

  @override
  late Command1<void, Uint8List> login;

  late final StreamSubscription<Scan> _capturesSub;
  bool _scannerAvailable = true;
  // _scannerAvailable solo se entera de un lector desconectado si esta
  // instancia fue la primera en suscribirse al stream (es broadcast), asi que
  // tambien se pregunta directo al lector.
  @override
  bool get scannerAvailable => _scannerAvailable && _fingerprintRepository.isScannerConnected;

  bool _acceptingScans = false;
  @override
  set acceptingScans(bool value) => _acceptingScans = value;

  IncidenciaDateOption _dateOption = IncidenciaDateOption.DATE_RANGE;
  IncidenciaDateOption get dateOption => _dateOption;
  final List<String> _dateOptionLabels = ['Día completo', 'Horas'];
  List<String> get dateOptionLabels => _dateOptionLabels;

  DateTime? _startDate;
  DateTime? _endDate;

  final TimeOfDay _min = const TimeOfDay(hour: 0, minute: 0);
  final TimeOfDay _max = const TimeOfDay(hour: 23, minute: 59);
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  String? _reason;

  // Solo Permiso: se paga con tiempo por tiempo. Las Hora por hora que lo
  // pagan se eligen al enviar (ver IncidenciaForm), ya con el usuario
  // identificado. Sin marcar, un permiso por horas sale como retardo.
  bool _tiempoPorTiempo = false;
  bool get tiempoPorTiempo => _tiempoPorTiempo;
  List<int>? _horasPorHoraRefs;

  List<PlatformFile> _files = [];
  List<PlatformFile> get files => _files;

  // Video testimonial grabado con webcam -- obligatorio solo para
  // solicitantes remotos desde navegador (ver IncidenciaForm), sustituye
  // la verificacion por huella digital que no tienen disponible ahi.
  XFile? _video;
  XFile? get video => _video;

  Future<bool> get isAuthenticated => _authRepository.isAuthenticated;
  User? get currentUser => _authRepository.getCurrentUser();

  @override
  void dispose() {
    _capturesSub.cancel();
    super.dispose();
  }

  void onDateOptionChanged(int index) {
    _dateOption = IncidenciaDateOption.values[index];
    notifyListeners();
  }

  /// Fija la opcion de fecha sin avisar a los listeners -- para usarse en el
  /// initState del formulario, que ya lee este valor en su primer build. Con
  /// [onDateOptionChanged] ahi se reconstruiria la pantalla mientras se esta
  /// construyendo ("setState() or markNeedsBuild() called during build").
  void initDateOption(IncidenciaDateOption option) => _dateOption = option;

  void onStartDateSaved(DateTime? date) => _startDate = date;
  void onEndDateSaved(DateTime? date) => _endDate = date;
  void onStartTimeSaved(TimeOfDay? time) => _startTime = time;
  void onEndTimeSaved(TimeOfDay? time) => _endTime = time;
  void onReasonChanged(String? value) => _reason = value;
  void onTiempoPorTiempoChanged(bool value) {
    _tiempoPorTiempo = value;
    notifyListeners();
  }
  void onHorasPorHoraSelected(List<int> ids) => _horasPorHoraRefs = ids;

  bool get pagaConTiempoPorTiempo => _tiempoPorTiempo;

  /// Lo que deben sumar las Hora por hora de un permiso por horas (el
  /// backend lo vuelve a validar). Null si es de dia completo, donde no se
  /// exige un minimo, o si las horas capturadas no son validas.
  int? get minutosPorCubrir {
    if (_dateOption != IncidenciaDateOption.HOUR_RANGE) return null;
    if (_startDate == null || _startTime == null || _endTime == null) return null;
    final minutos = _constructDate(_startDate!, _endTime!).difference(_constructDate(_startDate!, _startTime!)).inMinutes;
    return minutos > 0 ? minutos : null;
  }

  /// Hora por hora del usuario ya identificado que todavia puede ligar a un
  /// permiso.
  Future<Result<List<HoraPorHoraResumen>>> getHorasPorHoraDisponibles() => _incidenciasRepository.getHorasPorHoraDisponibles();

  /// Se abandona el envio despues de identificarse (ej. cancela la eleccion
  /// del permiso): en escritorio la sesion de la huella se cierra igual que
  /// al terminar un envio, ver [submitData].
  Future<void> cancelSubmit() async {
    if (!kIsWeb) await _authRepository.logout();
  }

  void addFiles(List<PlatformFile> newFiles) {
    _files = [..._files, ...newFiles];
    notifyListeners();
  }

  void removeFile(int index) {
    final newFiles = [...files];
    newFiles.removeAt(index);
    _files = newFiles;
    notifyListeners();
  }

  void onVideoRecorded(XFile video) {
    _video = video;
    notifyListeners();
  }

  void removeVideo() {
    _video = null;
    notifyListeners();
  }

  /// Should only be called once the form has been validated and the user is authenticated
  Future<Result<void>> submitData(IncidenciaCategory category) async {
    late final DateTime start;
    late final DateTime end;

    switch (_dateOption) {
      case IncidenciaDateOption.DATE_RANGE:
        start = _constructDate(_startDate!, _min);
        end = _constructDate(_endDate ?? _startDate!, _max);
      case IncidenciaDateOption.HOUR_RANGE:
        start = _constructDate(_startDate!, _startTime!);
        end = _constructDate(_startDate!, _endTime!);
    }

    final comparison = end.compareTo(start);
    if (comparison == -1 || comparison == 0) {
      return Result.error(InvalidForm('La fecha solicitada es inválida, recuerda usar formato de 24h'));
    }

    final user = _authRepository.getCurrentUser();

    final incidenciaFiles = _files.map((f) => IncidenciaFile(
      filepath: '',
      file: f,
    )).toList();

    final incidencia = Incidencia(
      start: start,
      end: end,
      reason: _reason!,
      solicitor: user!,
      category: category,
      files: incidenciaFiles,
      videoFile: _video,
      horasPorHoraRefs: category == IncidenciaCategory.permiso && pagaConTiempoPorTiempo ? _horasPorHoraRefs : null,
    );
    final incidenciaResult = await _incidenciasRepository.createIncidencia(incidencia);
    switch (incidenciaResult) {
      case Ok():
        break;
      case Error():
        _log.warning('NewIncidenciaViewmodel | Failed to create incidencia', error: incidenciaResult.error);
    }

    // En escritorio la sesion es la de la huella verificada solo para este
    // envio (ver IncidenciaForm, que la pide siempre aunque ya hubiera otra
    // sesion abierta) y debe cerrarse siempre, haya o no error -- en web, un
    // remoto ya llego con su sesion normal y persistente, que no debe perder
    // solo por enviar una incidencia. Se espera a que termine para que la
    // siguiente pantalla nunca alcance a ver la sesion de esta persona.
    if (!kIsWeb) await _authRepository.logout();
    return incidenciaResult;
  }

  Future<Result<void>> _login(Uint8List template) async {
    final userinfo = _fingerprintRepository.matchFingerprintToUser(template);
    if (userinfo == null) {
      _log.warning('NewIncidenciaViewmodel | Failed to match fingerprint');
      return Result.error(Exception('Failed to match fingerprint'));
    }

    return _authRepository.loginViaChallenge(userinfo.username);
  }

  DateTime _constructDate(DateTime initialDate, TimeOfDay tod) {
    return DateTime(
      initialDate.year,
      initialDate.month,
      initialDate.day,
      tod.hour,
      tod.minute,
    );
  }
}