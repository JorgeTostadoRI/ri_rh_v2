import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/ui/rejection_dialog.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

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

    return AlertDialog(
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
