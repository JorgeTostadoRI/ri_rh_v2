import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/color_icon.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/notification_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_category_card.dart';

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
            _PendingReviewNotification(),
            const SizedBox(height: 32),
            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: .start,
                children: [
                  IncidenciaCategoryCard(
                    category: IncidenciaCategory.permiso,
                    icon: LucideIcons.fileText,
                    description: "Solicitar permiso de ausencia justificada",
                    color: Color(0xFFE87B1E),
                    bg: Color(0xFFFFF0DC),
                  ),
                  IncidenciaCategoryCard(
                    category: IncidenciaCategory.horasextra,
                    icon: LucideIcons.clock,
                    description: "Reportar tiempo adicional trabajado",
                    color: Color(0xFF2E8B57),
                    bg: Color(0xFFEDF7F1),
                  ),
                  IncidenciaCategoryCard(
                    category: IncidenciaCategory.vacaciones,
                    icon: LucideIcons.palmtree,
                    description: "Solicitar periodo vacacional",
                    color: Color(0xFF1A7ABF),
                    bg: Color(0xFFEBF4FB),
                  ),
                  IncidenciaCategoryCard(
                    category: IncidenciaCategory.incapacidad,
                    icon: LucideIcons.stethoscope,
                    description: "Registra tu incapacidad impartida por el IMSS",
                    color: Color(0xFF1E8A9A),
                    bg: Color(0xFFEBF7F9),
                  ),
                  IncidenciaCategoryCard(
                    category: IncidenciaCategory.requerimientojudicial,
                    icon: LucideIcons.scroll,
                    description: "Registra tu requerimiento por parte de un juez",
                    color: Color(0xFF2E8B57),
                    bg: Color(0xFFEDF7F1),
                  ),
                  IncidenciaCategoryCard(
                    category: IncidenciaCategory.falta,
                    icon: LucideIcons.userX,
                    description: "Registro de inasistencias",
                    color: Color(0xFFD94F3D),
                    bg: Color(0xFFFEF0EE),
                  ),
                  IncidenciaCategoryCard(
                    category: IncidenciaCategory.retardo,
                    icon: LucideIcons.alarmClock,
                    description: "Registro de llegadas tardías",
                    color: Color(0xFFC4820A),
                    bg: Color(0xFFFEF8E7),
                  ),
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
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final notificationVM = context.watch<NotificationViewmodel>();

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
        child: ListenableBuilder(
          listenable: notificationVM,
          builder: (context, _) {
            final int count = notificationVM.pendingIncidenciasToReview;
            final bool hasNotifications = count > 0;

            return Row(
              spacing: 12,
              children: [
                if (hasNotifications)
                  ...[

                    ColorIcon(
                      icon: LucideIcons.clock,
                      width: 36,
                      height: 36,
                      backgroundColor:const Color(0xFFFDDCB0),
                      shape: BoxShape.circle,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Tienes ',
                        style: textTheme.labelLarge?.copyWith(fontWeight: .w600),
                        children: [
                          TextSpan(
                            text: pendingCountText(notificationVM.pendingIncidenciasToReview),
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                if (!hasNotifications)
                  Text(
                    'Revisar historial de incidencias',
                    style: textTheme.labelLarge?.copyWith(fontWeight: .w600),
                  ),
                Spacer(),
                IconButton.filled(
                  onPressed: () => context.push(
                    Routes.pendingIncidencias,
                  ),
                  icon: Icon(LucideIcons.arrowRight),
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  String pendingCountText(int count) {
    if (count == 1) {
      return '$count solicitud pendiente de revisión';
    } else {
      return '$count solicitudes pendientes de revisión';
    }
  }
}