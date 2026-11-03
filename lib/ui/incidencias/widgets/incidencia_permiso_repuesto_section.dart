import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/permiso_reposicion.dart';

/// Hora por hora: el Permiso de día completo que paga (tiempo por tiempo),
/// una vez que el empleado lo liga al pedir ese permiso.
class IncidenciaPermisoRepuestoSection extends StatelessWidget {
  const IncidenciaPermisoRepuestoSection({
    super.key,
    required this.permiso,
  });

  final PermisoReposicion permiso;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final start = permiso.start.toLocal();
    final end = permiso.end.toLocal();
    final fechas = start.year == end.year && start.month == end.month && start.day == end.day
      ? DateFormat.yMMMMd().format(start)
      : '${DateFormat.yMMMMd().format(start)} al ${DateFormat.yMMMMd().format(end)}';

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Permiso que paga', style: textTheme.headlineSmall),
          Text(fechas, style: textTheme.bodyMedium),
          Text(
            switch (permiso.state) {
              IncidenciaState.approved => 'Aprobado',
              IncidenciaState.pending => 'Pendiente de aprobar',
              IncidenciaState.rejected => 'Rechazado',
            },
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
