import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';

class NewIncidenciaScreen extends StatelessWidget {
  const NewIncidenciaScreen({
    super.key,
    required this.category,
  });

  final IncidenciaCategory category;

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
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Nueva Incidencia - ${category.label}',
                      style: TextTheme.of(context).displayLarge?.copyWith(
                        color: headingTextColor,
                        fontSize: 48,
                        fontWeight: .w900,
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