import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

/// Alerta mostrada tras un check-in exitoso cuando el usuario tiene una
/// falta sin reportar del último día laboral anterior. Se usa tanto en el
/// kiosko compartido (`AsistenciaScreen`) como en el registro manual
/// (`IngresoManualScreen`).
///
/// En el kiosko compartido no debe depender de que alguien la cierre para no
/// entorpecer la fila, pero tampoco debe poder cerrarse instantáneamente por
/// error -- el botón de cierre se habilita recién después de 2 segundos.
class FaltaNoReportadaDialog extends StatefulWidget {
  const FaltaNoReportadaDialog({
    super.key,
    required this.nombre,
    required this.fecha,
    this.horaAviso,
    this.horaLimite,
  });

  final String nombre;
  final DateTime fecha;
  // Hora sugerida para reportar y hora limite, personalizadas segun la hora
  // de entrada del usuario -- si el backend no pudo determinarlas (caso
  // raro, sin horario configurado ese dia), se usa un mensaje genérico sin
  // horas especificas.
  final DateTime? horaAviso;
  final DateTime? horaLimite;

  @override
  State<FaltaNoReportadaDialog> createState() => _FaltaNoReportadaDialogState();
}

class _FaltaNoReportadaDialogState extends State<FaltaNoReportadaDialog> {
  bool _canClose = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) setState(() => _canClose = true);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fecha = DateFormat.yMMMMd().format(widget.fecha);
    final horaAviso = widget.horaAviso;
    final horaLimite = widget.horaLimite;
    final style = DefaultTextStyle.of(context).style;
    final boldStyle = style.copyWith(fontWeight: FontWeight.bold);

    final String instrucciones;
    final List<InlineSpan> notaSpans;
    if (horaAviso != null && horaLimite != null) {
      // El backend manda la hora con su offset (ej. "-07:00"); Dart la
      // parsea como un instante UTC internamente (isUtc=true), asi que sin
      // toLocal() DateFormat imprime las horas en UTC en vez de la hora
      // local real.
      instrucciones =
        'Repórtala hoy creando una incidencia (Faltas, Incapacidades o '
        'Requerimientos Judiciales) -- espera a un lado, idealmente '
        'repórtala a las ${DateFormat.jm().format(horaAviso.toLocal())} para no hacer '
        'fila con tus compañeros.';
      notaSpans = [
        TextSpan(text: 'Nota:', style: boldStyle),
        TextSpan(text: ' Si no la reportas '),
        TextSpan(text: 'antes', style: boldStyle),
        TextSpan(text: ' de las '),
        TextSpan(text: DateFormat.jm().format(horaLimite.toLocal()), style: boldStyle),
        TextSpan(text: ', tu asistencia de hoy será '),
        TextSpan(text: 'eliminada', style: boldStyle),
        TextSpan(text: ' y se marcará como falta.'),
      ];
    } else {
      instrucciones =
        'Repórtala hoy creando una incidencia (Faltas, Incapacidades o '
        'Requerimientos Judiciales) -- espera a un lado para no hacer fila '
        'con tus compañeros.';
      notaSpans = [
        TextSpan(text: 'Nota:', style: boldStyle),
        TextSpan(text: ' Si no la reportas pronto, tu asistencia de hoy será '),
        TextSpan(text: 'eliminada', style: boldStyle),
        TextSpan(text: ' y se marcará como falta.'),
      ];
    }

    return AlertDialog(
      title: Text('Falta sin reportar'),
      content: Text.rich(
        TextSpan(
          style: style,
          children: [
            TextSpan(text: 'Hola ${widget.nombre}, tienes una falta sin reportar del $fecha. $instrucciones\n\n'),
            ...notaSpans,
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: _canClose ? () => context.pop() : null,
          child: Text('Entendido'),
        ),
      ],
    );
  }
}
