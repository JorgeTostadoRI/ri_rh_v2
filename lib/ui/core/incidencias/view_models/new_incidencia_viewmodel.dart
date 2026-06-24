import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_date_option.dart';
import 'package:ri_rh_v2/utils/result.dart';

class NewIncidenciaViewmodel extends ChangeNotifier {
  NewIncidenciaViewmodel({
    required this._authRepository,
    required this._incidenciasRepository,
  });

  AuthRepository _authRepository;
  IncidenciasRepository _incidenciasRepository;

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

  /// Should only be called once the form has been validated
  Result<void> submitData() {
    print('startDate: $_startDate');
    print('endDate: $_endDate');
    print('startTime: $_startTime');
    print('endTime: $_endTime');
    print('reason: $_reason');
    print('files: ${_files.map((f) => f.name).toList()}');
    return Result.ok(null);
  }
}