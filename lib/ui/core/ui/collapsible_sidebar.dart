import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/notification_viewmodel.dart';

class CollapsibleSidebar extends StatefulWidget {
  const CollapsibleSidebar({super.key});

  @override
  State<CollapsibleSidebar> createState() => _CollapsibleSidebarState();
}

class _CollapsibleSidebarState extends State<CollapsibleSidebar> {
  final Color backgroundColor = Colors.white;
  final Color dividerColor = Color(0xFFF5E8D8);
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.watch<AuthRepository>().isAuthenticated;
    final isRH = context.watch<AuthRepository>().isRH;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ? 70 : 240,
      color: backgroundColor,
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Toggle Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: isCollapsed ? .center : .start,
              children: [
                FutureBuilder(
                  future: isAuthenticated,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        // is authenticated
                        if (snapshot.data!) {
                          return InkWell(
                            mouseCursor: SystemMouseCursors.click,
                            onTap: () => context.go(Routes.home),
                            child: Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: SvgPicture.asset('assets/icons/layout_grid.svg', width: 30, height: 30),
                            ),
                          );
                        } else {
                          return InkWell(
                            mouseCursor: SystemMouseCursors.click,
                            onTap: () => context.go(Routes.login),
                            child: Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: SvgPicture.asset('assets/icons/layout_grid.svg', width: 30, height: 30),
                            ),
                          );
                        }
                      }
                    }

                    return Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: SvgPicture.asset('assets/icons/layout_grid.svg', width: 30, height: 30),
                    );
                  }
                ),
                if (!isCollapsed) ...[
                  const SizedBox(width: 10),
                  Text(
                    'Recursos Humanos',
                    style: TextTheme.of(context).titleSmall?.copyWith(
                      color: Color(0xFF9A7B5A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ],
            ),
          ),
          Divider(color: dividerColor),
          // Navigation Items
          FutureBuilder(
            future: isRH,
            builder: (context, snapshot) {
              // RH user sidebar
              if (snapshot.hasData) {
                if (snapshot.data == true) {
                  return Column(
                    children: [
                      _NavItem(
                        icon: LucideIcons.clock,
                        label: 'Ingreso',
                        route: Routes.ingreso,
                        isCollapsed: isCollapsed,
                      ),
                      _NavItem(
                        icon: LucideIcons.megaphone,
                        label: 'Avisos',
                        route: Routes.avisos,
                        isCollapsed: isCollapsed,
                      ),
                      _NavItem(
                        icon: LucideIcons.users,
                        label: 'Empleados',
                        route: Routes.empleados,
                        isCollapsed: isCollapsed,
                      ),
                      _NavItem(
                        icon: LucideIcons.school,
                        label: 'Practicantes',
                        route: Routes.practicantes,
                        isCollapsed: isCollapsed,
                      ),
                      _NavItem(
                        icon: LucideIcons.alertCircle,
                        label: 'Incidencias',
                        route: Routes.incidencias,
                        isCollapsed: isCollapsed,
                        trailing: _IncidenciaCountBadge(),
                      ),
                      _NavItem(
                        icon: LucideIcons.clipboardList,
                        label: 'Reportes',
                        route: Routes.reportes,
                        isCollapsed: isCollapsed,
                      ),
                    ],
                  );
                }
              }

              return Column(
                children: [
                  _NavItem(
                    icon: LucideIcons.clock,
                    label: 'Ingreso',
                    route: Routes.ingreso,
                    isCollapsed: isCollapsed,
                  ),
                  _NavItem(
                    icon: LucideIcons.megaphone,
                    label: 'Avisos',
                    route: Routes.avisos,
                    isCollapsed: isCollapsed,
                  ),
                  _NavItem(
                    icon: LucideIcons.alertCircle,
                    label: 'Incidencias',
                    route: Routes.incidencias,
                    isCollapsed: false,
                    trailing: _IncidenciaCountBadge(),
                  ),
                ],
              );
            },
          ),
          Spacer(),
          IconButton.outlined(
            icon: Icon(
              isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
              color: primaryColor,
              size: 12,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(
              backgroundColor: backgroundColor,
              side: BorderSide(color: Color(0xFFFDDEB0)),
            ),
            onPressed: () => setState(() => isCollapsed = !isCollapsed),
          ),
        ],
      ),
  );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.isCollapsed,
    this.trailing,
  });

  final IconData icon;
  final String label;
  final String route;
  final bool isCollapsed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final fullPath = state.fullPath ?? '';
    final Color textColor = Color(0xFF9A7B5A);
    final selected = fullPath.startsWith(route);

    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: selected ? Colors.white : primaryColor,
            size: 20,
          ),
          title: isCollapsed 
              ? null 
              : Text(
                  label,
                  style: TextTheme.of(context).labelLarge?.copyWith(
                    color: selected ? Colors.white : textColor,
                  ),
                ),
          trailing: isCollapsed ? null : trailing,
          selected: selected,
          tileColor: Colors.white,
          selectedTileColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
          ),
          onTap: () => context.go(route),
        ),
      ),
    );
  }
}

class _IncidenciaCountBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<NotificationViewmodel>();

    return ListenableBuilder(
      listenable: viewmodel.load,
      builder: (context, _) {
        if (viewmodel.load.running) {
          return SizedBox.shrink();
        }

        if (viewmodel.load.error) {
          return Tooltip(message: 'No se pudieron cargar las notificaciones de incidencias');
        }

        if (viewmodel.pendingIncidenciasToReview == 0) {
          return SizedBox.shrink();
        }

        return Badge.count(
          count: viewmodel.pendingIncidenciasToReview,
          maxCount: 99,
          backgroundColor: primaryColor,
        );
      }
    );
  }
}