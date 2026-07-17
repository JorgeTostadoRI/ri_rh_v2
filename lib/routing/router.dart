import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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
import 'package:ri_rh_v2/ui/empleados/viewmodels/expediente_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/huellas_empleado_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/empleados_screen.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/expediente_screen.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/huellas_empleado_screen.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencias_screen.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/new_incidencia_screen.dart';
import 'package:ri_rh_v2/ui/core/ui/not_found_screen.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
  initialLocation: Routes.ingreso,
  debugLogDiagnostics: true,
  refreshListenable: authRepository,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.login,
          builder: (context, state) {
            return LoginScreen(
              viewmodel: LoginViewmodel(authRepository: context.read()),
            );
          }
        ),
        GoRoute(
          path: Routes.ingreso,
          builder: (context, state) {
            return AsistenciaScreen(
              viewmodel: AsistenciaViewmodel(
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
              viewmodel: IncidenciasViewmodel(),
            );
          },
          routes: [
            GoRoute(
              path: Routes.newIncidencia,
              builder: (context, state) {
                final incidenciasViewmodel = IncidenciasViewmodel();
                final categoryIndex = incidenciasViewmodel.categories.indexWhere((e) => e.id == state.pathParameters['categoriaId']!);

                if (categoryIndex == -1) {
                  return const NotFoundScreen(message: 'Categoría no encontrada');
                }

                return NewIncidenciaScreen(
                  category: incidenciasViewmodel.categories[categoryIndex],
                  viewmodel: NewIncidenciaViewmodel(
                    authRepository: authRepository,
                    incidenciasRepository: context.read(),
                    fingerprintRepository: context.read(),
                  ),
                );
              }
            ),
          ],
        ),
        GoRoute(
          path: Routes.avisos,
          builder: (context, state) {
            return AvisosScreen(
              viewmodel: AvisosViewmodel(
                avisosRepository: context.read(),
                authRepository: context.read(),
              ),
            );
          },
        ),
        GoRoute(
          path: Routes.empleados,
          builder: (context, state) {
            final viewmodel = EmpleadosViewmodel(empleadosRepository: context.read());

            return EmpleadosScreen(
              viewmodel: viewmodel,
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

                return ExpedienteScreen(
                  viewmodel: ExpedienteViewmodel(
                    empleadoId: empleadoId,
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

                    return HuellasEmpleadoScreen(
                      viewmodel: HuellasEmpleadoViewmodel(
                        empleadoId: empleadoId,
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
      ],
    ),
  ],
);
