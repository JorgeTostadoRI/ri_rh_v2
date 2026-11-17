import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/data/services/shared_preferences_service.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';
import 'package:ri_rh_v2/ui/core/ui/main_scaffold.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/notification_viewmodel.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Usuario no RH sin sesión cargada: el menú muestra Inicio, Ingreso, Avisos
/// e Incidencias, y NotificationViewmodel no consulta nada.
class _FakeAuth extends AuthRepository {
  @override
  Future<bool> get isAuthenticated => Future.value(true);
  @override
  Future<bool> get isRH => Future.value(false);
  @override
  User? getCurrentUser() => null;
  @override
  Future<Result<User>> login({required String username, required String password}) =>
      throw UnimplementedError();
  @override
  Future<Result<User>> loginViaChallenge(String username) => throw UnimplementedError();
  @override
  Future<Result<void>> logout() => throw UnimplementedError();
  @override
  Future<Result<void>> updateRole(String role) => throw UnimplementedError();
  @override
  Future<Result<void>> updateDepartment(Departamento department) => throw UnimplementedError();
}

// Con getCurrentUser() == null, NotificationViewmodel no usa ninguno.
class _NoUsadoIncidencias implements IncidenciasRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _NoUsadoEmpleados implements EmpleadosRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _NoUsadoVacantes implements VacantesRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _NoUsadoLog implements AppLogger {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

/// Sin sesión guardada: el botón "Avisos de requisiciones y órdenes" del
/// menú no consulta al servidor durante las pruebas.
class _SinToken extends SharedPreferencesService {
  _SinToken() : super(log: _NoUsadoLog());
  @override
  Future<Result<String?>> fetchToken() async => const Result.ok(null);
}

Future<void> _abrir(WidgetTester tester, {required bool esMovil, Size size = const Size(390, 844)}) async {
  debugNavegadorMovil = esMovil;
  addTearDown(() => debugNavegadorMovil = null);
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final auth = _FakeAuth();
  final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(path: Routes.home, builder: (_, _) => const Text('pantalla inicio')),
          GoRoute(path: Routes.avisos, builder: (_, _) => const Text('pantalla avisos')),
        ],
      ),
    ],
  );
  addTearDown(router.dispose);

  await tester.pumpWidget(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthRepository>.value(value: auth),
      Provider<SharedPreferencesService>.value(value: _SinToken()),
      ChangeNotifierProvider(
        create: (_) => NotificationViewmodel(
          log: _NoUsadoLog(),
          authRepository: auth,
          incidenciasRepository: _NoUsadoIncidencias(),
          empleadosRepository: _NoUsadoEmpleados(),
          vacantesRepository: _NoUsadoVacantes(),
        ),
      ),
    ],
    child: MaterialApp.router(
      routerConfig: router,
      // La letra de pruebas (Ahem) es mucho más ancha que la real y
      // "Recursos Humanos" no cabría en los 240 px del menú; se achica solo aquí.
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(0.6)),
        child: child!,
      ),
    ),
  ));
  await tester.pumpAndSettle();
}

void main() {
  test('solo es móvil en el navegador de Android o iPhone', () {
    for (final plataforma in TargetPlatform.values) {
      final esTelefono = plataforma == TargetPlatform.android || plataforma == TargetPlatform.iOS;
      expect(esNavegadorMovilPara(esWeb: true, plataforma: plataforma), esTelefono, reason: '$plataforma web');
      // La app de Windows (y cualquier app que no sea web) nunca es móvil.
      expect(esNavegadorMovilPara(esWeb: false, plataforma: plataforma), isFalse, reason: '$plataforma app');
    }
  });

  testWidgets('computadora: menú lateral fijo como siempre, sin barra ☰', (tester) async {
    // Aunque la ventana sea angosta, en computadora no cambia nada.
    await _abrir(tester, esMovil: false, size: const Size(390, 844));

    expect(find.byType(AppBar), findsNothing);
    expect(find.byType(Drawer), findsNothing);
    expect(find.byType(CollapsibleSidebar), findsOneWidget);
    expect(find.text('Avisos'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget); // botón de colapsar
  });

  final avisosCompras = find.byTooltip('Avisos de requisiciones y órdenes');

  testWidgets('app de Windows: sin el botón de avisos de compras y sin franja', (tester) async {
    // Las pruebas corren como app de escritorio (no navegador).
    await _abrir(tester, esMovil: false, size: const Size(1366, 768));

    expect(find.text('Recursos Humanos'), findsOneWidget);
    expect(avisosCompras, findsNothing);
    // El contenido empieza hasta arriba, como siempre.
    expect(tester.getTopLeft(find.text('pantalla inicio')).dy, 0);
  });

  testWidgets('web de computadora: avisos de compras en una franja arriba a la derecha', (tester) async {
    debugEsWeb = true;
    addTearDown(() => debugEsWeb = null);
    await _abrir(tester, esMovil: false, size: const Size(1366, 768));

    expect(avisosCompras, findsOneWidget);
    final boton = tester.getRect(avisosCompras);
    expect(boton.right, closeTo(1366 - 16, 4)); // el botón mide 40 dentro de su área de 48
    expect(boton.top, closeTo(12, 4));
    // Fuera del menú, y el contenido empieza abajo del botón (no se enciman).
    expect(find.descendant(of: find.byType(CollapsibleSidebar), matching: avisosCompras), findsNothing);
    expect(tester.getTopLeft(find.text('pantalla inicio')).dy, greaterThanOrEqualTo(boton.bottom));
  });

  testWidgets('celular: menú oculto tras ☰, se abre encima y se cierra al navegar', (tester) async {
    await _abrir(tester, esMovil: true);

    // El contenido ocupa todo el ancho; el menú no se ve hasta tocar ☰.
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(CollapsibleSidebar), findsNothing);
    expect(tester.getSize(find.text('pantalla inicio')).width, greaterThan(0));
    // Avisos de compras a la derecha de la barra de arriba.
    expect(find.descendant(of: find.byType(AppBar), matching: avisosCompras), findsOneWidget);
    expect(tester.getRect(avisosCompras).right, greaterThan(390 - 60));

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    expect(find.byType(CollapsibleSidebar), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back_ios), findsNothing); // sin botón de colapsar

    await tester.tap(find.text('Avisos'));
    await tester.pumpAndSettle();
    expect(find.text('pantalla avisos'), findsOneWidget);
    expect(find.byType(CollapsibleSidebar), findsNothing); // el menú se cerró
  });
}
