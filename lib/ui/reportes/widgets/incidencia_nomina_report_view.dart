import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/table_wrapper.dart';
import 'package:ri_rh_v2/ui/reportes/viewmodels/reporte_incidencia_nomina_viewmodel.dart';
import 'package:ri_rh_v2/ui/reportes/widgets/incidencia_nomina_table.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

class IncidenciaNominaReportView extends StatelessWidget {
  final ReporteIncidenciaNominaViewmodel viewmodel;

  const IncidenciaNominaReportView({super.key, required this.viewmodel});

  String _formatSearchRange() {
    final dateFormat = DateFormat.yMMMMd();
    final start = viewmodel.searchRange.start;
    final end = viewmodel.searchRange.end;

    if (start.isSameDay(end)) {
      return dateFormat.format(start);
    }
    return '${dateFormat.format(start)} - ${dateFormat.format(end)}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 32,
      children: [
        ListenableBuilder(
          listenable: viewmodel,
          builder: (context, _) {
            return OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: headingTextColor,
                iconColor: primaryColor,
              ),
              onPressed: () async {
                final today = DateTime.now();
                final selection = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2026, 01, 01),
                  lastDate: today,
                );
                if (selection == null) {
                  return;
                }
                viewmodel.searchRange = selection;
                viewmodel.load.execute();
              },
              icon: Icon(LucideIcons.calendar),
              label: Text(_formatSearchRange()),
            );
          },
        ),
        ListenableBuilder(
          listenable: viewmodel.load,
          builder: (context, _) {
            if (viewmodel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewmodel.load.error) {
              return ElevatedButton.icon(
                onPressed: () => viewmodel.load.execute(),
                icon: Icon(LucideIcons.rotateCcw),
                label: Text('Reintentar'),
              );
            }

            return TableWrapper(
              table: IncidenciaNominaTable(reporte: viewmodel.reporte),
            );
          },
        ),
      ],
    );
  }
}
