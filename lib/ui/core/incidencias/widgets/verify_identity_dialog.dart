import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/incidencias/view_models/new_incidencia_viewmodel.dart';
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
      widget.viewmodel.login.clearResult();
      Navigator.pop(context, Result.error(Exception('Error')));
    }
  }
  
  @override
  void initState() {
    super.initState();
    widget.viewmodel.login.addListener(_onResult);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      constraints: BoxConstraints(maxWidth: 384, maxHeight: 384),
      contentPadding: EdgeInsets.all(32),
      backgroundColor: Colors.white,
      content: Column(
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
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: ListenableBuilder(
                  listenable: widget.viewmodel.login,
                  builder: (context, _) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        widget.viewmodel.login.execute('fingerprint');
                      },
                      icon: Icon(LucideIcons.fingerprintPattern),
                      label: Text(
                        'Escanear huella',
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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