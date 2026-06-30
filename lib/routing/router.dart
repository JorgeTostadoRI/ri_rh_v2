import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/asistencia_screen.dart';
import 'package:ri_rh_v2/ui/auth/login/viewmodels/login_viewmodel.dart';
import 'package:ri_rh_v2/ui/auth/login/widgets/login_screen.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/avisos_screen.dart';
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
            asistenciaRepository: context.read(),
            authRepository: context.read(),
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.incidencias,
      builder: (context, state) {
        return IncidenciasScreen(
          viewmodel: IncidenciasViewmodel(
            incidenciasRepository: context.read(),
          ),
        );
      },
      routes: [
        GoRoute(
          path: Routes.newIncidencia,
          builder: (context, state) {
            final incidenciasViewmodel = IncidenciasViewmodel(incidenciasRepository: context.read());
            final categoryIndex = incidenciasViewmodel.categories.indexWhere((e) => e.id == state.pathParameters['categoriaId']!);

            if (categoryIndex == -1) {
              return const NotFoundScreen(message: 'Categoría no encontrada');
            }

            return NewIncidenciaScreen(
              category: incidenciasViewmodel.categories[categoryIndex],
              viewmodel: NewIncidenciaViewmodel(
                authRepository: authRepository,
                incidenciasRepository: context.read(),
              ),
            );
          }
        ),
      ],
    ),
    GoRoute(
      path: Routes.avisos,
      builder: (context, state) {
        return const AvisosScreen();
      },
    ),
  ],
);
