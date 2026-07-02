import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class MotdList extends StatelessWidget {
  const MotdList({
    super.key,
    required this.viewmodel,
  });

  final AsistenciaViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewmodel.load,
      builder: (context, _) {
        if (viewmodel.load.error) {
          return Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 32),
              Text('No se pudieron cargar los avisos de hoy'),
            ],
          );
        }
    
        if (viewmodel.load.completed) {
          return Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 32),
              Row(
                spacing: 8,
                mainAxisSize: .min,
                children: [
                  Icon(
                    LucideIcons.bell,
                    color: primaryColor,
                    size: 18,
                  ),
                  Text(
                    'Avisos del día',
                    style: TextTheme.of(context).labelLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: .w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              for (final motd in viewmodel.motds)
                Card(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(LucideIcons.info, color: primaryColor),
                    ),
                    title: Text(
                      motd.content,
                      style: TextTheme.of(context).bodyMedium?.copyWith(
                        fontWeight: .w700,
                      ),
                    ),
                  ),
                ),
            ],
          );
        }
    
        return SizedBox.shrink();
      },
    );
  }
}