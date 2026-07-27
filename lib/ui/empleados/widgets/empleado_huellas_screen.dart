import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/hand_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/delete_fingerprint_dialog.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleado_huellas_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/enroll_dialog.dart';

class EmpleadoHuellasScreen extends StatelessWidget {
  const EmpleadoHuellasScreen({
    super.key,
    required this.viewmodel,
  });

  final EmpleadoHuellasViewmodel viewmodel;

  Future<void> onAddHandler(BuildContext context, Finger finger) async {
    if (finger.user <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('El empleado no cuenta con un usuario asociado, contacte al administrador.'),
        ),
      );
      return;
    }

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
                        Text(empleado.base.nombre, style: TextTheme.of(context).headlineSmall),
                        Row(
                          spacing: 6,
                          mainAxisSize: .min,
                          children: [
                            Icon(LucideIcons.briefcase, color: primaryColor, size: 14),
                            Text(
                              empleado.base.puesto.nombre,
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
                          return HandCard(
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
                          return HandCard(
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
