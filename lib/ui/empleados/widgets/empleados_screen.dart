import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/base_empleado_card.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleados_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/empleado_actions_menu.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/empleado_status_chip.dart';
import 'package:ri_rh_v2/utils/debouncer.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

class EmpleadosScreen extends StatefulWidget {
  const EmpleadosScreen({
    super.key,
    required this.viewmodel,
  });

  final EmpleadosViewmodel viewmodel;

  @override
  State<EmpleadosScreen> createState() => _EmpleadosScreenState();
}

class _EmpleadosScreenState extends State<EmpleadosScreen> {
  late final TextEditingController _search;
  final _debouncer = Debouncer(milliseconds: 500);

  void _performSearch() {
    _debouncer.run(() {
      if (_search.text.compareTo(widget.viewmodel.searchText) == 0) {
        return;
      }
      
      widget.viewmodel.searchText = _search.text;
      widget.viewmodel.load.execute();
    });
  }

  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
    _search.addListener(_performSearch);
  }

  @override
  void didUpdateWidget(covariant EmpleadosScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _search.removeListener(_performSearch);
    _search.addListener(_performSearch);
  }

  @override
  void dispose() {
    _search.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(esNavegadorMovil ? 16 : 40),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            if (esNavegadorMovil)
              _encabezadoMovil(context)
            else
              Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .start,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    spacing: 8,
                    children: [
                      Text(
                        'Listado de Empleados',
                        style: TextTheme.of(context).headlineLarge?.copyWith(
                          fontSize: 48,
                        ),
                      ),
                      Text(
                        'Gestiona y visualiza la información de todo el personal activo.',
                        style: TextTheme.of(context).titleSmall,
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () => context.push('${Routes.empleados}/${Routes.newEmpleado}'),
                    icon: Icon(LucideIcons.userPlus),
                    label: Text('Nuevo Empleado'),
                  ),
                ],
              ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(LucideIcons.search),
                prefixIconColor: context.rh.etiquetaSuave,
              ),
              controller: _search,
            ),
            const SizedBox(height: 32),
            ListenableBuilder(
              listenable: widget.viewmodel.load,
              builder: (context, _) {
                if (widget.viewmodel.load.running) {
                  return const Center(child: CircularProgressIndicator());
                }
            
                if (widget.viewmodel.load.error) {
                  return Center(
                    child: Column(
                      spacing: 32,
                      crossAxisAlignment: .center,
                      children: [
                        const Text('No se pudieron cargar los empleados'),
                        Text(
                          widget.viewmodel.load.result.toString(),
                          style: TextStyle(
                            color: context.rh.error,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => widget.viewmodel.load.execute(),
                          icon: Icon(LucideIcons.rotateCcw),
                          label: Text('Reintentar')
                        ),
                      ],
                    ),
                  );
                }
            
                // Navegador de celular: una tarjeta por fila, del alto que
                // necesite su contenido.
                if (esNavegadorMovil) {
                  return Column(
                    crossAxisAlignment: .stretch,
                    spacing: 16,
                    children: [
                      for (final empleado in widget.viewmodel.empleados) _tarjeta(empleado),
                    ],
                  );
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.viewmodel.empleados.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    mainAxisExtent: 350,
                  ),
                  itemBuilder: (context, index) => _tarjeta(widget.viewmodel.empleados[index]),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget _tarjeta(Empleado empleado) {
    return BaseEmpleadoCard(
      baseEmpleado: empleado.base,
      statusChip: EmpleadoStatusChip(status: empleado.estatus, porAbandono: empleado.bajaPorAbandono),
      onExpedientePressed: () => context.go(Routes.expedienteOfEmpleado(empleado)),
      hasPendingActions: empleado.estatus == EmpleadoEstatus.activo && !empleado.base.hasSignature,
      actionsMenu: EmpleadoActionsMenu(
        empleado: empleado,
        cambiarEstatus: widget.viewmodel.cambiarEstatus,
        regenerarPassword: widget.viewmodel.regenerarPassword,
        revisionAbandono: widget.viewmodel.revisionAbandono,
        bajaPorAbandono: widget.viewmodel.bajaPorAbandono,
      ),
    );
  }

  /// Navegador de celular: el título a 48 junto al botón no cabe; va el
  /// título más chico y el botón abajo, a todo el ancho.
  Widget _encabezadoMovil(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      spacing: 8,
      children: [
        Text(
          'Listado de Empleados',
          style: TextTheme.of(context).headlineLarge?.copyWith(
            fontSize: 32,
          ),
        ),
        Text(
          'Gestiona y visualiza la información de todo el personal activo.',
          style: TextTheme.of(context).titleSmall,
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () => context.push('${Routes.empleados}/${Routes.newEmpleado}'),
          icon: Icon(LucideIcons.userPlus),
          label: Text('Nuevo Empleado'),
        ),
      ],
    );
  }
}