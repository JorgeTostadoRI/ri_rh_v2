import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

SnackBar errorSnackBar(BuildContext context, String message, {Object? error}) {
  if (error == null) {
    return SnackBar(
      content: Text(message),
      persist: false,
    );
  }

  return SnackBar(
    content: Text(message),
    persist: false,
    action: SnackBarAction(
      label: 'Detalles',
      onPressed: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Detalle de Error'),
            content: Text(
              error.toString(),
              style: TextStyle(color: errorColor),
            ),
          );
        }
      ),
    ),
  );
}