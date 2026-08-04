import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/color_icon.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_card.dart';

class IncidenciasScreen extends StatelessWidget {
  const IncidenciasScreen({
    super.key,
    required this.viewmodel,
  });

  final IncidenciasViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            PageHeader(
              title: 'Incidencias',
              subtitle: 'Selecciona el tipo de incidencia que deseas registrar.',
            ),
            ListenableBuilder(
              listenable: viewmodel.load,
              builder: (context, _) {
                if (viewmodel.load.running || viewmodel.load.error) {
                  return SizedBox.shrink();
                }
                
                return _PendingReviewNotification(viewmodel: viewmodel);
              }
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
    );
  }
}

class _PendingReviewNotification extends StatelessWidget {
  const _PendingReviewNotification({
    required this.viewmodel,
  });

  final IncidenciasViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    if ((viewmodel.pendingToReview ?? 0) == 0) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 250, 231, 207),
          border: Border.fromBorderSide(BorderSide(
            color: const Color(0xFFF5CFA0),
            width: 0.8,
          )),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          spacing: 12,
          children: [
            ColorIcon(
              icon: LucideIcons.clock,
              width: 36,
              height: 36,
              backgroundColor: const Color(0xFFFDDCB0),
              shape: BoxShape.circle,
            ),
            Text.rich(
              TextSpan(
                text: 'Tienes ',
                style: textTheme.labelLarge?.copyWith(fontWeight: .w600),
                children: [
                  TextSpan(
                    text: pendingCountText,
                    style: TextStyle(color: primaryColor),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton.filled(
              onPressed: () => context.push(
                Routes.pendingIncidencias,
              ),
              icon: Icon(LucideIcons.arrowRight),
            ),
          ],
        ),
      ),
    );
  }

  String get pendingCountText {
    final count = viewmodel.pendingToReview ?? 0;
    if (count == 1) {
      return '$count solicitud pendiente de revisión';
    } else {
      return '$count solicitudes pendientes de revisión';
    }
  }
}