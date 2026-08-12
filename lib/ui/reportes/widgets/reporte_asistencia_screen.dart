import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/color_icon.dart';
import 'package:ri_rh_v2/ui/core/ui/field_switcher.dart';
import 'package:ri_rh_v2/ui/core/ui/metric_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/reportes/viewmodels/reporte_asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/reportes/widgets/general_attendance_table.dart';
import 'package:ri_rh_v2/ui/reportes/widgets/individual_attendance_table.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

class ReporteAsistenciaScreen extends StatefulWidget {
  final ReporteAsistenciaViewmodel viewmodel;

  const ReporteAsistenciaScreen({
    super.key,
    required this.viewmodel,
  });

  @override
  State<ReporteAsistenciaScreen> createState() => _ReporteAsistenciaScreenState();
}

class _ReporteAsistenciaScreenState extends State<ReporteAsistenciaScreen> {
  int viewSelectIndex = 0;
  final List<String> viewSelectionLabels = ['Empresa', 'Empleados'];

  String _formatSearchRange() {
    final dateFormat = DateFormat.yMMMMd();
    final start = widget.viewmodel.searchRange.start;
    final end = widget.viewmodel.searchRange.end;

    if (start.isSameDay(end)) {
      return dateFormat.format(start);
    }
    return '${dateFormat.format(start)} - ${dateFormat.format(end)}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          spacing: 32,
          crossAxisAlignment: .start,
          children: [
            PageHeader(
              title: 'Reporte de Asistencia',
              subtitle: 'Registros de ingreso por período',
            ),
            Row(
              children: [
                ListenableBuilder(
                  listenable: widget.viewmodel,
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
                        widget.viewmodel.searchRange = selection;
                        widget.viewmodel.load.execute();
                      },
                      icon: Icon(LucideIcons.calendar),
                      label: Text(_formatSearchRange()),
                    );
                  }
                ),
                Spacer(),
                FieldSwitcher(
                  selectedIndex: viewSelectIndex,
                  options: viewSelectionLabels,
                  onSelected: (value) => setState(() => viewSelectIndex = value),
                ),
              ],
            ),
            ListenableBuilder(
              listenable: widget.viewmodel,
              builder: (context, _) {
                return Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    MetricCard(
                      label: 'EMPLEADOS',
                      value: widget.viewmodel.employeeCount.toString(),
                      subtitle: 'en el reporte',
                      icon: ColorIcon(
                        backgroundColor: statusWarningBgColor,
                        iconColor: primaryColor,
                        icon: LucideIcons.usersRound,
                      ),
                    ),
                    MetricCard(
                      label: 'CON REGISTRO',
                      value: widget.viewmodel.entriesCount.toString(),
                      subtitle: 'entradas totales',
                      icon: ColorIcon(
                        backgroundColor: statusSuccessBgColor,
                        iconColor: statusSuccessColor,
                        icon: LucideIcons.circleCheckBig,
                      ),
                    ),
                    MetricCard(
                      label: 'FALTAS',
                      value: widget.viewmodel.absenceCount.toString(),
                      subtitle: 'acumuladas',
                      icon: ColorIcon(
                        backgroundColor: statusFailureBgColor,
                        iconColor: statusFailureColor,
                        icon: LucideIcons.userRoundX,
                      ),
                    ),
                    MetricCard(
                      label: 'MINS RETARDO',
                      value: widget.viewmodel.minutesLateSum.toString(),
                      subtitle: 'acumulados',
                      icon: ColorIcon(
                        backgroundColor: statusFailureBgColor,
                        iconColor: statusFailureColor,
                        icon: LucideIcons.trendingDown,
                      ),
                    ),
                  ],
                );
              }
            ),
            ListenableBuilder(
              listenable: widget.viewmodel.load,
              builder: (context, _) {
                if (widget.viewmodel.load.running) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (widget.viewmodel.load.error) {
                  return ElevatedButton.icon(
                    onPressed: () => widget.viewmodel.load.execute(),
                    icon: Icon(LucideIcons.rotateCcw),
                    label: Text('Reintentar'),
                  );
                }

                final reporte = widget.viewmodel.reporte;
                if (viewSelectIndex == 0) {
                  return _TableWrapper(
                    table: GeneralAttendanceTable(reporte: reporte),
                  );
                }

                if (viewSelectIndex == 1) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: reporte.items.length,
                    itemBuilder: (context, index) {
                      return _TableWrapper(
                        table: IndividualAttendanceTable(
                          item: reporte.items[index],
                          dates: reporte.dates,
                        ),
                      );
                    },
                    separatorBuilder: (context, _) {
                      return SizedBox(height: 32);
                    },
                  );
                }

                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TableWrapper extends StatefulWidget {
  final Widget table;

  const _TableWrapper({
    required this.table,
  });

  @override
  State<_TableWrapper> createState() => _TableWrapperState();
}

class _TableWrapperState extends State<_TableWrapper> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        controller: _scrollController,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 800),
          child: widget.table,
        ),
      ),
    );
  }
}