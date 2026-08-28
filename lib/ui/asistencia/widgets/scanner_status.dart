import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/asistencia/view_models/asistencia_viewmodel.dart';

class ScannerStatus extends StatelessWidget {
  const ScannerStatus({
    super.key,
    required this.viewmodel,
  });

  final AsistenciaViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, _) {
        if (!viewmodel.scannerAvailable) {
          return Card(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'NO HAY CONEXIÓN CON ESCANER, CONECTAR Y REINICIAR APLICACIÓN',
                style: textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
            ),
          );
        }
  
        return SizedBox.shrink();
      }
    );
  }
}