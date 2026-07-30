import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';

part 'reporte_asistencia.freezed.dart';

@freezed
abstract class ReporteAsistencia with _$ReporteAsistencia {
  const factory ReporteAsistencia({
    required List<ReporteAsistenciaItem> items,
    required List<DateTime> dates,
  }) = _ReporteAsistencia;
}

@freezed
abstract class ReporteAsistenciaItem with _$ReporteAsistenciaItem {
  const factory ReporteAsistenciaItem({
    required User user,
    required List<Asistencia> attendance,
    required Map<String, List<Asistencia>> attendanceByDate,
    required int totalMinutesLate,
  }) = _ReporteAsistenciaItem;
}