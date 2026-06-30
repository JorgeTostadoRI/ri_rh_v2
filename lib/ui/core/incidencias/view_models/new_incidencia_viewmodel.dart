import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_date_option.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_file.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class NewIncidenciaViewmodel extends ChangeNotifier {
  NewIncidenciaViewmodel({
    required this._authRepository,
    required this._incidenciasRepository,
  }) {
    login = Command1<void, String>(_login);
  }

  AuthRepository _authRepository;
  IncidenciasRepository _incidenciasRepository;

  late Command1<void, String> login;

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
      solicitor: user!.id,
      categoryId: category.id,
      files: incidenciaFiles,
    );
    return _incidenciasRepository.createIncidencia(incidencia);
  }

  Future<Result<void>> _login(String fingerprint) async {
    return _authRepository.loginFingerprint(fingerprint: fingerprint);
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