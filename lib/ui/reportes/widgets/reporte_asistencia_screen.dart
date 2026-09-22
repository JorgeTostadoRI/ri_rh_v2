import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/color_icon.dart';
import 'package:ri_rh_v2/ui/core/ui/field_switcher.dart';
import 'package:ri_rh_v2/ui/core/ui/metric_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/table_wrapper.dart';
import 'package:ri_rh_v2/ui/reportes/viewmodels/reporte_asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/reportes/viewmodels/reporte_incidencia_nomina_viewmodel.dart';
import 'package:ri_rh_v2/ui/reportes/widgets/general_attendance_table.dart';
import 'package:ri_rh_v2/ui/reportes/widgets/incidencia_nomina_report_view.dart';
import 'package:ri_rh_v2/ui/reportes/widgets/individual_attendance_table.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/debouncer.dart';

class ReporteAsistenciaScreen extends StatefulWidget {
  final ReporteAsistenciaViewmodel viewmodel;
  final ReporteIncidenciaNominaViewmodel incidenciaNominaViewmodel;

  const ReporteAsistenciaScreen({
    super.key,
    required this.viewmodel,
    required this.incidenciaNominaViewmodel,
  });

  @override
  State<ReporteAsistenciaScreen> createState() => _ReporteAsistenciaScreenState();
}

class _ReporteAsistenciaScreenState extends State<ReporteAsistenciaScreen> {
  int reportTypeIndex = 0;
  static const reportTypeLabels = ['Asistencia', 'Incidencias de Nómina'];

  int viewSelectIndex = 0;
  final List<String> viewSelectionLabels = ['Empresa', 'Empleados'];

  final TextEditingController _employeeSearchController = TextEditingController();
  final Debouncer _employeeSearchDebouncer = Debouncer(milliseconds: 300);
  String _employeeSearchQuery = '';

  @override
  void dispose() {
    _employeeSearchController.dispose();
    _employeeSearchDebouncer.dispose();
    super.dispose();
  }

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
            FieldSwitcher(
              selectedIndex: reportTypeIndex,
              options: reportTypeLabels,
              onSelected: (value) => setState(() => reportTypeIndex = value),
            ),
            if (reportTypeIndex == 1)
              IncidenciaNominaReportView(viewmodel: widget.incidenciaNominaViewmodel)
            else ...[
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
                  return TableWrapper(
                    table: GeneralAttendanceTable(reporte: reporte),
                  );
                }

                if (viewSelectIndex == 1) {
                  final query = _employeeSearchQuery.trim().toLowerCase();
                  final queryWords = query.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
                  final items = queryWords.isEmpty
                      ? reporte.items
                      : reporte.items.where((item) {
                          final nameWords = item.user.nombre.toLowerCase().split(RegExp(r'\s+'));
                          return queryWords.every((qw) => nameWords.any((nw) => nw.startsWith(qw)));
                        }).toList();

                  return Column(
                    crossAxisAlignment: .start,
                    children: [
                      TextField(
                        controller: _employeeSearchController,
                        decoration: InputDecoration(
                          hintText: 'Buscar empleado por nombre',
                          prefixIcon: Icon(LucideIcons.search),
                          prefixIconColor: const Color(0xFFC4A47A),
                        ),
                        onChanged: (value) => _employeeSearchDebouncer.run(
                          () => setState(() => _employeeSearchQuery = value),
                        ),
                      ),
                      const SizedBox(height: 32),
                      if (items.isEmpty)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Text('No se encontraron empleados que coincidan con "$query"'),
                          ),
                        )
                      else
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return TableWrapper(
                              key: ValueKey(item.user.id),
                              table: IndividualAttendanceTable(
                                item: item,
                                dates: reporte.dates,
                              ),
                            );
                          },
                          separatorBuilder: (context, _) {
                            return SizedBox(height: 32);
                          },
                        ),
                    ],
                  );
                }

                return SizedBox.shrink();
              },
            ),
            ],
          ],
        ),
      ),
    );
  }
}