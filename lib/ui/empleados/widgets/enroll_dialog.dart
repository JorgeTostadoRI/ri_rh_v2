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
      widget.viewmodel.enroll.clearResult();
      Navigator.pop(context);
    }
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
          const SizedBox(height: 24),
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
            listenable: widget.viewmodel,
            builder: (context, _) {
              if (widget.viewmodel.enroll.error) {
                return Text(
                  'Ha ocurrido un error con el registro, por favor vuelva a intentarlo.',
                  style: TextStyle(
                    color: labelTextColor,
                    fontSize: 14,
                    height: 1.4
                  ),
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

              return Text(
                'Coloca tu dedo en el lector de huella ${widget.viewmodel.captureCount} veces más.',
                style: TextStyle(
                  color: labelTextColor,
                  fontSize: 14,
                  height: 1.4
                ),
              );
            }
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: ListenableBuilder(
                  listenable: widget.viewmodel.enroll,
                  builder: (context, _) {
                    if (widget.viewmodel.enroll.running || widget.viewmodel.enroll.completed) {
                      return SizedBox.shrink();
                    }

                    return OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    );
                  }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}