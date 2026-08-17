import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleado_huellas_viewmodel.dart';

class SignatureDialog extends StatefulWidget {
  final EmpleadoHuellasViewmodel viewmodel;

  const SignatureDialog({
    super.key,
    required this.viewmodel,
  });

  @override
  State<SignatureDialog> createState() => _SignatureDialogState();
}

class _SignatureDialogState extends State<SignatureDialog> {
  late final StreamSubscription<Scan> _subscription;

  void _listener() {
    if (widget.viewmodel.addSignature.completed) {
      widget.viewmodel.addSignature.clearResult();
      context.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    _subscription = widget.viewmodel.captureImageSub;
    widget.viewmodel.addSignature.addListener(_listener);
  }

  @override
  void didUpdateWidget(covariant SignatureDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewmodel.addSignature.removeListener(_listener);
    widget.viewmodel.addSignature.addListener(_listener);
  }

  @override
  void dispose() {
    _subscription.cancel();
    widget.viewmodel.addSignature.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        widget.viewmodel,
        widget.viewmodel.addSignature,
      ]),
      builder: (context, child) {
        final imageBytes = widget.viewmodel.imageBytes;

        if (widget.viewmodel.addSignature.error) {
          return AlertDialog(
            title: Text('Detalle de Error'),
            content: Column(
              mainAxisSize: .min,
              spacing: 24,
              children: [
                Text('Se encontró un error al intentar guardar la firma'),
                Text(
                  widget.viewmodel.addSignature.result.toString(),
                  style: TextStyle(color: errorColor),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () => widget.viewmodel.addSignature.clearResult(),
                child: Text('Reintentar'),
              ),
            ],
          );
        }

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
              onPressed: imageBytes == null
                ? null
                : () => widget.viewmodel.addSignature.execute(),
              child: Text('Guardar'),
            ),
          ],
        );
      }
    );
  }
}