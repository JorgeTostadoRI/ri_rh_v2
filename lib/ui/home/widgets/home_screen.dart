import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/elevated_container.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/notification_viewmodel.dart';
import 'package:ri_rh_v2/ui/home/viewmodels/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.viewmodel,
  });

  final HomeViewmodel viewmodel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewmodel.updateRole.addListener(_onUpdatedRole);
    widget.viewmodel.updateDepartment.addListener(_onUpdatedDepartment);
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewmodel.updateRole.removeListener(_onUpdatedRole);
    widget.viewmodel.updateRole.addListener(_onUpdatedRole);
    widget.viewmodel.updateDepartment.removeListener(_onUpdatedDepartment);
    widget.viewmodel.updateDepartment.addListener(_onUpdatedDepartment);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: ListenableBuilder(
          listenable: widget.viewmodel,
          builder: (context, _) {
            final user = widget.viewmodel.getUser();
            late final String initials;
            if (user != null) {
              final parts = user.nombre.trim().split(RegExp(r'\s+'));
              initials = parts.map((part) => part.substring(0, 1)).take(2).join();
            } else {
              initials = '?';
            }

            return Padding(
              padding: const EdgeInsets.all(48),
              child: SizedBox(
                width: 400,
                child: ElevatedContainer(
                  child: Column(
                    spacing: 24,
                    children: [
                      if (user != null)
                        Row(
                          spacing: 24,
                          children: [
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              child: Text(
                                initials.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(user.nombre, style: textTheme.headlineMedium),
                                  Text(
                                    '${user.rol?.capitalize() ?? "Sin rol"} - ${user.departamento?.nombre ?? "Sin departamento"}',
                                    style: textTheme.labelLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ListenableBuilder(
                        listenable: widget.viewmodel.updateRole,
                        builder: (context, _) {
                          final running = widget.viewmodel.updateRole.running;

                          return DropdownButtonFormField<String?>(
                            decoration: InputDecoration(
                              labelText: 'Rol',
                              hintText: 'Selecciona un rol',
                              prefixIcon: running
                                ? Icon(LucideIcons.loaderCircle)
                                : Icon(LucideIcons.user),
                            ),
                            initialValue: user?.rol,
                            items: [
                              DropdownMenuItem(
                                value: 'OPERADOR',
                                child: Text('Operador'),
                              ),
                              DropdownMenuItem(
                                value: 'LIDER',
                                child: Text('Lider'),
                              ),
                            ],
                            onChanged: (role) {
                              if (role != null) {
                                widget.viewmodel.updateRole.execute(role);
                              }
                            },
                          );
                        }
                      ),
                      ListenableBuilder(
                        listenable: widget.viewmodel.updateDepartment,
                        builder: (context, _) {
                          final running = widget.viewmodel.updateDepartment.running;

                          return DropdownButtonFormField<Departamento?>(
                            decoration: InputDecoration(
                              labelText: 'Departamento',
                              hintText: 'Selecciona un departamento',
                              prefixIcon: running
                                ? Icon(LucideIcons.loaderCircle)
                                : Icon(LucideIcons.building2),
                            ),
                            initialValue: user?.departamento,
                            items: user?.departamentosPermitidos
                            .map(
                              (Departamento dep) => DropdownMenuItem(
                                value: dep,
                                child: Text(dep.nombre),
                              )
                            ).toList() ?? [],
                            onChanged: (department) {
                              if (department != null) {
                                widget.viewmodel.updateDepartment.execute(department);
                              }
                            },
                          );
                        }
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                widget.viewmodel.logout.execute();
                                final notificationVM = context.read<NotificationViewmodel>();
                                notificationVM.clear.execute(); // clear notification counters
                              },
                              icon: Icon(LucideIcons.logOut),
                              label: Text('Cerrar sesión'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  void _onUpdatedRole() {
    if (widget.viewmodel.updateRole.completed) {
      widget.viewmodel.updateRole.clearResult();
      context.read<NotificationViewmodel>().load.execute();
    }
  }

  void _onUpdatedDepartment() {
    if (widget.viewmodel.updateDepartment.completed) {
      widget.viewmodel.updateDepartment.clearResult();
      context.read<NotificationViewmodel>().load.execute();
    }
  }
}

// Source - https://stackoverflow.com/a/60528001
// Posted by Hannah Stark, modified by community. See post 'Timeline' for change history
// Retrieved 2026-08-25, License - CC BY-SA 4.0

extension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}
