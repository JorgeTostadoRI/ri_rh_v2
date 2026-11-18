import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/rh_colores.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';

class EmpleadoStatusChip extends StatelessWidget {
  const EmpleadoStatusChip({
    super.key,
    required this.status,
    this.porAbandono = false,
  });

  final EmpleadoEstatus status;
  final bool porAbandono;

  Color _fondo(RhColores c) {
    return switch (status) {
      EmpleadoEstatus.activo => c.exitoFondo,
      EmpleadoEstatus.procesoFiniquito => c.avisoFondo,
      EmpleadoEstatus.finiquitado => c.falloFondo,
    };
  }

  Color _texto(RhColores c) {
    return switch (status) {
      EmpleadoEstatus.activo => c.exitoTexto,
      EmpleadoEstatus.procesoFiniquito => c.avisoTexto,
      EmpleadoEstatus.finiquitado => c.falloTexto,
    };
  }

  String get statusString {
    return switch (status) {
      EmpleadoEstatus.activo => 'ACTIVO',
      EmpleadoEstatus.procesoFiniquito => 'EN PROCESO DE FINIQUITO',
      EmpleadoEstatus.finiquitado => porAbandono ? 'FINIQUITADO POR ABANDONO' : 'FINIQUITADO',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: _fondo(context.rh),
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
          color: _texto(context.rh),
        ),
      )
    );
  }
}