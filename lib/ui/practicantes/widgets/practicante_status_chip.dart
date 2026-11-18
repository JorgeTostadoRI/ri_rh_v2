import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/rh_colores.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';

class PracticanteStatusChip extends StatelessWidget {
  const PracticanteStatusChip({
    super.key,
    required this.status,
    this.porAbandono = false,
  });

  final StatusPracticante status;
  final bool porAbandono;

  Color _fondo(RhColores c) {
    return switch (status) {
      StatusPracticante.alta => c.exitoFondo,
      StatusPracticante.procesoBaja => c.avisoFondo,
      StatusPracticante.baja => c.falloFondo,
    };
  }

  Color _texto(RhColores c) {
    return switch (status) {
      StatusPracticante.alta => c.exitoTexto,
      StatusPracticante.procesoBaja => c.avisoTexto,
      StatusPracticante.baja => c.falloTexto,
    };
  }

  String get statusString {
    return switch (status) {
      StatusPracticante.alta => 'ALTA',
      StatusPracticante.procesoBaja => 'EN PROCESO DE BAJA',
      StatusPracticante.baja => porAbandono ? 'BAJA POR ABANDONO' : 'BAJA',
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