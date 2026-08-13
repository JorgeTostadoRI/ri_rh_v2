import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/ui/status_chip.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

class IncidenciaOverviewDialog extends StatefulWidget {
  const IncidenciaOverviewDialog({
    super.key,
    required this.incidencia,
    required this.onDownload,
  });

  final Incidencia incidencia;
  final void Function() onDownload;

  @override
  State<IncidenciaOverviewDialog> createState() => _IncidenciaOverviewDialogState();
}

class _IncidenciaOverviewDialogState extends State<IncidenciaOverviewDialog> {
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
    final yMMMMdjm = DateFormat.yMMMMd().add_jm();

    return AlertDialog(
      title: Text(
        '${widget.incidencia.categoryName} para ${widget.incidencia.solicitor!.nombre} en ${_formatTitleDates()}',
      ),
      content: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Fecha de creación', style: textTheme.headlineSmall),
              _IncidenciaStatusChip(state: widget.incidencia.state!),
            ],
          ),
          Text(yMMMMdjm.format(_localStart)),
          const SizedBox(height: 24),
          Text('Solicitor', style: textTheme.headlineSmall),
          Text(widget.incidencia.solicitor!.nombre),
          const SizedBox(height: 24),
          if (widget.incidencia.revisor != null)
          ...[
              Text('Revisor asignado', style: textTheme.headlineSmall),
              Text(widget.incidencia.solicitor!.nombre),
              const SizedBox(height: 24),
          ],
          Text('Fechas solicitadas', style: textTheme.headlineSmall),
          Text(_formatRequestedDates()),
          const SizedBox(height: 24),
          Text('Motivo', style: textTheme.headlineSmall),
          Text(widget.incidencia.reason, style: textTheme.bodyMedium),
          if (widget.incidencia.rejectionReason != null)
            ...[
              Text('Motivo de rechazo', style: textTheme.headlineSmall),
              Text(widget.incidencia.rejectionReason!, style: textTheme.bodyMedium),
            ]
        ],
      ),
      actions: [
        if (widget.incidencia.state == IncidenciaState.approved)
          ElevatedButton.icon(
            onPressed: () {
              widget.onDownload();
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