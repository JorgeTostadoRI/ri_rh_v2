import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class EmpleadoCard extends StatelessWidget {
  const EmpleadoCard({
    super.key,
    required this.empleado,
  });

  final Empleado empleado;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Expanded(
                      child: Text(
                        empleado.nombre,
                        style: TextTheme.of(context).headlineSmall,
                      ),
                    ),
                    _StatusChip(status: empleado.estatus),
                  ],
                ),
                Row(
                  spacing: 6,
                  mainAxisAlignment: .start,
                  children: [
                    Icon(
                      LucideIcons.briefcase,
                      color: primaryColor,
                    ),
                    // TODO: obtener nombre de puesto
                    Text(
                      '${empleado.puesto}',
                      style: TextTheme.of(context).labelMedium?.copyWith(
                        color: primaryColor,
                        fontWeight: .w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              spacing: 24,
              mainAxisSize: .min,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Flexible(
                      child: _AttributeLabel(
                        name: 'SALARIO DIARIO',
                        icon: LucideIcons.dollarSign,
                        value: empleado.salarioDiario.toString(),
                      ),
                    ),
                    Flexible(
                      child: _AttributeLabel(
                        name: 'ANTIGUEDAD',
                        icon: LucideIcons.calendar,
                        value: '${empleado.antiguedad} años',
                      )
                    ),
                  ],
                ),
                _AttributeLabel(
                  name: 'NSS (SEGURO SOCIAL)',
                  icon: LucideIcons.hospital,
                  value: empleado.numeroSeguroSocial,
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                border: BoxBorder.fromLTRB(
                  top: const BorderSide(
                    color: Color(0xFFF5E8D8),
                    width: 0.8,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.go(Routes.expedienteOfEmpleado(empleado));
                    },
                    child: Text('Ver Expediente', style: TextStyle(fontSize: 12)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Esta funcionalidad no se encuentra disponible.'),
                        ),
                      );
                    },
                    child: Text('Estadísticas', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.status,
  });

  final EmpleadoEstatus status;

  Color get backgroundColor {
    return switch (status) {
      EmpleadoEstatus.activo => const Color(0xFFDCFCE7),
      EmpleadoEstatus.procesoFiniquito => const Color(0xFFFFEDD4),
      EmpleadoEstatus.finiquitado => const Color(0xFFFFE2E2),
    };
  }

  Color get textColor {
    return switch (status) {
      EmpleadoEstatus.activo => const Color(0xFF00A63E),
      EmpleadoEstatus.procesoFiniquito => const Color(0xFFF54900),
      EmpleadoEstatus.finiquitado => const Color(0xFFE7000B),
    };
  }

  String get statusString {
    return switch (status) {
      EmpleadoEstatus.activo => 'ACTIVO',
      EmpleadoEstatus.procesoFiniquito => 'EN PROCESO DE FINIQUITO',
      EmpleadoEstatus.finiquitado => 'FINIQUITADO',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: backgroundColor,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      label: Text(
        statusString,
        style: TextStyle(
          fontSize: 10,
          fontWeight: .w900,
          height: 1.5,
          color: textColor,
        ),
      )
    );
  }
}

class _AttributeLabel extends StatelessWidget {
  const _AttributeLabel({
    required this.name,
    required this.icon,
    required this.value,
  });

  final String name;
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(
          name,
          style: TextTheme.of(context).labelSmall?.copyWith(fontSize: 10, fontWeight: .w700),
        ),
        Row(
          spacing: 4,
          crossAxisAlignment: .center,
          children: [
            Icon(icon, color: primaryColor, size: 14),
            Text(
              value,
              style: TextTheme.of(context).titleMedium?.copyWith(fontWeight: .w900, color: headingTextColor),
            ),
          ],
        ),
      ],
    );
  }
}