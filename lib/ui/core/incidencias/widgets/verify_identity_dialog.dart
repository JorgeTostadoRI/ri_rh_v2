import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/utils/result.dart';

class VerifyIdentityDialog extends StatelessWidget {
  const VerifyIdentityDialog({super.key});

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
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context, Result.ok(true));
                  },
                  icon: Icon(LucideIcons.fingerprintPattern),
                  label: Text(
                    'Escanear huella',
                  ),
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