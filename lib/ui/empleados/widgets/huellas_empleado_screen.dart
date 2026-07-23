import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/status_chip.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/huellas_empleado_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/delete_fingerprint_dialog.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/enroll_dialog.dart';

class HuellasEmpleadoScreen extends StatelessWidget {
  const HuellasEmpleadoScreen({
    super.key,
    required this.viewmodel,
  });

  final HuellasEmpleadoViewmodel viewmodel;

  Future<void> onAddHandler(BuildContext context, Finger finger) async {
    viewmodel.selectedFinger = finger;
    await showDialog(
      context: context,
      builder: (context) => EnrollDialog(viewmodel: viewmodel), 
    ) ?? false;
    viewmodel.clearSelectedFinger();
    viewmodel.enroll.clearResult();
    viewmodel.capture.clearResult();
  }

  Future<void> onDeleteHandler(BuildContext context, Finger finger) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => const DeleteFingerprintDialog(),
    ) ?? false;
    switch (confirmed) {
      case true:
        viewmodel.delete.execute(finger);
      case false:
        viewmodel.clearSelectedFinger();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: ListenableBuilder(
          listenable: viewmodel.load,
          builder: (context, _) {
            if (viewmodel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewmodel.load.error) {
              return Center(child: Text(viewmodel.load.result.toString()));
            }

            final empleado = viewmodel.empleado;
            return Column(
              spacing: 32,
              crossAxisAlignment: .stretch,
              children: [
                PageHeader(
                  title: 'Huellas del Empleado',
                  subtitle: 'Verifica el estado de registro y realiza el escaneo de huellas',
                  showBackButton: true,
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: .start,
                      children: [
                        Text('COLABORADOR', style: TextTheme.of(context).labelSmall?.copyWith(fontWeight: .w900)),
                        Text(empleado.nombre, style: TextTheme.of(context).headlineSmall),
                        Row(
                          spacing: 6,
                          mainAxisSize: .min,
                          children: [
                            Icon(LucideIcons.briefcase, color: primaryColor, size: 14),
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
                  ),
                ),
                Row(
                  spacing: 24,
                  children: [
                    Flexible(
                      child: ListenableBuilder(
                        listenable: Listenable.merge([viewmodel.delete, viewmodel.enroll]),
                        builder: (context, _) {
                          return _HandCard(
                            title: 'Mano izquierda',
                            fingers: viewmodel.leftHandFingers,
                            onAdd: onAddHandler,
                            onDelete: onDeleteHandler,
                          );
                        }
                      ),
                    ),
                    Flexible(
                      child: ListenableBuilder(
                        listenable: Listenable.merge([viewmodel.delete, viewmodel.enroll]),
                        builder: (context, _) {
                          return _HandCard(
                            title: 'Mano derecha',
                            fingers: viewmodel.rightHandFingers,
                            onAdd: onAddHandler,
                            onDelete: onDeleteHandler,
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

class _HandCard extends StatelessWidget {
  const _HandCard({
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
        GestureDetector(
          onTap: finger.scanned
            ? () => onDelete(context, finger)
            : () => onAdd(context, finger),
          child: StatusChip(
            type: finger.scanned ? StatusChipType.success : StatusChipType.failure,
            label: finger.scanned ? 'ESCANEADO' : 'PENDIENTE',
          ),
        )
      ],
    );
  }
}