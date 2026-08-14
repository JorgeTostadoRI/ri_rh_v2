import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';
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
    final totalMinutesLate = item.asistencia.entries.fold(0, (sum, asist) => sum + asist.value.minutesLate);

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
                _LateStatusChip(minutesLate: totalMinutesLate),
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
              DataColumn(label: Text('FIN')),
              DataColumn(label: Text('TIEMPO RETARDO')),
            ],
            rows: List<DataRow>.generate(
              dates.length,
              (int dateIdx) {
                final day = dates[dateIdx];
                final attendance = item.asistencia[day.toShortIsoString()];

                if (attendance == null) {
                  return DataRow(
                    cells: [
                      DataCell(Text(yMd.format(day))),
                      DataCell(Text('SIN DATOS')),
                      DataCell(SizedBox.shrink()),
                      DataCell(SizedBox.shrink()),
                      DataCell(SizedBox.shrink()),
                      DataCell(
                        Text(
                          '0 min',
                          style: TextStyle(color: errorColor, fontWeight: .w700),
                        ),
                      ),
                    ],
                  );
                }
                
                return DataRow(
                  cells: [
                    DataCell(Text(yMd.format(day))),
                    ..._buildCheckIns(attendance, jm),
                    DataCell(
                      Text(
                        '${attendance.minutesLate} min',
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

  List<DataCell> _buildCheckIns(AsistenciaDaily attendance, DateFormat jm) {
    final entryAt = attendance.entryAt?.toLocal();
    final exitToLunchAt = attendance.exitToLunchAt?.toLocal();
    final entryFromLunchAt = attendance.entryFromLunchAt?.toLocal();
    final exitAt = attendance.exitAt?.toLocal();

    return switch (attendance.status) {
      AsistenciaStatus.present => [
        DataCell(Text(entryAt != null ? jm.format(entryAt) : '-')),
        DataCell(Text(exitToLunchAt != null ? jm.format(exitToLunchAt) : '-')),
        DataCell(Text(entryFromLunchAt != null ? jm.format(entryFromLunchAt) : '-')),
        DataCell(Text(exitAt != null ? jm.format(exitAt) : '-')),
      ],
      AsistenciaStatus.late => [
        DataCell(Text(entryAt != null ? jm.format(entryAt) : '-')),
        DataCell(Text(exitToLunchAt != null ? jm.format(exitToLunchAt) : '-')),
        DataCell(Text(entryFromLunchAt != null ? jm.format(entryFromLunchAt) : '-')),
        DataCell(Text(exitAt != null ? jm.format(exitAt) : '-')),
      ],
      AsistenciaStatus.excused => [
        DataCell(Text(entryAt != null ? jm.format(entryAt) : '-')),
        DataCell(Text(exitToLunchAt != null ? jm.format(exitToLunchAt) : '-')),
        DataCell(Text(entryFromLunchAt != null ? jm.format(entryFromLunchAt) : '-')),
        DataCell(Text(exitAt != null ? jm.format(exitAt) : '-')),
      ],
      AsistenciaStatus.absent => const [
        DataCell(Text('FALTA')),
        DataCell(Text('FALTA')),
        DataCell(Text('FALTA')),
        DataCell(Text('FALTA')),
      ],
      AsistenciaStatus.rest => const [
        DataCell(Text('DESCANSO')),
        DataCell(Text('DESCANSO')),
        DataCell(Text('DESCANSO')),
        DataCell(Text('DESCANSO')),
      ],
      AsistenciaStatus.vacation => const [
        DataCell(Text('VACACIONES')),
        DataCell(Text('VACACIONES')),
        DataCell(Text('VACACIONES')),
        DataCell(Text('VACACIONES')),
      ],
    };
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