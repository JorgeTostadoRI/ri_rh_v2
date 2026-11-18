import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/rh_colores.dart';

enum StatusChipType {
  success,
  warning,
  failure,
}

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.type,
    required this.label,
    this.mouseCursor,
  });

  final StatusChipType type;
  final String label;
  final MouseCursor? mouseCursor;

  Color _bgColor(RhColores c) {
    return switch (type) {
      StatusChipType.success => c.exitoFondo,
      StatusChipType.warning => c.avisoFondo,
      StatusChipType.failure => c.falloFondo,
    };
  }

  Color _textColor(RhColores c) {
    return switch (type) {
      StatusChipType.success => c.exitoTexto,
      StatusChipType.warning => c.avisoTexto,
      StatusChipType.failure => c.falloTexto,
    };
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rh;
    final bgColor = _bgColor(c);
    final textColor = _textColor(c);
    return Chip(
      backgroundColor: bgColor,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      mouseCursor: mouseCursor,
      label: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: .w900,
          height: 1.5,
          color: textColor,
        ),
      ),
    );
  }
}