import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/config/incidencia_categories.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/asistencia_screen.dart';
import 'package:ri_rh_v2/ui/auth/login/viewmodels/login_viewmodel.dart';
import 'package:ri_rh_v2/ui/auth/login/widgets/login_screen.dart';
import 'package:ri_rh_v2/ui/avisos/viewmodels/avisos_viewmodel.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/avisos_screen.dart';
import 'package:ri_rh_v2/ui/core/ui/main_scaffold.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleados_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleado_expediente_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleado_huellas_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/empleados_screen.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/empleado_expediente_screen.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/empleado_huellas_screen.dart';
import 'package:ri_rh_v2/ui/home/viewmodels/home_viewmodel.dart';
import 'package:ri_rh_v2/ui/home/widgets/home_screen.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/pending_incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencias_screen.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/new_incidencia_screen.dart';
import 'package:ri_rh_v2/ui/core/ui/not_found_screen.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/pending_incidencias_screen.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicante_expediente_viewmodel.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicante_huellas_viewmodel.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicantes_viewmodel.dart';
import 'package:ri_rh_v2/ui/practicantes/widgets/practicante_expediente_screen.dart';
import 'package:ri_rh_v2/ui/practicantes/widgets/practicante_huellas_screen.dart';
import 'package:ri_rh_v2/ui/practicantes/widgets/practicantes_screen.dart';
import 'package:ri_rh_v2/ui/reportes/viewmodels/reporte_asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/reportes/widgets/reporte_asistencia_screen.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  refreshListenable: authRepository,
  redirect: _redirect,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            return HomeScreen(
              viewmodel: HomeViewmodel(authRepository: context.read()),
            );
          }
        ),
        GoRoute(
          path: Routes.login,
          builder: (context, state) {
            return LoginScreen(
              viewmodel: LoginViewmodel(
                log: context.read(),
                authRepository: context.read(),
              ),
            );
          }
        ),
        GoRoute(
          path: Routes.ingreso,
          builder: (context, state) {
            return AsistenciaScreen(
              viewmodel: AsistenciaViewmodel(
                log: context.read(),
                authRepository: context.read(),
                asistenciaRepository: context.read(),
                avisosRepository: context.read(),
                fingerprintRepository: context.read(),
              ),
            );
          },
        ),
        GoRoute(
          path: Routes.incidencias,
          builder: (context, state) {
            return IncidenciasScreen(
              viewmodel: IncidenciasViewmodel(
                log: context.read(),
                authRepository: context.read(),
                incidenciasRepository: context.read(),
              ),
            );
          },
          routes: [
            GoRoute(
              path: Routes.newIncidencia,
              builder: (context, state) {
                final categoryIndex = incidenciaCategories.indexWhere((category) => category.id == state.pathParameters['categoriaId']!);

                if (categoryIndex == -1) {
                  return const NotFoundScreen(message: 'Categoría no encontrada');
                }

                return NewIncidenciaScreen(
                  category: incidenciaCategories[categoryIndex],
                  viewmodel: NewIncidenciaViewmodel(
                    log: context.read(),
                    authRepository: context.read(),
                    incidenciasRepository: context.read(),
                    fingerprintRepository: context.read(),
                  ),
                );
              }
            ),
          ],
        ),
        GoRoute(
          path: Routes.pendingIncidencias,
          builder: (context, state) {
            return PendingIncidenciasScreen(
              viewmodel: PendingIncidenciasViewmodel(
                log: context.read(),
                incidenciasRepository: context.read(),
              ),
            );
          },
        ),
        GoRoute(
          path: Routes.avisos,
          builder: (context, state) {
            return AvisosScreen(
              viewmodel: AvisosViewmodel(
                log: context.read(),
                avisosRepository: context.read(),
                authRepository: context.read(),
              ),
            );
          },
        ),
        GoRoute(
          path: Routes.empleados,
          builder: (context, state) {
            return EmpleadosScreen(
              viewmodel: EmpleadosViewmodel(
                log: context.read(),
                empleadosRepository: context.read(),
              ),
            );
          },
          routes: [
            GoRoute(
              path: Routes.expedienteEmpleado,
              builder: (context, state) {
                final empleadoId = int.tryParse(state.pathParameters['empleadoId']!);
                if (empleadoId == null) {
                  return const NotFoundScreen(message: 'Empleado no encontrado');
                }

                return EmpleadoExpedienteScreen(
                  viewmodel: EmpleadoExpedienteViewmodel(
                    empleadoId: empleadoId,
                    log: context.read(),
                    empleadosRepository: context.read(),
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: Routes.huellas,
                  builder: (context, state) {
                    final empleadoId = int.tryParse(state.pathParameters['empleadoId']!);
                    if (empleadoId == null) {
                      return const NotFoundScreen(message: 'Empleado no encontrado');
                    }

                    return EmpleadoHuellasScreen(
                      viewmodel: EmpleadoHuellasViewmodel(
                        empleadoId: empleadoId,
                        log: context.read(),
                        empleadosRepository: context.read(),
                        fingerprintRepository: context.read(),
                      ),
                    );
                  }
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: Routes.practicantes,
          builder: (context, state) {
            return PracticantesScreen(
              viewmodel: PracticantesViewmodel(
                log: context.read(),
                practicantesRepository: context.read(),
              ),
            );
          },
          routes: [
            GoRoute(
              path: Routes.expedientePracticante,
              builder: (context, state) {
                final practicanteId = int.tryParse(state.pathParameters['practicanteId']!);
                if (practicanteId == null) {
                  return const NotFoundScreen(message: 'Practicante no encontrado');
                }

                return PracticanteExpedienteScreen(
                  viewmodel: PracticanteExpedienteViewmodel(
                    practicanteId: practicanteId,
                    log: context.read(),
                    practicantesRepository: context.read(),
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: Routes.huellas,
                  builder: (context, state) {
                    final practicanteId = int.tryParse(state.pathParameters['practicanteId']!);
                    if (practicanteId == null) {
                      return const NotFoundScreen(message: 'Practicante no encontrado');
                    }

                    return PracticanteHuellasScreen(
                      viewmodel: PracticanteHuellasViewmodel(
                        practicanteId: practicanteId,
                        log: context.read(),
                        practicantesRepository: context.read(),
                        fingerprintRepository: context.read(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: Routes.reportes,
          builder: (context, state) {
            return ReporteAsistenciaScreen(
              viewmodel: ReporteAsistenciaViewmodel(
                log: context.read(),
                reportesRepository: context.read(),
              ),
            );
          }
        ),
      ],
    ),
  ],
);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final isRH = await context.read<AuthRepository>().isRH;
  final loggingIn = state.matchedLocation == Routes.login;
  
  // redirect if the user is not logged in and trying to access a protected route
  if (!loggedIn) {
    if (_requiresLogin(state.uri.toString())) {
      return Routes.login;
    }
    return null;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return Routes.home;
  }

  if (_requiresRole(state.uri.toString()) && !isRH) {
    return Routes.home;
  }

  // no need to redirect at all
  return null;
}

bool _requiresLogin(String location) {
  final uri = Uri.parse(location);
  final path = uri.path;

  if (path == Routes.home) return true;
  if (path.startsWith(Routes.empleados)) return true;
  if (path.startsWith(Routes.practicantes)) return true;
  if (path.startsWith(Routes.reportes)) return true;

  return false;
}

bool _requiresRole(String location) {
  final uri = Uri.parse(location);
  final path = uri.path;

  if (path.startsWith(Routes.empleados)) return true;
  if (path.startsWith(Routes.practicantes)) return true;

  return false;
}