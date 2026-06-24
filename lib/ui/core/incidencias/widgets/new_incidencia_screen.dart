import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
import 'package:ri_rh_v2/ui/core/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/incidencias/widgets/incidencia_form.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
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
                            BackButton(),
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

class BackButton extends StatefulWidget {
  const BackButton({super.key});

  @override
  State<BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButton> {
  bool _hovering = false;

  Color get buttonColor => _hovering ? Colors.white70 : backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(
              color: Color(0xFFF5E8D8),
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            LucideIcons.arrowLeft,
            color: Color(0xFF9A7B5A),
          ),
        ),
      ),
    );
  }
}
