import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class BaseEmpleadoCard extends StatelessWidget {
  const BaseEmpleadoCard({
    super.key,
    required this.baseEmpleado,
    required this.statusChip,
    required this.onExpedientePressed,
  });

  final BaseEmpleado baseEmpleado;
  final Widget statusChip;
  final void Function() onExpedientePressed;


  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd();
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
                        baseEmpleado.nombre,
                        style: TextTheme.of(context).headlineSmall,
                      ),
                    ),
                    statusChip,
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
                    Expanded(
                      child: Text(
                        baseEmpleado.puesto.nombre,
                        style: TextTheme.of(context).labelMedium?.copyWith(
                          color: primaryColor,
                          fontWeight: .w700,
                        ),
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
                        value: baseEmpleado.salario.toString(),
                      ),
                    ),
                    Flexible(
                      child: _AttributeLabel(
                        name: 'REGISTRADO EN',
                        icon: LucideIcons.calendar,
                        value: dateFormat.format(baseEmpleado.registradoEn!),
                      )
                    ),
                  ],
                ),
                _AttributeLabel(
                  name: 'NSS (SEGURO SOCIAL)',
                  icon: LucideIcons.hospital,
                  value: baseEmpleado.nss,
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
                    onPressed: onExpedientePressed,
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