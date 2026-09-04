import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

class GeneralAttendanceTable extends StatelessWidget {
  final ReporteAsistencia reporte;

  const GeneralAttendanceTable({
    super.key,
    required this.reporte,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final yMd = DateFormat.yMd('en_US');

    return DataTable(
      headingRowHeight: 80,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF5),
        borderRadius: BorderRadius.circular(20),
        border: Border.fromBorderSide(BorderSide(
          color: borderColor,
          width: 0.8,
        ))
      ),
      columns: [
        DataColumn(
          label: Text('EMPLEADO'),
        ),
        DataColumn(
          label: Text('DEPARTAMENTO'),
        ),
        ...List<DataColumn>.generate(
          reporte.dates.length,
          (int index) {
            final day = reporte.dates[index];
            return DataColumn(
              label: Table(
                defaultColumnWidth: _innerTableDefaultColWidth,
                children: [
                  TableRow(
                    children: [
                      Text(yMd.format(day)),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                    ],
                  ),
                  TableRow(
                    children: [
                      SizedBox.shrink(),
                      Text('SALIDA'),
                      Text('ENTRADA'),
                      SizedBox.shrink(),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('INICIO'),
                      Text('COMIDA'),
                      Text('COMIDA'),
                      Text('FIN'),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        DataColumn(
          label: Text('TIEMPO RETARDO'),
        ),
      ],
      rows: List<DataRow>.generate(
        reporte.items.length,
        (int index) {
          final item = reporte.items[index];

          return DataRow.byIndex(
            index: index,
            color: WidgetStateProperty.resolveWith<Color?>((states) {
              return index.isOdd ? const Color(0xFFFFFAF5) : Colors.white; 
            }),
            cells: [
              DataCell(
                Text(
                  item.user.nombre,
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: 14,
                  )
                ),
              ),
              DataCell(
                Text(
                  item.user.departamento?.nombre ?? 'SIN DEPARTAMENTO',
                  style: textTheme.labelLarge,
                ),
              ),
              ...List<DataCell>.generate(
                reporte.dates.length,
                (int dayIdx) {
                  final day = reporte.dates[dayIdx];
                  final attendance = item.asistencia[day.toShortIsoString()];

                  if (attendance == null) {
                    return DataCell(Text('SIN DATOS'));
                  }

                  return DataCell(
                    Table(
                      defaultColumnWidth: _innerTableDefaultColWidth,
                      children: _buildCheckInTableRow(attendance),
                    ),
                  );
                }
              ),
              DataCell(
                Text('${item.totalMinutesLate} min', style: TextStyle(color: errorColor, fontWeight: .w700)),
              ),
            ],
          );
        },
      ),
    );
  }

  List<TableRow> _buildCheckInTableRow(AsistenciaDaily attendance) {
    final jm = DateFormat.jm('en_US');

    return switch(attendance.status) {
      AsistenciaStatus.present => [TableRow(children: [
        Text(attendance.entryAt != null ? jm.format(attendance.entryAt!.toLocal()) : '-'),
        Text(attendance.exitToLunchAt != null ? jm.format(attendance.exitToLunchAt!.toLocal()) : '-'),
        Text(attendance.entryFromLunchAt != null ? jm.format(attendance.entryFromLunchAt!.toLocal()) : '-'),
        Text(attendance.exitAt != null ? jm.format(attendance.exitAt!.toLocal()) : '-'),
      ])],
      AsistenciaStatus.late => [TableRow(children: [
        Text(attendance.entryAt != null ? jm.format(attendance.entryAt!.toLocal()) : '-'),
        Text(attendance.exitToLunchAt != null ? jm.format(attendance.exitToLunchAt!.toLocal()) : '-'),
        Text(attendance.entryFromLunchAt != null ? jm.format(attendance.entryFromLunchAt!.toLocal()) : '-'),
        Text(attendance.exitAt != null ? jm.format(attendance.exitAt!.toLocal()) : '-'),
      ])],
      AsistenciaStatus.excused => [TableRow(children: [
        Text(attendance.entryAt != null ? jm.format(attendance.entryAt!.toLocal()) : '-'),
        Text(attendance.exitToLunchAt != null ? jm.format(attendance.exitToLunchAt!.toLocal()) : '-'),
        Text(attendance.entryFromLunchAt != null ? jm.format(attendance.entryFromLunchAt!.toLocal()) : '-'),
        Text(attendance.exitAt != null ? jm.format(attendance.exitAt!.toLocal()) : '-'),
      ])],
      AsistenciaStatus.absent => const [TableRow(children: [
        Text('FALTA'),
        Text('FALTA'),
        Text('FALTA'),
        Text('FALTA'),
      ])],
      AsistenciaStatus.rest => const [TableRow(children: [
        Text('DESCANSO'),
        Text('DESCANSO'),
        Text('DESCANSO'),
        Text('DESCANSO'),
      ])],
      AsistenciaStatus.vacation => const [TableRow(children: [
        Text('VACACIONES'),
        Text('VACACIONES'),
        Text('VACACIONES'),
        Text('VACACIONES'),
      ])],
    };
  }

  static const TableColumnWidth _innerTableDefaultColWidth = FixedColumnWidth(100);
}