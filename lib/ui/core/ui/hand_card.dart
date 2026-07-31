import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/status_chip.dart';

class HandCard extends StatelessWidget {
  const HandCard({
    super.key,
    required this.title,
    required this.fingers,
    required this.onAdd,
    required this.onDelete,
  });

  final String title;
  final List<Finger> fingers;
  final void Function(BuildContext context, Finger finger) onAdd;
  final void Function(BuildContext context, Finger finger) onDelete;

  int get _count {
    int count = 0;
    for (final finger in fingers) {
      if (finger.scanned) count++;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 8,
          children: [
            Text(title, style: TextTheme.of(context).headlineSmall),
            Text('$_count de 5 huellas escaneadas'),
            for (final finger in fingers)
              _FingerStatus(
                finger: finger,
                onAdd: onAdd,
                onDelete: onDelete,
              ),
          ],
        ),
      ),
    );
  }
}

class _FingerStatus extends StatelessWidget {
  const _FingerStatus({
    required this.finger,
    required this.onAdd,
    required this.onDelete,
  });

  final Finger finger;
  final void Function(BuildContext context, Finger finger) onAdd;
  final void Function(BuildContext context, Finger finger) onDelete;

  String get nameOfFinger {
    return switch(finger.fingerName) {
      FingerName.thumb => 'Pulgar',
      FingerName.pointer => 'Indice',
      FingerName.middle => 'Medio',
      FingerName.ring => 'Anular',
      FingerName.pinky => 'Meñique',
    };
  }

  Color get iconBgColor => finger.scanned ? successColor : errorColor;
  IconData get icon => finger.scanned ? LucideIcons.check : LucideIcons.x;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          spacing: 8,
          mainAxisSize: .min,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 14,
              ),
            ),
            Text(nameOfFinger),
          ],
        ),
        // If scanner is not available just render the status
        if (kIsWeb)
          StatusChip(
            type: finger.scanned ? StatusChipType.success : StatusChipType.failure,
            label: finger.scanned ? 'ESCANEADO' : 'PENDIENTE',
          ),
        // If scanner is available allow interaction
        if (!kIsWeb)
          GestureDetector(
            onTap: finger.scanned
              ? () => onDelete(context, finger)
              : () => onAdd(context, finger),
            child: StatusChip(
              type: finger.scanned ? StatusChipType.success : StatusChipType.failure,
              label: finger.scanned ? 'ESCANEADO' : 'PENDIENTE',
              mouseCursor: SystemMouseCursors.click,
            ),
          ),
      ],
    );
  }
}