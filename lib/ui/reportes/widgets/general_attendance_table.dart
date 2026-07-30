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
    final yMd = DateFormat.yMd();
    final jm = DateFormat.jm();
    final periodCellWidth = 140.0;

    return DataTable(
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
              label: Column(
                mainAxisSize: .min,
                children: [
                  Text(yMd.format(day)),
                  Row(
                    spacing: 16,
                    mainAxisSize: .min,
                    children: [
                      SizedBox(width: periodCellWidth, child: Text('INICIO')),
                      SizedBox(width: periodCellWidth, child: Text('ENTRADA COMIDA')),
                      SizedBox(width: periodCellWidth, child: Text('SALIDA COMIDA')),
                      SizedBox(width: periodCellWidth, child: Text('FIN')),
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
          return DataRow(
            cells: [
              DataCell(
                Text(item.user.nombre),
              ),
              DataCell(
                Text(item.user.departamento.nombre), 
              ),
              ...List<DataCell>.generate(
                reporte.dates.length,
                (int dayIdx) {
                  final day = reporte.dates[dayIdx];
                  final attendance = item.attendanceByDate[day.toShortIsoString()]!;
                  return DataCell(
                    Row(
                      mainAxisSize: .min,
                      spacing: 8,
                      children: List<Widget>.generate(
                        4,
                        (int attendanceIdx) {
                          if (attendanceIdx < attendance.length) {
                            return SizedBox(
                              width: periodCellWidth,
                              child: Text(jm.format(attendance[attendanceIdx].createdAt!.toLocal())),
                            );
                          }
                          return SizedBox(
                            width: periodCellWidth,
                            child: Text('FALTA'),
                          );
                        },
                      ),
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
}