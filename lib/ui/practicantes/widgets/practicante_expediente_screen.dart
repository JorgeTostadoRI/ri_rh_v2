import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/expediente_files.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/expediente_form.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicante_expediente_viewmodel.dart';

class PracticanteExpedienteScreen extends StatefulWidget {
  const PracticanteExpedienteScreen({
    super.key,
    required this.viewmodel,
  });

  final PracticanteExpedienteViewmodel viewmodel;

  @override
  State<PracticanteExpedienteScreen> createState() => _PracticanteExpedienteScreenState();
}

class _PracticanteExpedienteScreenState extends State<PracticanteExpedienteScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, _) {
            if (widget.viewmodel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (widget.viewmodel.load.error) {
              return Center(
                child: Column(
                  children: [
                    Text(widget.viewmodel.load.result.toString()),
                    ElevatedButton(
                      onPressed: () => widget.viewmodel.load.execute(),
                      child: Text('Reintentar'),
                    ),
                  ],
                ),
              );
            }

            final practicante = widget.viewmodel.practicante;
            return Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                PageHeader(
                  title: 'Expediente Digital',
                  subtitle: practicante.base.nombre,
                  showBackButton: true,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: ExpedienteForm(
                        baseEmpleado: practicante.base,
                        readOnly: true,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: .stretch,
                        children: [
                          ExpedienteFiles(
                            files: practicante.base.files,
                            altaPracticante: practicante.alta,
                          ),
                          Badge(
                            backgroundColor: statusWarningColor,
                            label: const Text('!'),
                            isLabelVisible: practicante.status == StatusPracticante.alta && !practicante.base.hasSignature,
                            child: IconCard(
                              icon: LucideIcons.fingerprintPattern,
                              title: 'Huellas',
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.go(Routes.huellasOfPracticante(practicante));
                                  },
                                  child: Text('Ver')
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
