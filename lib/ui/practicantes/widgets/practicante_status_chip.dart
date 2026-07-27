import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';

class PracticanteStatusChip extends StatelessWidget {
  const PracticanteStatusChip({
    super.key,
    required this.status,
  });

  final StatusPracticante status;

  Color get backgroundColor {
    return switch (status) {
      StatusPracticante.alta => const Color(0xFFDCFCE7),
      StatusPracticante.baja => const Color(0xFFFFE2E2),
    };
  }

  Color get textColor {
    return switch (status) {
      StatusPracticante.alta => const Color(0xFF00A63E),
      StatusPracticante.baja => const Color(0xFFE7000B),
    };
  }

  String get statusString {
    return switch (status) {
      StatusPracticante.alta => 'ALTA',
      StatusPracticante.baja => 'BAJA',
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