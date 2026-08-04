import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/utils/result.dart';

class VerifyIdentityDialog extends StatefulWidget {
  const VerifyIdentityDialog({
    super.key,
    required this.viewmodel,
  });

  final NewIncidenciaViewmodel viewmodel;

  @override
  State<VerifyIdentityDialog> createState() => _VerifyIdentityDialogState();
}

class _VerifyIdentityDialogState extends State<VerifyIdentityDialog> {
  void _onResult() {
    if (widget.viewmodel.login.completed) {
      widget.viewmodel.login.clearResult();
      Navigator.pop(context, const Result.ok(true));
    }
    if (widget.viewmodel.login.error) {
      Navigator.pop(context, Result<bool>.error((widget.viewmodel.login.result as Error).error));
      widget.viewmodel.login.clearResult();
    }
  }
  
  @override
  void initState() {
    super.initState();
    widget.viewmodel.login.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant VerifyIdentityDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewmodel.login.removeListener(_onResult);
    widget.viewmodel.login.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewmodel.login.removeListener(_onResult);
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
            'Verificación de identidad',
            style: TextStyle(
              color: headingTextColor,
              fontSize: 20,
              fontWeight: .w900,
              height: 1.4,
            ),
          ),
          Text(
            'Coloca tu dedo en el lector de huella digital para confirmar y enviar tu solicitud',
            style: TextStyle(
              color: labelTextColor,
              fontSize: 14,
              height: 1.4
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, Result.ok(false));
                  },
                  child: Text('Cancelar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}