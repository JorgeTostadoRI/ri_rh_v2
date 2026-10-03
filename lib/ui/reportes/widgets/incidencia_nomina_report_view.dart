import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/reportes/viewmodels/reporte_incidencia_nomina_viewmodel.dart';
import 'package:ri_rh_v2/ui/reportes/widgets/asistencia_correccion_dialogs.dart';
import 'package:ri_rh_v2/ui/reportes/widgets/incidencia_nomina_table.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/debouncer.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:url_launcher/url_launcher.dart';

const _campoStatus = 'status';
const _campoMinutosRetardo = 'minutos_retardo';
const _campoHorasExtra = 'horas_extra';

class IncidenciaNominaReportView extends StatefulWidget {
  final ReporteIncidenciaNominaViewmodel viewmodel;

  const IncidenciaNominaReportView({super.key, required this.viewmodel});

  @override
  State<IncidenciaNominaReportView> createState() => _IncidenciaNominaReportViewState();
}

class _IncidenciaNominaReportViewState extends State<IncidenciaNominaReportView> {
  // Mismo patron de busqueda por nombre que ya usa la vista de Asistencia
  // (ver reporte_asistencia_screen.dart) -- filtra antes de separar en
  // Empleados/Practicantes para que aplique a ambas tablas a la vez.
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _searchDebouncer = Debouncer(milliseconds: 300);
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    widget.viewmodel.corregir.addListener(_onCorregirResult);
    widget.viewmodel.generarPdf.addListener(_onGenerarPdfResult);
  }

  @override
  void didUpdateWidget(covariant IncidenciaNominaReportView oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewmodel.corregir.removeListener(_onCorregirResult);
    widget.viewmodel.corregir.addListener(_onCorregirResult);
    oldWidget.viewmodel.generarPdf.removeListener(_onGenerarPdfResult);
    widget.viewmodel.generarPdf.addListener(_onGenerarPdfResult);
  }

  @override
  void dispose() {
    widget.viewmodel.corregir.removeListener(_onCorregirResult);
    widget.viewmodel.generarPdf.removeListener(_onGenerarPdfResult);
    _searchController.dispose();
    _searchDebouncer.dispose();
    super.dispose();
  }

  void _onCorregirResult() {
    if (widget.viewmodel.corregir.completed) {
      widget.viewmodel.corregir.clearResult();
    } else if (widget.viewmodel.corregir.error) {
      final error = (widget.viewmodel.corregir.result as Error).error;
      widget.viewmodel.corregir.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo guardar la corrección', error: error),
        );
      }
    }
  }

  void _onGenerarPdfResult() {
    // El exito (guardar la URL en viewmodel.pdfUrl) ya lo maneja el
    // viewmodel internamente -- aqui solo se limpia el resultado del
    // Command y se avisa si hubo error, independientemente de si esta
    // vista sigue montada cuando la respuesta llega (ej. el usuario cambio
    // de tab mientras se generaba).
    if (widget.viewmodel.generarPdf.completed) {
      widget.viewmodel.generarPdf.clearResult();
    } else if (widget.viewmodel.generarPdf.error) {
      final error = (widget.viewmodel.generarPdf.result as Error).error;
      widget.viewmodel.generarPdf.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo generar el PDF', error: error),
        );
      }
    }
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

  /// Evita abrir un nuevo diálogo de edición mientras otra corrección
  /// todavía se está guardando -- si no, el Command1 de corregir descarta
  /// en silencio la segunda ejecución (mismo candado de reentrancia que
  /// evita doble-tap), y el usuario cree que sí se guardó.
  bool _puedeCorregir() {
    if (widget.viewmodel.corregir.running) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Espera a que termine de guardar la corrección anterior')),
      );
      return false;
    }
    return true;
  }

  Future<void> _editCodigo(int usuarioId, DateTime fecha, AsistenciaStatus statusActual, int minutosActual) async {
    if (!_puedeCorregir()) return;
    final resultado = await showDialog<EditCodigoResult>(
      context: context,
      builder: (context) => EditCodigoDialog(status: statusActual, minutosActual: minutosActual),
    );
    if (resultado == null || !mounted) return;

    await widget.viewmodel.corregir.execute((
      usuarioId: usuarioId,
      fecha: fecha,
      campo: _campoStatus,
      valor: resultado.status.jsonValue,
    ));

    // Solo Retardo pide minutos (ver EditCodigoDialog) -- se manda como una
    // segunda correccion separada porque el PATCH de corregir solo acepta
    // un campo a la vez, mismo mecanismo que ya usa el lapiz de "Min.
    // Retardo" de la columna agregada.
    final minutos = resultado.minutosRetardo;
    if (minutos != null && mounted) {
      await widget.viewmodel.corregir.execute((
        usuarioId: usuarioId,
        fecha: fecha,
        campo: _campoMinutosRetardo,
        valor: minutos.toString(),
      ));
    }
  }

  Future<void> _editMinutosRetardo(int usuarioId, DateTime fecha, int actual) async {
    if (!_puedeCorregir()) return;
    final nuevo = await showDialog<String>(
      context: context,
      builder: (context) => EditNumeroDialog(titulo: 'Minutos de retardo', valorInicial: actual),
    );
    if (nuevo == null || !mounted) return;

    widget.viewmodel.corregir.execute((
      usuarioId: usuarioId,
      fecha: fecha,
      campo: _campoMinutosRetardo,
      valor: nuevo,
    ));
  }

  Future<void> _editHorasExtra(int usuarioId, DateTime fecha, double actual) async {
    if (!_puedeCorregir()) return;
    final nuevo = await showDialog<String>(
      context: context,
      builder: (context) => EditNumeroDialog(titulo: 'Horas extra', valorInicial: actual, decimales: true),
    );
    if (nuevo == null || !mounted) return;

    widget.viewmodel.corregir.execute((
      usuarioId: usuarioId,
      fecha: fecha,
      campo: _campoHorasExtra,
      valor: nuevo,
    ));
  }

  Future<void> _abrirPdf() async {
    final url = widget.viewmodel.pdfUrl;
    if (url == null) return;
    // Se obtiene antes del await para no depender de context tras el
    // async gap (el State pudo haberse desmontado mientras se espera).
    final logger = context.read<AppLogger>();
    try {
      await launchUrl(Uri.parse(url));
    } catch (e, stackTrace) {
      logger.error('Failed to launch nomina PDF URL', error: e, stackTrace: stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 32,
      children: [
        ListenableBuilder(
          listenable: widget.viewmodel,
          builder: (context, _) {
            return Row(
              spacing: 16,
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: headingTextColor,
                    iconColor: primaryColor,
                  ),
                  onPressed: () async {
                    final today = DateTime.now();
                    // Los viernes, el reporte semanal ya se genera (y se
                    // envia automaticamente) con la semana completa,
                    // incluyendo sabado y domingo aunque todavia no hayan
                    // pasado -- se dejan seleccionar/editar esos dos dias
                    // desde ese mismo viernes en vez de esperar a que
                    // realmente lleguen.
                    final lastDate = today.weekday == DateTime.friday
                      ? today.add(const Duration(days: 2))
                      : today;
                    final selection = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2026, 01, 01),
                      lastDate: lastDate,
                    );
                    if (selection == null) {
                      return;
                    }
                    widget.viewmodel.searchRange = selection;
                    widget.viewmodel.load.execute();
                  },
                  icon: Icon(LucideIcons.calendar),
                  label: Text(_formatSearchRange()),
                ),
                if (widget.viewmodel.isFullWeekSelected)
                  ListenableBuilder(
                    listenable: widget.viewmodel.generarPdf,
                    builder: (context, _) {
                      if (widget.viewmodel.generarPdf.running) {
                        return const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      }

                      return ElevatedButton.icon(
                        onPressed: () => widget.viewmodel.generarPdf.execute(),
                        icon: Icon(LucideIcons.fileText),
                        label: Text('Generar PDF'),
                      );
                    },
                  ),
                if (widget.viewmodel.pdfUrl != null)
                  OutlinedButton.icon(
                    onPressed: _abrirPdf,
                    icon: Icon(LucideIcons.download),
                    label: Text('Descargar PDF'),
                  ),
              ],
            );
          },
        ),
        ListenableBuilder(
          // Se escucha tambien al viewmodel (no solo a load): una
          // correccion exitosa actualiza _reporte y notifica directo desde
          // el viewmodel sin pasar por el Command de load (ver
          // ReporteIncidenciaNominaViewmodel._corregir), asi que este
          // builder necesita reaccionar a ambos para que la tabla refleje
          // la correccion de inmediato.
          listenable: Listenable.merge([widget.viewmodel, widget.viewmodel.load]),
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

            // Mismo algoritmo de busqueda por palabras que ya usa la vista
            // de Asistencia -> Empleados (reporte_asistencia_screen.dart):
            // cada palabra escrita debe ser el inicio de alguna palabra del
            // nombre, sin importar el orden.
            final query = _searchQuery.trim().toLowerCase();
            final queryWords = query.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
            final filteredItems = queryWords.isEmpty
              ? reporte.items
              : reporte.items.where((item) {
                  final nameWords = item.fullName.toLowerCase().split(RegExp(r'\s+'));
                  return queryWords.every((qw) => nameWords.any((nw) => nw.startsWith(qw)));
                }).toList();

            // Misma separacion que ya usa el PDF semanal (ver
            // generate_incidencia_nominas_pdf en reports.py: empleados vs
            // practicantes, mismos titulos "EMPLEADOS"/
            // "PRACTICANTES/RESIDENTES").
            final empleados = filteredItems.where((item) => !item.isPracticante).toList();
            final practicantes = filteredItems.where((item) => item.isPracticante).toList();

            return Column(
              crossAxisAlignment: .start,
              spacing: 24,
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar empleado por nombre',
                    prefixIcon: Icon(LucideIcons.search),
                    prefixIconColor: const Color(0xFFC4A47A),
                  ),
                  onChanged: (value) => _searchDebouncer.run(
                    () => setState(() => _searchQuery = value),
                  ),
                ),
                if (filteredItems.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Text('No se encontraron empleados que coincidan con "$query"'),
                    ),
                  )
                else ...[
                  Text('EMPLEADOS', style: TextTheme.of(context).titleMedium),
                  // IncidenciaNominaTable ya maneja su propio deslizamiento
                  // horizontal con la columna EMPLEADO congelada, ver
                  // FrozenColumnTableWrapper -- envolverla aqui en
                  // TableWrapper volveria a deslizar TODA la tabla.
                  IncidenciaNominaTable(
                    dates: reporte.dates,
                    items: empleados,
                    onEditCodigo: _editCodigo,
                    onEditMinutosRetardo: _editMinutosRetardo,
                    onEditHorasExtra: _editHorasExtra,
                  ),
                  Text('PRACTICANTES/RESIDENTES', style: TextTheme.of(context).titleMedium),
                  IncidenciaNominaTable(
                    dates: reporte.dates,
                    items: practicantes,
                    onEditCodigo: _editCodigo,
                    onEditMinutosRetardo: _editMinutosRetardo,
                    onEditHorasExtra: _editHorasExtra,
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}
