import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/fingerprint_button.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/clock.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';

class AsistenciaScreen extends StatelessWidget {
  const AsistenciaScreen({
    super.key,
    required this.viewmodel,  
  });

  final AsistenciaViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x20FDDEB0),
      body: Row(
        children: [
          CollapsibleSidebar(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: Flex(
                    direction: .horizontal,
                    children: [
                      // FECHA-HORA Y AVISOS
                      Flexible(
                        flex: 70,
                        fit: .tight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Column(
                            mainAxisAlignment: .start,
                            mainAxisSize: .max,
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                'SISTEMA DE REGISTRO',
                                style: TextTheme.of(context).titleSmall?.copyWith(
                                  color: primaryColor,
                                  letterSpacing: 0.35,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '¡Bienvenido!',
                                style: TextTheme.of(context).displayLarge?.copyWith(
                                  color: headingTextColor,
                                  fontSize: 72,
                                  fontWeight: .w900,
                                ),
                              ),
                              const SizedBox(height: 32),
                              Clock(),
                            ],
                          ),
                        ),
                      ),
                      // DIVIDER
                      Center(
                        child: Container(
                          width: 1,
                          height: 600,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: .topCenter,
                              end: .bottomCenter,
                              colors: [
                                Color(0xFFFDDEB0).withAlpha(0),
                                Color(0xFFFDDEB0),
                                Color(0xFFFDDEB0),
                                Color(0xFFFDDEB0).withAlpha(0),
                              ],
                              stops: [0, 0.3, 0.7, 1],
                            ),
                          ),
                        ),
                      ),
                      // LECTOR DE HUELLA
                      Flexible(
                        flex: 30,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Center(
                            child: Column(
                              mainAxisSize: .max,
                              crossAxisAlignment: .center,
                              spacing: 32,
                              children: [
                                Column(
                                  spacing: 8,
                                  children: [
                                    Text(
                                      'Registra tu entrada',
                                      style: TextTheme.of(context).bodyMedium?.copyWith(
                                        color: headingTextColor,
                                        fontSize: 24,
                                        fontWeight: .w700,
                                      ),
                                      textAlign: .center,
                                    ),
                                    Text(
                                      'con tu huella y foto',
                                      style: TextTheme.of(context).bodyMedium?.copyWith(
                                        color: labelTextColor,
                                        fontWeight: .w500,
                                      ),
                                      textAlign: .center,
                                    ),
                                  ],
                                ),
                                FingerprintButton(
                                  viewmodel: viewmodel,
                                ),
                                Text(
                                  'Si tienes problemas con el registro, contacta a Recursos Humanos.',
                                  style: TextTheme.of(context).bodySmall?.copyWith(color: Color(0xFFC4A47A)),
                                  textAlign: .center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
