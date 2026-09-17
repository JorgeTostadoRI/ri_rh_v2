import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ri_rh_v2/domain/models/credenciales_generadas/credenciales_generadas.dart';

/// Diálogo que muestra un usuario/contraseña generados por el backend (al
/// dar de alta, o al regenerar), con botones para copiar cada uno al
/// portapapeles. Se muestra una sola vez: el backend nunca vuelve a
/// devolver la contraseña en texto plano una vez cerrado este diálogo.
class CredencialesDialog {
  static Future<void> show(
    BuildContext context, {
    required String nombre,
    required CredencialesGeneradas credenciales,
    bool isRegeneracion = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(isRegeneracion ? 'Contraseña regenerada' : 'Usuario creado'),
        content: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          spacing: 8,
          children: [
            Text(
              isRegeneracion
                  ? 'Se generó una nueva contraseña para $nombre. La anterior ya no funciona.'
                  : 'Se creó y vinculó un usuario automáticamente para $nombre.',
            ),
            _credencialRow(context, 'Usuario', credenciales.username),
            _credencialRow(context, 'Contraseña', credenciales.password),
            Text('Guárdala ahora, no se volverá a mostrar.'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Entendido'),
          ),
        ],
      ),
    );
  }

  static Widget _credencialRow(BuildContext context, String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text('$label: $value', style: TextStyle(fontWeight: .w700)),
        ),
        IconButton(
          icon: const Icon(Icons.copy, size: 18),
          tooltip: 'Copiar $label',
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: value));
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$label copiado al portapapeles')),
            );
          },
        ),
      ],
    );
  }
}
