import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ConfirmActionDialog extends StatelessWidget {
  /// Builds an [AlertDialog] used for confirming a dangerous action, it will return
  /// a [bool] if the user pressed cancel or confirm.
  const ConfirmActionDialog({
    super.key,
    this.title,
    this.content,
  });

  final Widget? title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title ?? Text('Confirmar acción'),
      content: content ?? Text('¿Estás seguro de realizar esta acción?'),
      actions: [
        OutlinedButton(
          onPressed: () => context.pop(false),
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          child: Text('Confirmar'),
        ),
      ],
    );
  }
}