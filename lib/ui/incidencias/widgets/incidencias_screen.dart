import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_card.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';

class IncidenciasScreen extends StatelessWidget {
  const IncidenciasScreen({
    super.key,
    required this.viewmodel,
  });

  final IncidenciasViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          CollapsibleSidebar(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      spacing: 8,
                      children: [
                        Text(
                          'Incidencias',
                          style: TextTheme.of(context).displayLarge?.copyWith(
                            color: headingTextColor,
                            fontSize: 48,
                            fontWeight: .w900,
                          ),
                        ),
                        Text(
                          'Selecciona el tipo de incidencia que deseas registrar.',
                          style: TextTheme.of(context).labelLarge?.copyWith(
                            color: labelTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: .start,
                        children: [
                          for (final category in viewmodel.categories)
                            IncidenciaCategoryCard(category: category)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}