import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/status_chip.dart';
import 'package:ri_rh_v2/ui/core/ui/user_section.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

class IndividualAttendanceTable extends StatelessWidget {
  final ReporteAsistenciaItem item;
  final List<DateTime> dates;

  const IndividualAttendanceTable({
    super.key,
    required this.item,
    required this.dates,
  });

  @override
  Widget build(BuildContext context) {
    final yMd = DateFormat.yMd();
    final jm = DateFormat.jm();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF5),
        borderRadius: BorderRadius.circular(20),
        border: Border.fromBorderSide(BorderSide(
          color: borderColor,
          width: 0.8,
        ))
      ),
      child: Column(
        spacing: 16,
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              spacing: 32,
              children: [
                UserSection(user: item.user),
                _LateStatusChip(minutesLate: item.totalMinutesLate),
              ],
            ),
          ),
          DataTable(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            columns: [
              DataColumn(label: Text('FECHA')),
              DataColumn(label: Text('INICIO')),
              DataColumn(label: Table(
                defaultColumnWidth: _innerTableDefaultColWidth,
                children: [
                  TableRow(
                    children: [
                      Text('ENTRADA'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('COMIDA'),
                    ],
                  ),
                ],
              )),
              DataColumn(label: Table(
                defaultColumnWidth: _innerTableDefaultColWidth,
                children: [
                  TableRow(
                    children: [
                      Text('SALIDA'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('COMIDA'),
                    ],
                  ),
                ],
              )),
              DataColumn(label: Text('FIN')),
              DataColumn(label: Text('TIEMPO RETARDO')),
            ],
            rows: List<DataRow>.generate(
              dates.length,
              (int dateIdx) {
                final day = dates[dateIdx];
                final attendanceOfDay = item.attendanceByDate[day.toShortIsoString()]!;
                final minutesLateOfDay = attendanceOfDay.fold(0, (sum, attendance) => sum + attendance.minutesLate);
                
                return DataRow(
                  cells: [
                    DataCell(Text(yMd.format(day))),
                    ...List<DataCell>.generate(
                      4,
                      (int attendanceIdx) {
                        if (attendanceIdx < attendanceOfDay.length) {
                          final attendance = attendanceOfDay[attendanceIdx];
                          return DataCell(Text(jm.format(attendance.createdAt!.toLocal())));
                        }
                        return DataCell(Text('FALTA'));
                      },
                    ),
                    DataCell(
                      Text(
                        '$minutesLateOfDay min',
                        style: TextStyle(color: errorColor, fontWeight: .w700),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static const TableColumnWidth _innerTableDefaultColWidth = FixedColumnWidth(70);
}

class _LateStatusChip extends StatelessWidget {
  final int minutesLate;

  const _LateStatusChip({
    required this.minutesLate,
  });

  @override
  Widget build(BuildContext context) {
    if (minutesLate == 0) {
      return StatusChip(
        type: StatusChipType.success,
        label: 'Sin retardo',
      );
    }

    return StatusChip(
      type: StatusChipType.failure,
      label: '$minutesLate min retardo',
    );
  }
}