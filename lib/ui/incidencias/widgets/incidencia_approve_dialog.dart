import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

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
      title: Text('Revisión de ${incidencia.categoryName} #${incidencia.id}'),
      content: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Fecha de solicitud', style: textTheme.headlineSmall),
            Text(yMMMMdjm.format(incidencia.createdAt!.toLocal())),
          const SizedBox(height: 24),
          Text('Fecha de permiso', style: textTheme.headlineSmall),
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
          onPressed: () => context.pop(IncidenciaState.rejected),
          icon: Icon(LucideIcons.x),
          label: Text('Rechazar'),
        ),
        ElevatedButton.icon(
          onPressed: () => context.pop(IncidenciaState.approved),
          icon: Icon(LucideIcons.circleCheckBig),
          label: Text('Aprobar'),
        ),
      ],
    );
  }
}