import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/reportes/asistencia/reporte_asistencia_response.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/model_exception.dart';

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
    // Uses date iso string as key
    required Map<String, AsistenciaDaily> asistencia,
    required int totalMinutesLate,
  }) = _ReporteAsistenciaItem;

  factory ReporteAsistenciaItem.fromApiModel(ReporteAsistenciaResponseItem model, {
    required List<Departamento> departamentos,
  }) {
    late final User user;

    try {
      user = User(
        id: model.id,
        username: model.username,
        nombre: model.nombre,
        telefono: '',
        correo: '',
        rol: model.rol,
        departamento: departamentos.firstWhere((dep) => dep.id == model.departamentoRef),
        departamentosPermitidos: [],
        liderPermitido: false,
      );
    } on StateError {
      throw ModelException(
        'Failed to find element for user',
        context: {
          'model': 'ReporteAsistenciaItem.User',
          'id': model.id,
          'departamentoRef': model.departamentoRef,
        },
      );
    }

    final Map<String, AsistenciaDaily> mappedAsistencia = {};
    for (final asist in model.asistencia) {
      final dateKey = asist.attendedAt.toShortIsoString();
      mappedAsistencia[dateKey] = AsistenciaDaily(
        id: asist.id,
        createdAt: asist.createdAt,
        updatedAt: asist.updatedAt,
        user: user,
        attendedAt: asist.attendedAt,
        status: asist.status,
        minutesLate: asist.minutesLate,
        entryAt: asist.entryAt,
        exitToLunchAt: asist.exitToLunchAt,
        entryFromLunchAt: asist.entryFromLunchAt,
        exitAt: asist.exitAt,
        entryPhoto: asist.entryPhoto,
        exitToLunchPhoto: asist.exitToLunchPhoto,
        entryFromLunchPhoto: asist.entryFromLunchPhoto,
        exitPhoto: asist.exitPhoto,
        notes: asist.notes,
      );
    }

    return ReporteAsistenciaItem(
      user: user,
      asistencia: mappedAsistencia,
      totalMinutesLate: model.totalMinutesLate,
    );
  }
}

