import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Dirección, en vez de aprobar o rechazar la contratación de un
/// practicante, le regresa la evaluación a su jefe con un comentario (ej. el
/// puesto está mal) para que la corrija. Regresa el comentario, o null si
/// se cancela.
class RetroalimentacionDialog extends StatefulWidget {
  const RetroalimentacionDialog({super.key, required this.nombre});

  final String nombre;

  @override
  State<RetroalimentacionDialog> createState() => _RetroalimentacionDialogState();
}

class _RetroalimentacionDialogState extends State<RetroalimentacionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _comentario = TextEditingController();

  @override
  void dispose() {
    _comentario.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Retroalimentación'),
      content: SizedBox(
        width: 480,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              Text(
                'Se le regresará la evaluación de ${widget.nombre} a su jefe para que la corrija y la vuelva a mandar.',
                style: TextStyle(color: Colors.grey[700]),
              ),
              TextFormField(
                controller: _comentario,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'COMENTARIO PARA EL JEFE'),
                validator: (value) => (value ?? '').trim().isEmpty ? 'Requerido' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) context.pop(_comentario.text.trim());
          },
          child: const Text('Regresar al jefe'),
        ),
      ],
    );
  }
}
