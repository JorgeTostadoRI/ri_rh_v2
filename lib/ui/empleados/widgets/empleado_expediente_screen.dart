import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleado_expediente_viewmodel.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/expediente_files.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/expediente_form.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/horario_card.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

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
        padding: EdgeInsets.all(esNavegadorMovil ? 16 : 40),
        child: ListenableBuilder(
          listenable: Listenable.merge([
            widget.viewmodel.load,
            widget.viewmodel.loadHorarios,
            widget.viewmodel.loadJefes,
          ]),
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
            final datos = ExpedienteForm(
              baseEmpleado: empleado.base,
              readOnly: true,
              jefeCandidates: widget.viewmodel.jefes,
              assignJefe: widget.viewmodel.assignJefe,
            );
            final lateral = [
              ExpedienteFiles(
                files: empleado.base.files,
                altaEmpleo: empleado.alta,
              ),
              HorarioCard(
                horarios: widget.viewmodel.horarios,
                selectedHorarioId: empleado.base.user?.horarioId,
                userNombre: empleado.base.nombre,
                assignHorario: widget.viewmodel.assignHorario,
                createCustomHorario: widget.viewmodel.createCustomHorario,
                loadingHorarios: widget.viewmodel.loadHorarios.running,
                hasUser: empleado.base.user != null,
              ),
              Badge(
                backgroundColor: statusWarningColor,
                label: const Text('!'),
                isLabelVisible: empleado.estatus == EmpleadoEstatus.activo && !empleado.base.hasSignature,
                child: IconCard(
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
              ),
            ];

            return Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                PageHeader(
                  title: 'Expediente Digital', 
                  subtitle: empleado.base.nombre,
                  showBackButton: true,
                ),
                SizedBox(height: esNavegadorMovil ? 16 : 32),
            // Navegador de celular: con la columna derecha a 1/4 del ancho
            // Documentación, Horario y Huellas quedarían de ~75 px. Va todo
            // en una columna: primero los datos y abajo lo de la derecha.
                if (esNavegadorMovil)
                  Column(
                    crossAxisAlignment: .stretch,
                    children: [datos, ...lateral],
                  )
                else
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: datos,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: .stretch,
                          children: lateral,
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
