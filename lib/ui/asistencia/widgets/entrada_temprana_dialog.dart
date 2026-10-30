import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';

/// Aviso cuando el checador rechaza la entrada por intentar registrarla más
/// de 20 minutos antes de la hora de entrada (o del inicio del Retardo/Permiso
/// por horas aprobado). Error `early_entry` del backend.
class EntradaTempranaDialog extends StatelessWidget {
  const EntradaTempranaDialog({
    super.key,
    required this.error,
  });

  final ApiException error;

  @override
  Widget build(BuildContext context) {
    final horaPermitida = DateTime.tryParse(error.data?['hora_permitida']?.toString() ?? '');

    // El backend manda la hora con su offset (ej. "-07:00"); sin toLocal()
    // DateFormat imprime la hora en UTC.
    final content = horaPermitida != null
      ? 'Aún no puedes registrar tu entrada. '
        'Podrás hacerlo a partir de las ${DateFormat.jm().format(horaPermitida.toLocal())}.'
      : 'Aún no puedes registrar tu entrada. '
        'Solo puedes registrarla a partir de 20 minutos antes de tu hora de entrada.';

    return AlertDialog(
      title: Text('Demasiado temprano'),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: () => context.pop(),
          child: Text('Entendido'),
        ),
      ],
    );
  }
}
