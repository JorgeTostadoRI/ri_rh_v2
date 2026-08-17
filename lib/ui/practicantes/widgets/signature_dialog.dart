import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicante_huellas_viewmodel.dart';

class SignatureDialog extends StatefulWidget {
  final PracticanteHuellasViewmodel viewmodel;

  const SignatureDialog({
    super.key,
    required this.viewmodel,
  });

  @override
  State<SignatureDialog> createState() => _SignatureDialogState();
}

class _SignatureDialogState extends State<SignatureDialog> {
  late final StreamSubscription<Scan> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.viewmodel.captureImageSub;
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewmodel,
      builder: (context, child) {
        final imageBytes = widget.viewmodel.imageBytes;

        return AlertDialog(
          title: Text('Captura de Firma'),
          content: Column(
            spacing: 24,
            children: [
              Text('Escanea tu huella, se mostrará una previsualización de tu huella antes de guardarla.'),
              imageBytes == null
                ? Container(
                    width: 300,
                    height: 375,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(
                        color: labelTextColor,
                        width: 0.8,
                      )),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      LucideIcons.fingerprintPattern,
                      color: primaryColor,
                      size: 96,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.memory(imageBytes),
                  ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: imageBytes == null ? null : () {},
              child: Text('Guardar'),
            ),
          ],
        );
      }
    );
  }
}