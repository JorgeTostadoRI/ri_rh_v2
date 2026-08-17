import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/hand_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/delete_fingerprint_dialog.dart';
import 'package:ri_rh_v2/ui/practicantes/widgets/enroll_dialog.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicante_huellas_viewmodel.dart';
import 'package:ri_rh_v2/ui/practicantes/widgets/signature_dialog.dart';

class PracticanteHuellasScreen extends StatelessWidget {
  const PracticanteHuellasScreen({
    super.key,
    required this.viewmodel,
  });

  final PracticanteHuellasViewmodel viewmodel;

  Future<void> onAddHandler(BuildContext context, Finger finger) async {
    if (finger.user <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('El practicante no cuenta con un usuario asociado, contacte al administrador.'),
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
    final textTheme = TextTheme.of(context);

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

            final practicante = viewmodel.practicante;
            return Column(
              spacing: 32,
              crossAxisAlignment: .stretch,
              children: [
                PageHeader(
                  title: 'Huellas del Practicante',
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
                        Text(
                          switch (practicante.type) {
                            TypePracticante.practicante => 'PRACTICANTE',
                            TypePracticante.residente => 'RESIDENTE',
                          },
                          style: textTheme.labelSmall?.copyWith(fontWeight: .w900),
                        ),
                        Text(practicante.base.nombre, style: textTheme.headlineSmall),
                        Row(
                          spacing: 6,
                          mainAxisSize: .min,
                          children: [
                            Icon(LucideIcons.briefcase, color: primaryColor, size: 14),
                            Text(
                              practicante.base.puesto.nombre,
                              style: textTheme.labelMedium?.copyWith(
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
                _SignatureCard(viewmodel: viewmodel),
              ],
            );
          }
        ),
      ),
    );
  }
}

class _SignatureCard extends StatelessWidget {
  const _SignatureCard({
    required this.viewmodel,
  });

  final PracticanteHuellasViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    if (!viewmodel.practicante.base.hasSignature) {
      return Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: .min,
            children: [
              ListTile(
                leading: Icon(LucideIcons.circleAlert, color: statusWarningColor),
                title: Text('Se requieren acciones', style: textTheme.headlineSmall),
                subtitle: Text('Este practicante no tiene capturada huella para firma de incidencias.')
              ),
              Row(
                mainAxisAlignment: .end,
                children: [
                  ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => SignatureDialog(viewmodel: viewmodel),
                    ),
                    child: const Text('Agregar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(LucideIcons.circleCheck, color: statusSuccessColor),
          title: Text('Firma para incidencias registrada', style: textTheme.headlineSmall),
        ),
      ),
    );
  }
}
