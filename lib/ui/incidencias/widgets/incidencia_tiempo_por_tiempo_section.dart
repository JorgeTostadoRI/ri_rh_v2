import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/hora_por_hora_resumen.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/horas_por_hora_dialog.dart';

/// Permiso por tiempo por tiempo: las Hora por hora que lo pagan, con su
/// estado y si el checador las respalda. Con [mostrarAlerta] (turno del
/// aprobador de con goce y de RH) avisa si alguna no está aprobada o no
/// tiene checada -- no bloquea.
class IncidenciaTiempoPorTiempoSection extends StatelessWidget {
  const IncidenciaTiempoPorTiempoSection({
    super.key,
    required this.horasPorHora,
    this.mostrarAlerta = false,
  });

  final List<HoraPorHoraResumen> horasPorHora;
  final bool mostrarAlerta;

  bool _respaldada(HoraPorHoraResumen h) => h.checador != null && !h.checador!.isSuspicious;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final minutos = horasPorHora.fold(0, (total, h) => total + h.end.difference(h.start).inMinutes);
    final pendientes = horasPorHora.any((h) => h.state != IncidenciaState.approved || !_respaldada(h));

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Tiempo por tiempo', style: textTheme.headlineSmall),
          Text('Se paga con ${formatMinutos(minutos)} de Hora por hora:', style: textTheme.bodyMedium),
          const SizedBox(height: 4),
          for (final horaPorHora in horasPorHora)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: .start,
                spacing: 8,
                children: [
                  Icon(
                    _respaldada(horaPorHora) ? LucideIcons.circleCheck : LucideIcons.circleAlert,
                    size: 16,
                    color: _respaldada(horaPorHora) ? statusSuccessColor : statusWarningColor,
                  ),
                  Expanded(
                    child: Text(
                      '${formatRangoHoras(horaPorHora.start, horaPorHora.end)} · ${estadoLabel(horaPorHora.state)}'
                      '${_respaldada(horaPorHora) ? '' : ' · ${horaPorHora.checador?.message ?? 'Sin validar contra el checador'}'}',
                      style: textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          if (mostrarAlerta && pendientes)
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: statusWarningBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: .start,
                children: [
                  Icon(LucideIcons.triangleAlert, color: statusWarningColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Alguna Hora por hora todavía no está aprobada o no tiene checada que la respalde. '
                      'Revísalas antes de aprobar el permiso con goce; puedes aprobarlo de todos modos.',
                      style: textTheme.bodyMedium?.copyWith(color: statusWarningColor),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
