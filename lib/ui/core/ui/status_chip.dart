import 'package:flutter/material.dart';

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
  });

  final StatusChipType type;
  final String label;

  Color get bgColor {
    return switch (type) {
      StatusChipType.success => const Color(0xFFDCFCE7),
      StatusChipType.warning => const Color(0xFFFFEDD4),
      StatusChipType.failure => const Color(0xFFFFE2E2),
    };
  }

  Color get textColor {
    return switch (type) {
      StatusChipType.success => const Color(0xFF00A63E),
      StatusChipType.warning => const Color(0xFFF54900),
      StatusChipType.failure => const Color(0xFFE7000B),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: bgColor,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      mouseCursor: SystemMouseCursors.click,
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