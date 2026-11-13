import 'package:flutter/material.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

class DeleteFingerprintDialog extends StatelessWidget {
  const DeleteFingerprintDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // En celular el diálogo usa casi todo el ancho de la pantalla.
      insetPadding: esNavegadorMovil
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 24)
          : null,
      backgroundColor: Colors.white,
      title: Text('Confimar Eliminación'),
      content: Text('¿Estás seguro de eliminar esta huella?\n'
        'Esta acción no se podrá revertir, pero podrás escanear la huella nuevamente.'),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Eliminar'),
        ),
      ],
    );
  }
}