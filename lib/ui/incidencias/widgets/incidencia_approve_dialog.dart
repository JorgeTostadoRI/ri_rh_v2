import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/ui/rejection_dialog.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

typedef IncidenciaApproveDialogResult = ({IncidenciaState state, String rejectionReason});

class IncidenciaApproveDialog extends StatefulWidget {
  const IncidenciaApproveDialog({
    super.key,
    required this.incidencia,
  });

  final Incidencia incidencia;

  @override
  State<IncidenciaApproveDialog> createState() => _IncidenciaApproveDialogState();
}

class _IncidenciaApproveDialogState extends State<IncidenciaApproveDialog> {
  final _yMMMMd = DateFormat.yMMMMd();
  final _yMMMMdjm = DateFormat.yMMMMd().add_jm();
  final _yMd = DateFormat.yMd();

  late final DateTime _localStart;
  late final DateTime _localEnd;

  @override
  void initState() {
    super.initState();
    _localStart = widget.incidencia.start.toLocal();
    _localEnd = widget.incidencia.end.toLocal();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final incidencia = widget.incidencia;

    return AlertDialog(
      scrollable: true,
      title: Text(
        '${widget.incidencia.categoryName} para ${widget.incidencia.solicitor!.nombre} en ${_formatTitleDates()}',
      ),
      content: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Fecha de creación', style: textTheme.headlineSmall),
          Text(_yMMMMdjm.format(_localStart)),
          const SizedBox(height: 24),
          Text('Solicitor', style: textTheme.headlineSmall),
          Text(widget.incidencia.solicitor!.nombre),
          const SizedBox(height: 24),
          Text('Revisor asignado', style: textTheme.headlineSmall),
          Text(
            widget.incidencia.revisor != null
              ? widget.incidencia.revisor!.nombre
              : 'Recursos Humanos'
            ),
          const SizedBox(height: 24),
          Text('Fechas solicitadas', style: textTheme.headlineSmall),
          Text(_formatRequestedDates()),
          const SizedBox(height: 24),
          Text('Motivo', style: textTheme.headlineSmall),
          Text(widget.incidencia.reason, style: textTheme.bodyMedium),
          if (incidencia.files.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Text('Archivos adjuntos', style: textTheme.headlineSmall),
                  ...List<Widget>.generate(
                    incidencia.files.length,
                    (index) {
                      final file = incidencia.files[index];
                      late final String filename;
                      try {
                        filename = file.filepath.split('/').last;
                      } catch (e) {
                        filename = 'Sin nombre';
                      }
                      return ListTile(
                        title: Text(filename),
                        trailing: IconButton(
                          onPressed: () {
                            try {
                              final url = Uri.parse(file.filepath);
                              launchUrl(url);
                            } catch (e, stackTrace) {
                              context.read<AppLogger>().error('Failed to launch URL', error: e, stackTrace: stackTrace);    
                            }
                          },
                          icon: Icon(LucideIcons.externalLink),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () async {
            final rejectionReason = await showDialog<String?>(
              context: context,
              builder: (context) => RejectionDialog(),
            );
            if (rejectionReason != null && rejectionReason.isNotEmpty) {
              final IncidenciaApproveDialogResult result = (state: IncidenciaState.rejected, rejectionReason: rejectionReason);
              context.pop(result);
            }
          },
          icon: Icon(LucideIcons.x),
          label: Text('Rechazar'),
        ),
        ElevatedButton.icon(
          onPressed: () => context.pop((state: IncidenciaState.approved, rejectionReason: '')),
          icon: Icon(LucideIcons.circleCheckBig),
          label: Text('Aprobar'),
        ),
      ],
    );
  }

  String _formatTitleDates() {
    if (_localStart.isSameDay(_localEnd)) {
      return _yMd.format(widget.incidencia.start.toLocal());
    } else {
      return '${_yMd.format(_localStart)} hasta ${_yMd.format(_localEnd)}';
    }
  }

  String _formatRequestedDates() {
    if (_localStart == _localEnd) {
      return _yMMMMd.format(_localStart);
    }
    return '${_yMMMMdjm.format(_localStart)} hasta ${_yMMMMdjm.format(_localEnd)}';
  }
}
