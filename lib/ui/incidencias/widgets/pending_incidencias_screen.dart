import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/color_icon.dart';
import 'package:ri_rh_v2/ui/core/ui/field_switcher.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/pending_incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_approve_dialog.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

class PendingIncidenciasScreen extends StatefulWidget {
  const PendingIncidenciasScreen({
    super.key,
    required this.viewmodel,
  });

  final PendingIncidenciasViewmodel viewmodel;

  @override
  State<PendingIncidenciasScreen> createState() => _PendingIncidenciasScreenState();
}

class _PendingIncidenciasScreenState extends State<PendingIncidenciasScreen> {
  final yMd = DateFormat.yMd();
  int viewSelectIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.viewmodel.approve.addListener(_onApproved);
    widget.viewmodel.reject.addListener(_onRejected);
  }

  @override
  void didUpdateWidget(covariant PendingIncidenciasScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewmodel.approve.removeListener(_onApproved);
    widget.viewmodel.approve.addListener(_onApproved);
    widget.viewmodel.reject.removeListener(_onRejected);
    widget.viewmodel.reject.addListener(_onRejected);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          spacing: 32,
          crossAxisAlignment: .start,
          children: [
            PageHeader(
              title: 'Solicitudes de Incidencias',
              subtitle: 'Revisa tus solicitudes pendientes de revisión.',
              showBackButton: true,
            ),
            FieldSwitcher(
              selectedIndex: viewSelectIndex,
              onSelected: (value) => setState(() => viewSelectIndex = value),
              options: [
                'Pendientes',
                'Historial',
              ],
            ),
            ListenableBuilder(
              listenable: Listenable.merge([
                widget.viewmodel.load,
                widget.viewmodel.approve,
                widget.viewmodel.reject,
              ]),
              builder: (context, _) {
                if (widget.viewmodel.load.running) {
                  return Center(child: CircularProgressIndicator());
                }

                if (widget.viewmodel.load.error) {
                  return Center(
                    child: Column(
                      children: [
                        Text('No se pudieron cargar las incidencias.'),
                        Text(
                          widget.viewmodel.load.result.toString(),
                          style: TextStyle(color: errorColor),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => widget.viewmodel.load.execute(),
                          icon: Icon(LucideIcons.rotateCcw),
                          label: Text('Reintentar'),
                        ),
                      ],
                    ),
                  );
                }

                if (viewSelectIndex == 0) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.viewmodel.pendingToReview!.length,
                    itemBuilder: (context, index) {
                      final incidencia = widget.viewmodel.pendingToReview![index];
                      return _IncidenciaListTile(incidencia: incidencia, onResult: _handleDialogStateResult);
                    },
                    separatorBuilder: (context, _) => SizedBox(height: 12),
                  );
                }
                if (viewSelectIndex == 1) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.viewmodel.historial!.length,
                    itemBuilder: (context, index) {
                      final incidencia = widget.viewmodel.historial![index];
                      return _IncidenciaListTile(incidencia: incidencia, onResult: _handleDialogStateResult);
                    },
                    separatorBuilder: (context, _) => SizedBox(height: 12),
                  );
                }

                return SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }

  void _handleDialogStateResult(Incidencia incidencia, IncidenciaApproveDialogResult result) {
    switch (result.state) {
      case IncidenciaState.approved:
        widget.viewmodel.approve.execute(incidencia);
      case IncidenciaState.rejected:
        widget.viewmodel.reject.execute((incidencia: incidencia, rejectionReason: result.rejectionReason));
      default:
        throw ArgumentError('Invalid state option');
    }
  }

  void _onApproved() {
    if (widget.viewmodel.approve.completed) {
      widget.viewmodel.approve.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se aprobó la incidencia')),
      );
    }
    else if (widget.viewmodel.approve.error) {
      widget.viewmodel.approve.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo aprobar la incidencia')),
      );
    }
  }

  void _onRejected() {
    if (widget.viewmodel.reject.completed) {
      widget.viewmodel.reject.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se rechazó la incidencia')),
      );
    }
    else if (widget.viewmodel.reject.error) {
      widget.viewmodel.reject.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo rechazar la incidencia')),
      );
    }
  }
}

class _IncidenciaListTile extends StatelessWidget {
  const _IncidenciaListTile({
    required this.incidencia,
    required this.onResult,
  });

  final Incidencia incidencia;
  final Function(Incidencia, IncidenciaApproveDialogResult) onResult;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      leading: switch(incidencia.state!) {
        IncidenciaState.pending => ColorIcon(
          icon: LucideIcons.clock,
          backgroundColor: statusWarningBgColor,
        ),
        IncidenciaState.rejected => ColorIcon(
          icon: LucideIcons.x,
          backgroundColor: statusFailureBgColor,
          iconColor: statusFailureColor,
        ),
        IncidenciaState.approved => ColorIcon(
          icon: LucideIcons.circleCheckBig,
          backgroundColor: statusSuccessBgColor,
          iconColor: statusSuccessColor,
        ),
      },
      title: Text(
        '${incidencia.categoryName} para ${incidencia.solicitor!.nombre} en ${_formatStartEndDates(incidencia)}',
        style: textTheme.headlineSmall,
      ),
      subtitle: Text(
        incidencia.reason,
        style: textTheme.labelLarge?.copyWith(
          fontSize: 16,
        ),
        overflow: .ellipsis,
      ),
      onTap: () async {
        final IncidenciaApproveDialogResult? result = await showDialog<IncidenciaApproveDialogResult>(
          context: context,
          builder: (context) {
            return IncidenciaApproveDialog(
              incidencia: incidencia,
            );
          }
        );

        if (result == null) return;

        onResult(incidencia, result);
      }
    );
  }

  String _formatStartEndDates(Incidencia incidencia) {
    final yMd = DateFormat.yMd();

    if (incidencia.start.isSameDay(incidencia.end)) {
      return yMd.format(incidencia.start.toLocal());
    } else {
      final localStart = incidencia.start.toLocal();
      final localEnd = incidencia.end.toLocal();
      return '${yMd.format(localStart)} hasta ${yMd.format(localEnd)}';
    }
  }
}