import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/reportes/incidencia_nomina/reporte_incidencia_nomina_response.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/model_exception.dart';

part 'reporte_incidencia_nomina.freezed.dart';

@freezed
abstract class ReporteIncidenciaNomina with _$ReporteIncidenciaNomina {
  const factory ReporteIncidenciaNomina({
    required List<DateTime> dates,
    required List<ReporteIncidenciaNominaItem> items,
  }) = _ReporteIncidenciaNomina;
}

@freezed
abstract class ReporteIncidenciaNominaItem with _$ReporteIncidenciaNominaItem {
  const factory ReporteIncidenciaNominaItem({
    required int id,
    required String username,
    required String fullName,
    required bool isPracticante,
    Departamento? departamento,
    // Codigo de nomina por dia (ej. 'A', 'F', 'R', 'VAC') -- opaco para el
    // frontend, la fuente de verdad es STATUS_CODE_MAP en el backend. Llave
    // es el iso string de la fecha (mismo patron que
    // ReporteAsistenciaItem.asistencia).
    required Map<String, String> codigosPorDia,
    required int minutesLate,
    required double extraHours,
  }) = _ReporteIncidenciaNominaItem;

  factory ReporteIncidenciaNominaItem.fromApiModel(
    ReporteIncidenciaNominaResponseItem model, {
    required List<Departamento> departamentos,
  }) {
    late final Departamento? departamento;

    try {
      departamento = model.departamentoRef == null
          ? null
          : departamentos.firstWhere((dep) => dep.id == model.departamentoRef);
    } on StateError {
      throw ModelException(
        'Failed to find element for incidencia nomina item',
        context: {
          'model': 'ReporteIncidenciaNominaItem.Departamento',
          'id': model.id,
          'departamentoRef': model.departamentoRef,
        },
      );
    }

    final Map<String, String> codigosPorDia = {
      for (final dia in model.dias) dia.date.toShortIsoString(): dia.codigo,
    };

    return ReporteIncidenciaNominaItem(
      id: model.id,
      username: model.username,
      fullName: model.fullName,
      isPracticante: model.isPracticante,
      departamento: departamento,
      codigosPorDia: codigosPorDia,
      minutesLate: model.minutesLate,
      extraHours: model.extraHours,
    );
  }
}
