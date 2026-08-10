import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    final yMd = DateFormat.yMd();
    final jm = DateFormat.jm();

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
                      Text('ENTRADA'),
                      Text('SALIDA'),
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
                  item.user.departamento.nombre,
                  style: textTheme.labelLarge,
                ),
              ),
              ...List<DataCell>.generate(
                reporte.dates.length,
                (int dayIdx) {
                  final day = reporte.dates[dayIdx];
                  final attendance = item.attendanceByDate[day.toShortIsoString()]!;
                  return DataCell(
                    Table(
                      defaultColumnWidth: _innerTableDefaultColWidth,
                      children: [
                        TableRow(
                          children: List<Widget>.generate(
                            4,
                            (int attendanceIdx) {
                              if (attendanceIdx < attendance.length) {
                                return Text(jm.format(attendance[attendanceIdx].createdAt!.toLocal()));
                              }
                              return Text('FALTA');
                            }
                          ),
                        ),
                      ],
                    ),
                  );
                },
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

  static const TableColumnWidth _innerTableDefaultColWidth = FixedColumnWidth(100);
}