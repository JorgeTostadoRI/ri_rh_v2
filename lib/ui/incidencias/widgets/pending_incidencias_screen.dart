import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
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
    final textTheme = TextTheme.of(context);

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

                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.viewmodel.pendingToReview!.length,
                  itemBuilder: (context, index) {
                    final incidencia = widget.viewmodel.pendingToReview![index];
                    return ListTile(
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text(
                        '${incidencia.categoryName} para ${_formatStartEndDates(incidencia)}',
                        style: textTheme.headlineSmall,
                      ),
                      subtitle: Text(
                        incidencia.reason,
                        style: textTheme.labelLarge,
                        overflow: .ellipsis,
                      ),
                      onTap: () async {
                        final IncidenciaState? state = await showDialog(
                          context: context,
                          builder: (context) {
                            return IncidenciaApproveDialog(
                              incidencia: incidencia,
                            );
                          }
                        );

                        if (state == null) return;

                        _handleDialogStateResult(incidencia, state);
                      }
                    );
                  },
                  separatorBuilder: (context, _) => SizedBox(height: 12),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  String _formatStartEndDates(Incidencia incidencia) {
    if (incidencia.start.isSameDay(incidencia.end)) {
      return yMd.format(incidencia.start.toLocal());
    } else {
      final localStart = incidencia.start.toLocal();
      final localEnd = incidencia.end.toLocal();
      return '${yMd.format(localStart)} hasta ${yMd.format(localEnd)}';
    }
  }

  void _handleDialogStateResult(Incidencia incidencia, IncidenciaState state) {
    switch (state) {
      case IncidenciaState.approved:
        widget.viewmodel.approve.execute(incidencia);
      case IncidenciaState.rejected:
        widget.viewmodel.reject.execute(incidencia);
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