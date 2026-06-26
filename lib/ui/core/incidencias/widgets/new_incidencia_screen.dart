import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
import 'package:ri_rh_v2/ui/core/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/incidencias/widgets/incidencia_form.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/app_back_button.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';

class NewIncidenciaScreen extends StatelessWidget {
  const NewIncidenciaScreen({
    super.key,
    required this.category,
    required this.viewmodel,
  });

  final IncidenciaCategory category;
  final NewIncidenciaViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, _) {
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
                        Row(
                          spacing: 16,
                          children: [
                            AppBackButton(),
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
                        const SizedBox(height: 40),
                        IncidenciaForm(viewmodel: viewmodel),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
