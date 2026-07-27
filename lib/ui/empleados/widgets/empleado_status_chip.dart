import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';

class EmpleadoStatusChip extends StatelessWidget {
  const EmpleadoStatusChip({
    super.key,
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