import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_incidencia_nomina.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

class IncidenciaNominaTable extends StatelessWidget {
  final ReporteIncidenciaNomina reporte;

  const IncidenciaNominaTable({super.key, required this.reporte});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final yMd = DateFormat.yMd('en_US');

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
        ...List<DataColumn>.generate(
          reporte.dates.length,
          (int index) => DataColumn(label: Text(yMd.format(reporte.dates[index]))),
        ),
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
            ...List<DataCell>.generate(reporte.dates.length, (int dayIdx) {
              final dayKey = reporte.dates[dayIdx].toShortIsoString();
              return DataCell(_CodigoChip(codigo: item.codigosPorDia[dayKey] ?? ''));
            }),
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

  // Mismos colores que la tabla "CLAVES DE INCIDENCIA" del PDF semanal
  // (ri_rh/templates/reportes/incidencias_nomina_report.html, clases
  // cell-ok/cell-red/cell-blue/cell-lightblue/cell-violet/cell-yellow/
  // cell-green/cell-orange) -- mapeo puramente presentacional, no es la
  // fuente de verdad del codigo, esa vive en STATUS_CODE_MAP del backend.
  static const _colors = <String, (Color background, Color foreground)>{
    'A': (Colors.white, Colors.black),
    'F': (Colors.red, Colors.white),
    'FJ': (Colors.red, Colors.white),
    'B': (Colors.red, Colors.white),
    'INC': (Color(0xFF87CEFA), Colors.black), // lightskyblue
    'VAC': (Color(0xFF90EE90), Colors.black), // lightgreen
    'D': (Colors.yellow, Colors.black),
    'R': (Color(0xFF4682B4), Colors.white), // steelblue
    'PSG': (Color(0xFFEE82EE), Colors.white), // violet
    'PCG': (Colors.orange, Colors.black),
    'FT': (Color(0xFFEE82EE), Colors.white), // violet
    'FNL': (Colors.red, Colors.white),
  };

  @override
  Widget build(BuildContext context) {
    if (codigo.isEmpty) {
      return Text('—', style: TextTheme.of(context).labelLarge);
    }

    final (background, foreground) = _colors[codigo] ?? (Colors.grey.shade300, Colors.black);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor, width: 0.8),
      ),
      child: Text(
        codigo,
        style: TextStyle(
          fontSize: 10,
          fontWeight: .w900,
          height: 1.5,
          color: foreground,
        ),
      ),
    );
  }
}
