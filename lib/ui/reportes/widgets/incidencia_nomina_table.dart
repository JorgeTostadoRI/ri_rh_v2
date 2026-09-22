import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_incidencia_nomina.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/status_chip.dart';

class IncidenciaNominaTable extends StatelessWidget {
  final ReporteIncidenciaNomina reporte;

  const IncidenciaNominaTable({super.key, required this.reporte});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return DataTable(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF5),
        borderRadius: BorderRadius.circular(20),
        border: Border.fromBorderSide(
          BorderSide(color: borderColor, width: 0.8),
        ),
      ),
      columns: [
        DataColumn(label: Text('EMPLEADO')),
        DataColumn(label: Text('TIPO')),
        DataColumn(label: Text('DEPARTAMENTO')),
        DataColumn(label: Text('CÓDIGO')),
        DataColumn(label: Text('MIN. RETARDO')),
        DataColumn(label: Text('HORAS EXTRA')),
      ],
      rows: List<DataRow>.generate(reporte.items.length, (int index) {
        final item = reporte.items[index];

        return DataRow.byIndex(
          index: index,
          color: WidgetStateProperty.resolveWith<Color?>((states) {
            return index.isOdd ? const Color(0xFFFFFAF5) : Colors.white;
          }),
          cells: [
            DataCell(
              Text(
                item.fullName,
                style: textTheme.headlineSmall?.copyWith(fontSize: 14),
              ),
            ),
            DataCell(
              Text(
                item.isPracticante ? 'Practicante' : 'Empleado',
                style: textTheme.labelLarge,
              ),
            ),
            DataCell(
              Text(
                item.departamento?.nombre ?? 'SIN DEPARTAMENTO',
                style: textTheme.labelLarge,
              ),
            ),
            DataCell(_CodigoChip(codigo: item.codigo)),
            DataCell(
              Text(
                '${item.minutesLate} min',
                style: TextStyle(color: errorColor, fontWeight: .w700),
              ),
            ),
            DataCell(
              Text(_formatHours(item.extraHours), style: textTheme.labelLarge),
            ),
          ],
        );
      }),
    );
  }

  String _formatHours(double hours) {
    if (hours == 0) return '-';
    final isWhole = hours == hours.roundToDouble();
    return '${isWhole ? hours.toStringAsFixed(0) : hours.toStringAsFixed(1)} h';
  }
}

class _CodigoChip extends StatelessWidget {
  const _CodigoChip({required this.codigo});

  final String codigo;

  // Mapeo puramente presentacional (no es la fuente de verdad del codigo,
  // esa vive en STATUS_CODE_MAP del backend) -- agrupa los codigos en los 3
  // tonos semanticos que ya existen en el sistema de diseno.
  static const _failureCodes = {'F', 'FJ', 'PSG', 'INC'};
  static const _warningCodes = {'R', 'D', 'FNL'};

  StatusChipType get _type {
    if (_failureCodes.contains(codigo)) return StatusChipType.failure;
    if (_warningCodes.contains(codigo)) return StatusChipType.warning;
    return StatusChipType.success;
  }

  @override
  Widget build(BuildContext context) {
    if (codigo.isEmpty) {
      return Text('—', style: TextTheme.of(context).labelLarge);
    }

    return StatusChip(type: _type, label: codigo);
  }
}
