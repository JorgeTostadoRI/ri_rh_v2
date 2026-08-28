import 'dart:async';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
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
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class NewIncidenciaViewmodel extends ChangeNotifier {
  NewIncidenciaViewmodel({
    required this._log,
    required this._authRepository,
    required this._incidenciasRepository,
    required this._fingerprintRepository,
  }) {
    login = Command1(_login);

    _capturesSub = _fingerprintRepository.capture()
    .listen(
      (scan) => login.execute(scan.template),
      onError: (e) {
        _log.error('NewIncidenciaViewmodel | Capture stream error', error: e);
        if (e is NoScannerAvailable) {
          _scannerAvailable = false;
        }
      }
    );
  }

  final AppLogger _log;
  final AuthRepository _authRepository;
  final IncidenciasRepository _incidenciasRepository;
  final FingerprintRepository _fingerprintRepository;

  late Command1<void, Uint8List> login;

  late final StreamSubscription<Scan> _capturesSub;
  bool _scannerAvailable = true;
  bool get scannerAvailable => _scannerAvailable;

  IncidenciaDateOption _dateOption = IncidenciaDateOption.DATE_RANGE;
  IncidenciaDateOption get dateOption => _dateOption;
  final List<String> _dateOptionLabels = ['Día completo', 'Horas'];
  List<String> get dateOptionLabels => _dateOptionLabels;

  DateTime? _startDate;
  DateTime? _endDate;

  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  String? _reason;

  List<PlatformFile> _files = [];
  List<PlatformFile> get files => _files;

  Future<bool> get isAuthenticated => _authRepository.isAuthenticated;

  @override
  void dispose() {
    _capturesSub.cancel();
    super.dispose();
  }

  void onDateOptionChanged(int index) {
    _dateOption = IncidenciaDateOption.values[index];
    notifyListeners();
  }

  void onStartDateSaved(DateTime? date) => _startDate = date;
  void onEndDateSaved(DateTime? date) => _endDate = date;
  void onStartTimeSaved(TimeOfDay? time) => _startTime = time;
  void onEndTimeSaved(TimeOfDay? time) => _endTime = time;
  void onReasonChanged(String? value) => _reason = value;

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

  /// Should only be called once the form has been validated and the user is authenticated
  Future<Result<void>> submitData(IncidenciaCategory category) async {
    final user = _authRepository.getCurrentUser();

    final incidenciaFiles = _files.map((f) => IncidenciaFile(
      filepath: '',
      file: f,
    )).toList();

    final incidencia = Incidencia(
      start: _constructDate(_startDate!, _startTime),
      end: _constructDate(_endDate ?? _startDate!, _endTime),
      reason: _reason!,
      solicitor: user!,
      category: category,
      files: incidenciaFiles,
    );
    final incidenciaResult = await _incidenciasRepository.createIncidencia(incidencia);
    switch (incidenciaResult) {
      case Ok():
        break;
      case Error():
        _log.warning('NewIncidenciaViewmodel | Failed to create incidencia', error: incidenciaResult.error);
    }

    _authRepository.logout();
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

  DateTime _constructDate(DateTime initialDate, TimeOfDay? tod) {
    switch (_dateOption) {
      case IncidenciaDateOption.DATE_RANGE:
        return initialDate;
      case IncidenciaDateOption.HOUR_RANGE:
        if (tod == null) throw ArgumentError('tod must not be null if _dateOption is HOUR_RANGE');
        return DateTime(
          initialDate.year,
          initialDate.month,
          initialDate.day,
          tod.hour,
          tod.minute,
        );
    }
  }
}