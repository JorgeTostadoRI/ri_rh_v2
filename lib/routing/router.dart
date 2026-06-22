import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/asistencia/widgets/asistencia_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.ingreso,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.ingreso,
      builder: (context, state) {
        return AsistenciaScreen(
          viewmodel: AsistenciaViewmodel(asistenciaRepository: context.read()),
        );
      },
    ),
  ],
);
