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
    // Status real (AsistenciaDaily.status) de cada dia -- necesario para
    // preseleccionar correctamente el valor actual al editar, ya que el
    // codigo de nomina no es reversible a un status (LATE y
    // AUTHORIZED_LATE comparten codigo 'R'). Misma llave que codigosPorDia.
    required Map<String, String> statusPorDia,
    // Minutos de retardo real de CADA dia (no el total agregado de
    // minutesLate) -- necesario para precargar el valor correcto al
    // corregir el codigo de un dia especifico a Retardo. Misma llave que
    // codigosPorDia/statusPorDia.
    required Map<String, int> minutesLatePorDia,
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
    final Map<String, String> statusPorDia = {
      for (final dia in model.dias) dia.date.toShortIsoString(): dia.status,
    };
    final Map<String, int> minutesLatePorDia = {
      for (final dia in model.dias) dia.date.toShortIsoString(): dia.minutesLate,
    };

    return ReporteIncidenciaNominaItem(
      id: model.id,
      username: model.username,
      fullName: model.fullName,
      isPracticante: model.isPracticante,
      departamento: departamento,
      codigosPorDia: codigosPorDia,
      statusPorDia: statusPorDia,
      minutesLatePorDia: minutesLatePorDia,
      minutesLate: model.minutesLate,
      extraHours: model.extraHours,
    );
  }
}
