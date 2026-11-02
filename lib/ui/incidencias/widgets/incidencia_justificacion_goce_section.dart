import 'package:flutter/material.dart';

/// Justificación que escribió el jefe directo al aprobar un Permiso con goce
/// de sueldo. Se muestra a quien revisa (aprobador de con goce, RH); el
/// backend no la manda al propio solicitante.
class IncidenciaJustificacionGoceSection extends StatelessWidget {
  const IncidenciaJustificacionGoceSection({
    super.key,
    required this.justificacion,
  });

  final String justificacion;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Justificación del goce de sueldo', style: textTheme.headlineSmall),
          Text(justificacion, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
