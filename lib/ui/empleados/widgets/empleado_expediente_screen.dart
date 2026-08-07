import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleado_expediente_viewmodel.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/expediente_files.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/expediente_form.dart';

class EmpleadoExpedienteScreen extends StatefulWidget {
  const EmpleadoExpedienteScreen({
    super.key,
    required this.viewmodel,
  });

  final EmpleadoExpedienteViewmodel viewmodel;

  @override
  State<EmpleadoExpedienteScreen> createState() => _EmpleadoExpedienteScreenState();
}

class _EmpleadoExpedienteScreenState extends State<EmpleadoExpedienteScreen> {
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
                      onPressed: () => widget.viewmodel.load.execute(widget.viewmodel.empleadoId),
                      child: Text('Reintentar'),
                    ),
                  ],
                ),
              );
            }

            final empleado = widget.viewmodel.empleado;
            return Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                PageHeader(
                  title: 'Expediente Digital', 
                  subtitle: empleado.base.nombre,
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
                        baseEmpleado: empleado.base,
                        readOnly: true,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(

                        crossAxisAlignment: .stretch,
                        children: [
                          ExpedienteFiles(
                            files: empleado.base.files,
                            altaEmpleo: empleado.alta,
                          ),
                          IconCard(
                            icon: LucideIcons.fingerprintPattern,
                            title: 'Huellas',
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.go(Routes.huellasOfEmpleado(empleado));
                                },
                                child: Text('Ver')
                              ),
                            ],
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
