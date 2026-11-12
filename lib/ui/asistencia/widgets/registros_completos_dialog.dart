import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';

/// Ventana mostrada cuando la persona ya hizo todas sus checadas del día
/// (`registros_completos`). Se usa en el kiosko (`AsistenciaScreen`) y en el
/// registro manual (`IngresoManualScreen`).
///
/// Se cierra sola a los [duracion] para no dejar el kiosko bloqueado si
/// nadie toca "Entendido", o en cuanto [cerrarCon] emite (en el kiosko: la
/// siguiente persona puso el dedo).
class RegistrosCompletosDialog extends StatefulWidget {
  const RegistrosCompletosDialog({
    super.key,
    required this.error,
    this.duracion = const Duration(seconds: 15),
    this.cerrarCon,
  });

  final ApiException error;
  final Duration duracion;
  final Stream<void>? cerrarCon;

  @override
  State<RegistrosCompletosDialog> createState() => _RegistrosCompletosDialogState();
}

class _RegistrosCompletosDialogState extends State<RegistrosCompletosDialog> {
  Timer? _timer;
  StreamSubscription<void>? _cerrarSub;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duracion, _cerrar);
    _cerrarSub = widget.cerrarCon?.listen((_) => _cerrar());
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cerrarSub?.cancel();
    super.dispose();
  }

  void _cerrar() {
    if (!mounted) return;
    // Se quita esta ventana en específico (no la de arriba): si mientras
    // tanto se abrió otra ventana encima (ej. la checada de la siguiente
    // persona), un pop() cerraría esa en su lugar.
    final route = ModalRoute.of(context);
    if (route != null && route.isActive) {
      Navigator.of(context).removeRoute(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final nombre = (widget.error.data?['nombre'] as String?)?.trim() ?? '';
    final mensaje = nombre.isEmpty
        ? 'Ya completaste tus registros de asistencia del día.'
        : '$nombre, ya completaste tus registros de asistencia del día.';

    return AlertDialog(
      title: const Text('Registros completos'),
      content: Text(mensaje),
      actions: [
        ElevatedButton(
          onPressed: _cerrar,
          child: const Text('Entendido'),
        ),
      ],
    );
  }
}
