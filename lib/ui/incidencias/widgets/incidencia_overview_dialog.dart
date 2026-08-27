import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/ui/status_chip.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class IncidenciaOverviewDialog extends StatefulWidget {
  const IncidenciaOverviewDialog({
    super.key,
    required this.incidencia,
    required this.onDownload,
  });

  final Incidencia incidencia;
  final void Function(bool) onDownload;

  @override
  State<IncidenciaOverviewDialog> createState() => _IncidenciaOverviewDialogState();
}

class _IncidenciaOverviewDialogState extends State<IncidenciaOverviewDialog> {
  final _yMMMMd = DateFormat.yMMMMd();
  final _yMMMMdjm = DateFormat.yMMMMd().add_jm();
  final _yMd = DateFormat.yMd();

  late final DateTime _localStart;
  late final DateTime _localEnd;

  bool _forceGeneratePDF = false;

  @override
  void initState() {
    super.initState();
    _localStart = widget.incidencia.start.toLocal();
    _localEnd = widget.incidencia.end.toLocal();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final yMMMMdjm = DateFormat.yMMMMd().add_jm();
    final incidencia = widget.incidencia;

    return AlertDialog(
      scrollable: true,
      title: Text(
        '${incidencia.categoryName} para ${incidencia.solicitor!.nombre} en ${_formatTitleDates()}',
      ),
      content: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Fecha de creación', style: textTheme.headlineSmall),
              _IncidenciaStatusChip(state: incidencia.state!),
            ],
          ),
          Text(yMMMMdjm.format(widget.incidencia.createdAt!.toLocal())),
          const SizedBox(height: 24),
          Text('Solicitor', style: textTheme.headlineSmall),
          Text(incidencia.solicitor!.nombre),
          const SizedBox(height: 24),
          Text('Fechas solicitadas', style: textTheme.headlineSmall),
          Text(_formatRequestedDates()),
          const SizedBox(height: 24),
          Text('Motivo', style: textTheme.headlineSmall),
          Text(incidencia.reason, style: textTheme.bodyMedium),
          if (incidencia.rejectionReason != null && incidencia.rejectionReason!.isNotEmpty)
            ...[
                const SizedBox(height: 24),
                Text('Motivo de rechazo', style: textTheme.headlineSmall),
                Text(incidencia.rejectionReason!, style: textTheme.bodyMedium),
            ],
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Tooltip(
              message: 'Se forzará a generar nuevamente el archivo',
              child: Row(
                mainAxisSize: .min,
                children: [
                  Checkbox(
                    value: _forceGeneratePDF,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _forceGeneratePDF = value);
                      }
                    },
                  ),
                  Text('¿Generar nuevamente PDF?'),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        if (incidencia.state == IncidenciaState.approved)
          ElevatedButton.icon(
            onPressed: () {
              widget.onDownload(_forceGeneratePDF);
              context.pop(); // pop to avoid holding a stale reference if the incidencia was updated
            },
            icon: Icon(LucideIcons.download),
            label: Text('Descargar'),
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

class _IncidenciaStatusChip extends StatelessWidget {
  const _IncidenciaStatusChip({
    required this.state,
  });

  final IncidenciaState state;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      IncidenciaState.pending => StatusChip(type: StatusChipType.warning, label: 'PENDIENTE'),
      IncidenciaState.rejected => StatusChip(type: StatusChipType.failure, label: 'RECHAZADO'),
      IncidenciaState.approved => StatusChip(type: StatusChipType.success, label: 'APROBADO'),
    };
  }
}