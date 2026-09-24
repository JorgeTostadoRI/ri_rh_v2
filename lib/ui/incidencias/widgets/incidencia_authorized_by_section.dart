import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

/// Muestra explicitamente quien dio cada una de las dos aprobaciones de una
/// incidencia (jefe directo y RH), para evitar malentendidos sobre quien
/// autorizo que.
class IncidenciaAuthorizedBySection extends StatelessWidget {
  const IncidenciaAuthorizedBySection({
    super.key,
    required this.incidencia,
  });

  final Incidencia incidencia;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Autorizado por', style: textTheme.headlineSmall),
        const SizedBox(height: 4),
        _AuthorizerRow(label: 'Jefe directo', user: incidencia.approvedBy),
        if (incidencia.category == IncidenciaCategory.permiso && incidencia.conGoce == true)
          _AuthorizerRow(label: 'Iván Romero (con goce)', user: incidencia.conGoceApprovedBy),
        _AuthorizerRow(label: 'Recursos Humanos', user: incidencia.rhApprovedBy),
      ],
    );
  }
}

class _AuthorizerRow extends StatelessWidget {
  const _AuthorizerRow({
    required this.label,
    required this.user,
  });

  final String label;
  final User? user;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final nombre = user?.nombre;

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        children: [
          Text('$label: ', style: textTheme.bodyMedium),
          Text(
            nombre ?? 'Pendiente',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: nombre != null ? .w700 : .w400,
              color: nombre != null ? headingTextColor : labelTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
