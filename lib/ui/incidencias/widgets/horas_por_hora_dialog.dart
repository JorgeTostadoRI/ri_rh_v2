import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/domain/models/incidencias/hora_por_hora_resumen.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';

/// Al enviar un Permiso de día completo por tiempo por tiempo (ya
/// identificado el usuario), elige cuáles de sus Hora por hora lo pagan.
/// Regresa los ids elegidos, o null si cancela.
class HorasPorHoraDialog extends StatefulWidget {
  const HorasPorHoraDialog({
    super.key,
    required this.horasPorHora,
  });

  final List<HoraPorHoraResumen> horasPorHora;

  @override
  State<HorasPorHoraDialog> createState() => _HorasPorHoraDialogState();
}

class _HorasPorHoraDialogState extends State<HorasPorHoraDialog> {
  final Set<int> _seleccionadas = {};

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final minutos = widget.horasPorHora
      .where((h) => _seleccionadas.contains(h.id))
      .fold(0, (total, h) => total + h.end.difference(h.start).inMinutes);

    return AlertDialog(
      title: Text('¿Con qué Hora por hora pagarás este permiso?'),
      content: SizedBox(
        width: 480,
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (final horaPorHora in widget.horasPorHora)
                    CheckboxListTile(
                      value: _seleccionadas.contains(horaPorHora.id),
                      onChanged: (value) => setState(() {
                        value == true ? _seleccionadas.add(horaPorHora.id) : _seleccionadas.remove(horaPorHora.id);
                      }),
                      title: Text(formatRangoHoras(horaPorHora.start, horaPorHora.end)),
                      subtitle: Text(
                        '${formatMinutos(horaPorHora.end.difference(horaPorHora.start).inMinutes)} · ${estadoLabel(horaPorHora.state)}',
                        style: textTheme.bodySmall,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text('Total elegido: ${formatMinutos(minutos)}', style: textTheme.bodyMedium),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => context.pop(),
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _seleccionadas.isEmpty ? null : () => context.pop(_seleccionadas.toList()),
          child: Text('Continuar'),
        ),
      ],
    );
  }
}

/// Ej. "5 de noviembre de 2026, 06:00 – 08:00".
String formatRangoHoras(DateTime start, DateTime end) {
  final localStart = start.toLocal();
  final localEnd = end.toLocal();
  return '${DateFormat.yMMMMd().format(localStart)}, ${DateFormat.Hm().format(localStart)} – ${DateFormat.Hm().format(localEnd)}';
}

/// Ej. 90 -> "1 h 30 min".
String formatMinutos(int minutos) {
  final horas = minutos ~/ 60;
  final resto = minutos % 60;
  if (horas > 0 && resto > 0) return '$horas h $resto min';
  return horas > 0 ? '$horas h' : '$resto min';
}

String estadoLabel(IncidenciaState state) => switch (state) {
  IncidenciaState.approved => 'Aprobada',
  IncidenciaState.pending => 'Pendiente',
  IncidenciaState.rejected => 'Rechazada',
};
