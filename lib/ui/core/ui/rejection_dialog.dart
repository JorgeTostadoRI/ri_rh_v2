import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RejectionDialog extends StatefulWidget {
  const RejectionDialog({super.key});

  @override
  State<RejectionDialog> createState() => _RejectionDialogState();
}

class _RejectionDialogState extends State<RejectionDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _rejectionReason;

  @override
  void initState() {
    super.initState();
    _rejectionReason = TextEditingController();
  }

  @override
  void dispose() {
    _rejectionReason.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Motivo de rechazo'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: .min,
          children: [
            SizedBox(
              width: 500,
              child: TextFormField(
                controller: _rejectionReason,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el motivo';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('MOTIVO'),
                ),
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => context.pop(),
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.pop(_rejectionReason.text);
            }
          },
          child: Text('Confirmar'),
        ),
      ],
    );
  }
}