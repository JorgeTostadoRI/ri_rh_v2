import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/pending_incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_approve_dialog.dart';

class PendingIncidenciasScreen extends StatelessWidget {
  const PendingIncidenciasScreen({
    super.key,
    required this.viewmodel,
  });

  final PendingIncidenciasViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    final yMd = DateFormat.yMd();
    final textTheme = TextTheme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          spacing: 32,
          crossAxisAlignment: .start,
          children: [
            PageHeader(
              title: 'Solicitudes de Incidencias pendientes',
              subtitle: 'Revisa tus solicitudes pendientes de revisión.',
              showBackButton: true,
            ),
            ListenableBuilder(
              listenable: viewmodel.load,
              builder: (context, _) {
                if (viewmodel.load.running) {
                  return Center(child: CircularProgressIndicator());
                }

                if (viewmodel.load.error) {
                  return Center(
                    child: Column(
                      children: [
                        Text('No se pudieron cargar las incidencias.'),
                        Text(
                          viewmodel.load.result.toString(),
                          style: TextStyle(color: errorColor),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => viewmodel.load.execute(),
                          icon: Icon(LucideIcons.rotateCcw),
                          label: Text('Reintentar'),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: viewmodel.pendingToReview!.length,
                  itemBuilder: (context, index) {
                    final incidencia = viewmodel.pendingToReview![index];
                    return ListTile(
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text('${incidencia.categoryName} #${incidencia.id}', style: textTheme.headlineSmall),
                      subtitle: Text(
                        incidencia.reason,
                        style: textTheme.labelMedium,
                        overflow: .ellipsis,
                      ),
                      trailing: Text(
                        yMd.format(incidencia.start.toLocal()),
                        style: textTheme.labelMedium,
                      ),
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return IncidenciaApproveDialog(
                              incidencia: incidencia,
                            );
                          }
                        );
                      }
                    );
                  },
                  separatorBuilder: (context, _) => SizedBox(height: 12),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}