import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/ui/rejection_dialog.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

typedef IncidenciaApproveDialogResult = ({IncidenciaState state, String rejectionReason});

class IncidenciaApproveDialog extends StatelessWidget {
  const IncidenciaApproveDialog({
    super.key,
    required this.incidencia,
  });

  final Incidencia incidencia;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final yMMMMdjm = DateFormat.yMMMMd().add_jm();

    return AlertDialog(
      title: Text(
        '${incidencia.categoryName} para ${incidencia.solicitor!.nombre} en ${_formatStartEndDates(incidencia)}',
      ),
      content: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Fecha de creación', style: textTheme.headlineSmall),
            Text(yMMMMdjm.format(incidencia.createdAt!.toLocal())),
          const SizedBox(height: 24),
          Text('Fecha solicitadas', style: textTheme.headlineSmall),
          if (incidencia.start.isSameDay(incidencia.end))
            Text(yMMMMdjm.format(incidencia.start.toLocal())),
          if (!incidencia.start.isSameDay(incidencia.end))
            Text('${yMMMMdjm.format(incidencia.start.toLocal())} - ${yMMMMdjm.format(incidencia.end.toLocal())}'),
          const SizedBox(height: 24),
          Text('Motivo', style: textTheme.headlineSmall),
          Text(incidencia.reason, style: textTheme.bodyMedium),
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
