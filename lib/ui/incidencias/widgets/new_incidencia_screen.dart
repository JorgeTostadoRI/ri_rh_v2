import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_form.dart';
import 'package:ri_rh_v2/ui/core/ui/app_back_button.dart';

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
        return SingleChildScrollView(
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
                      style: TextTheme.of(context).headlineLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                IncidenciaForm(viewmodel: viewmodel, category: category),
              ],
            ),
          ),
        );
      }
    );
  }
}
