import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/huellas_empleado_viewmodel.dart';

class EnrollDialog extends StatefulWidget {
  const EnrollDialog({
    super.key,
    required this.viewmodel,
  });
  
  final HuellasEmpleadoViewmodel viewmodel;

  @override
  State<EnrollDialog> createState() => _EnrollDialogState();
}

class _EnrollDialogState extends State<EnrollDialog> {
  late final StreamSubscription<Uint8List> _subscription;

  void _listener() {
    if (widget.viewmodel.enroll.completed) {
      Navigator.pop(context);
    }
  }

  String get countsLeftText {
    if (widget.viewmodel.captureCount == 1) {
      return 'Coloca tu dedo en el lector de huella ${widget.viewmodel.captureCount} vez más.';
    }
    return 'Coloca tu dedo en el lector de huella ${widget.viewmodel.captureCount} veces más.';
  }

  @override
  void initState() {
    super.initState();
    _subscription = widget.viewmodel.capturesSub;
    widget.viewmodel.enroll.addListener(_listener);
  }

  @override
  void didUpdateWidget(covariant EnrollDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewmodel.enroll.removeListener(_listener);
    widget.viewmodel.enroll.addListener(_listener);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      constraints: BoxConstraints(maxWidth: 384, maxHeight: 384),
      contentPadding: EdgeInsets.all(32),
      backgroundColor: Colors.white,
      content: Column(
        spacing: 24,
        mainAxisSize: .min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              LucideIcons.fingerprintPattern,
              color: primaryColor,
              size: 44,
            ),
          ),
          Text(
            'Escaneo de Huella',
            style: TextStyle(
              color: headingTextColor,
              fontSize: 20,
              fontWeight: .w900,
              height: 1.4,
            ),
          ),
          ListenableBuilder(
            listenable: Listenable.merge([
              widget.viewmodel,
              widget.viewmodel.enroll,
              widget.viewmodel.capture,
            ]),
            builder: (context, _) {
              if (widget.viewmodel.capture.error) {
                return Column(
                  spacing: 20,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      widget.viewmodel.capture.result.toString(),
                      style: TextStyle(color: errorColor),
                    ),
                    Text(
                      'Ha ocurrido un error con la captura, por favor vuelva a intentarlo.',
                      style: TextStyle(
                        color: labelTextColor,
                        fontSize: 14,
                        height: 1.4
                      ),
                    ),
                  ],
                ); 
              }
              if (widget.viewmodel.enroll.error) {
                return Column(
                  spacing: 20,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      widget.viewmodel.enroll.result.toString(),
                      style: TextStyle(color: errorColor),
                    ),
                    Text(
                      'Ha ocurrido un error con el registro, por favor vuelva a intentarlo.',
                      style: TextStyle(
                        color: labelTextColor,
                        fontSize: 14,
                        height: 1.4
                      ),
                    ),
                  ],
                ); 
              }
              if (widget.viewmodel.enroll.running) {
                return Text(
                  'Registrando la huella, espere un momento...',
                  style: TextStyle(
                    color: labelTextColor,
                    fontSize: 14,
                    height: 1.4
                  ),
                );
              }
              if (widget.viewmodel.enroll.completed) {
                return Text(
                  'Se registró la huella exitosamente.',
                  style: TextStyle(
                    color: labelTextColor,
                    fontSize: 14,
                    height: 1.4
                  ),
                );
              }

              final captureCount = widget.viewmodel.captureCount;
              return Column(
                spacing: 32,
                mainAxisSize: .min,
                children: [
                  Text('Presiona tu dedo 3 veces sobre el escaneador para capturar tu huella.', textAlign: .center,),
                  Row(
                    spacing: 12,
                    mainAxisSize: .min,
                    mainAxisAlignment: .center,
                    children: [
                      _EnrollmentStatusIcon(success: captureCount < 3),
                      _EnrollmentStatusIcon(success: captureCount < 2),
                      _EnrollmentStatusIcon(success: captureCount < 1),
                    ],
                  ),
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}

class _EnrollmentStatusIcon extends StatelessWidget {
  const _EnrollmentStatusIcon({
    required this.success,
  });

  final bool success;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: success ? statusSuccessBgColor : backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        LucideIcons.fingerprintPattern,
        size: 20,
        color: success ? statusSuccessColor : primaryColor,
      ),
    );
  }
}