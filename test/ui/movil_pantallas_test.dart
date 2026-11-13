import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/avisos/avisos_repository.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/repositories/users/users_repository.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/data/repositories/signature/signature_repository.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/download_viewmodel.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/data/services/file_download/file_download_service.dart';
import 'package:ri_rh_v2/data/repositories/horario/horario_repository.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia/incidencia_query.dart';
import 'package:ri_rh_v2/domain/models/query/user/user_query.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/routing/router.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/avisos_calendar.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/avisos_list_view.dart';
import 'package:ri_rh_v2/ui/core/ui/step_timeline.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/auth_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/notification_viewmodel.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Abre las pantallas adaptadas a celular (Login, Ingreso, Ingreso Manual,
/// Incidencias, Nueva incidencia, Inicio, Mis incidencias, Avisos,
/// Solicitudes de Incidencias, las evaluaciones por enlace, las listas de
/// Empleados / Practicantes, sus expedientes y huellas) con el router real, en el tamaño de un celular y en el de una computadora. Si algo no cabe (RenderFlex
/// overflowed), Flutter lo reporta como error y la prueba falla.

final _departamento = Departamento(
  id: 1,
  // Nombre corto: con la letra de pruebas (Ahem) "Recursos Humanos" no cabe
  // en la lista de departamentos aunque con la letra real sí.
  nombre: 'Sistemas',
  descripcion: '',
  presupuesto: 0,
  divisa: Divisa.MXN,
);

final _usuario = User(
  id: 1,
  username: 'prueba',
  nombre: 'María Guadalupe Hernández Villalobos',
  telefono: '',
  correo: '',
  rol: 'LIDER',
  departamento: _departamento,
  departamentosPermitidos: [_departamento],
  liderPermitido: true,
);

/// Sin sesión, o con sesión de un líder con permisos de RH (para Inicio, Mis
/// incidencias y Avisos con permiso de editar).
class _Auth extends AuthRepository {
  _Auth({required this.conSesion});

  final bool conSesion;

  @override
  Future<bool> get isAuthenticated => Future.value(conSesion);
  @override
  Future<bool> get isRH => Future.value(conSesion);
  @override
  User? getCurrentUser() => conSesion ? _usuario : null;
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

class _Log implements AppLogger {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _Huellas implements FingerprintRepository {
  @override
  Stream<Scan> capture() => const Stream.empty();
  @override
  Future<Result<List<Finger>>> getFingerprintsOfUser(int id) async => Result.ok([]);
  @override
  Future<void> loadFingerprints() async {}
  // Como en el navegador: no hay lector de huella.
  @override
  bool get isScannerConnected => false;
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _Avisos implements AvisosRepository {
  @override
  Future<Result<List<Aviso>>> getAvisos({DateTime? query}) async => Result.ok([
    Aviso(
      id: 1,
      content: 'Mañana no hay servicio de comedor por mantenimiento; traigan su comida.',
      showAt: DateTime.now(),
    ),
  ]);
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _Incidencias implements IncidenciasRepository {
  @override
  Future<Result<int>> getIncidenciasToReviewCount() async => Result.ok(0);
  @override
  Future<Result<List<Incidencia>>> getIncidencias({IncidenciaQuery? query}) async => Result.ok(_incidencias());
  @override
  Future<Result<List<Incidencia>>> getIncidenciasToReview({IncidenciaQuery? query}) async =>
      Result.ok(_incidencias().where((i) => i.state == IncidenciaState.pending).toList());
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _Usuarios implements UsersRepository {
  @override
  Future<Result<List<User>>> getUsers({UserQuery? query}) async => Result.ok([_usuario]);
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

List<Incidencia> _incidencias() => [
    Incidencia(
      id: 1,
      createdAt: DateTime(2026, 11, 10),
      state: IncidenciaState.pending,
      solicitor: _usuario,
      start: DateTime(2026, 11, 12),
      end: DateTime(2026, 11, 15),
      reason: 'Cita médica de mi hijo en el IMSS y después trámite en la escuela, '
          'regreso a trabajar el lunes.',
      files: [],
      category: IncidenciaCategory.permiso,
      conGoce: true,
    ),
    Incidencia(
      id: 2,
      createdAt: DateTime(2026, 11, 1),
      state: IncidenciaState.approved,
      solicitor: _usuario,
      start: DateTime(2026, 11, 3),
      end: DateTime(2026, 11, 3),
      reason: 'Vacaciones',
      files: [],
      category: IncidenciaCategory.vacaciones,
    ),
  ];

class _NoUsadoAsistencia implements AsistenciaRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

/// Nombre y puesto largos para que se note si algo no cabe en la tarjeta.
BaseEmpleado _base(int id, String nombre, {required bool firma}) => BaseEmpleado(
  id: id,
  nombre: nombre,
  nacidoEn: DateTime(1995, 3, 14),
  clabeInterbancaria: '012345678901234567',
  numeroContacto: '6621234567',
  contactoEmergencia: '6627654321',
  rfc: 'DOAJ950314AB1',
  curp: 'DOAJ950314HSRMRS09',
  nss: '12345678901',
  direccion: 'Calle Falsa 123',
  puesto: Puesto(id: 1, nombre: 'Técnico de mantenimiento industrial', tipo: TipoPuesto.directo),
  salario: 315.04,
  registradoEn: DateTime(2026, 9, 28),
  user: _usuario,
  hasSignature: firma,
  files: const BaseEmpleadoFiles(),
);

class _Empleados implements EmpleadosRepository {
  // Lista de empleados: uno en proceso de finiquito (estatus largo) y uno
  // activo sin firma (con el aviso "!").
  @override
  Future<Result<Empleado>> getEmpleado(int id) async =>
      Result.ok((await getEmpleados() as Ok<List<Empleado>>).value.firstWhere((e) => e.base.id == id));
  @override
  Future<Result<List<Empleado>>> getEmpleados() async => Result.ok([
    Empleado(
      base: _base(1, 'José Francisco Domínguez Arellano', firma: true),
      escolaridad: Escolaridad.preparatoria,
      montoRetencionInfonavit: 0,
      estatus: EmpleadoEstatus.procesoFiniquito,
      alta: const AltaEmpleo(),
      baja: const BajaEmpleo(),
    ),
    Empleado(
      base: _base(2, 'María Guadalupe Hernández Villaseñor', firma: false),
      escolaridad: Escolaridad.universidad,
      montoRetencionInfonavit: 0,
      estatus: EmpleadoEstatus.activo,
      alta: const AltaEmpleo(),
      baja: const BajaEmpleo(),
    ),
  ]);
  // Catálogos de la evaluación de practicante con sesión (RH puede editar puestos).
  @override
  Future<Result<List<Puesto>>> getPuestos() async => Result.ok([]);
  @override
  Future<Result<List<Departamento>>> getDepartamentos() async => Result.ok([_departamento]);
  @override
  Future<Result<EvaluacionDetalle>> getEvaluacionDetalle(String token, {bool publica = false}) async => Result.ok((
    nombreCompleto: 'José Francisco Domínguez Arellano',
    puesto: 'Técnico de mantenimiento industrial',
    fechaVencimientoPeriodo: DateTime(2026, 11, 30),
    evaluacionRespuesta: null,
    evaluacionMotivoNoRenovacion: '',
    evaluacionRespondidaEn: null,
  ));
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _Practicantes implements PracticantesRepository {
  @override
  Future<Result<Practicante>> getPracticante(int id) async =>
      Result.ok((await getPracticantes() as Ok<List<Practicante>>).value.firstWhere((p) => p.base.id == id));
  @override
  Future<Result<List<Practicante>>> getPracticantes() async => Result.ok([
    for (final (id, nombre, status) in [
      (3, 'Ana Sofía Ramírez Castañeda', StatusPracticante.procesoBaja),
      (4, 'Luis Fernando Quiñones Bustamante', StatusPracticante.alta),
    ])
      Practicante(
        base: _base(id, nombre, firma: false),
        type: TypePracticante.practicante,
        university: const Universidad(nombre: 'Universidad de Sonora', direccion: '', numeroContacto: ''),
        alta: const AltaPracticante(),
        status: status,
      ),
  ]);
  @override
  Future<Result<EvaluacionPracticanteDetalle>> getEvaluacion(String token, {bool publica = false}) async => Result.ok((
    nombreCompleto: 'Ana Sofía Ramírez Castañeda',
    tipo: 'Practicante',
    puesto: 'Practicante de diseño',
    fechaTerminacion: DateTime(2026, 11, 30),
    evaluacionRespuesta: null,
    evaluacionMotivo: '',
    evaluacionRespondidaEn: null,
    puestos: [(id: 1, nombre: 'Diseñador industrial de productos y empaques', rol: 'OPERADOR')],
    puestoId: null,
    rol: null,
    justificacion: '',
    solicitudEstatus: null,
    comentarioDireccion: '',
    requiereAprobacionDireccion: true,
  ));
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _Horarios implements HorarioRepository {
  @override
  Future<Result<List<Horario>>> getHorarios() async => Result.ok([]);
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _NoUsadoDescargas implements FileDownloadService {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _NoUsadoFirmas implements SignatureRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _NoUsadoVacantes implements VacantesRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

const _celular = Size(390, 844);

// Se libera a mano en _cerrar: su Timer de cada minuto se quedaría vivo si
// el dispose() doble de "Nueva incidencia" corta el desmontaje del árbol.
NotificationViewmodel? _notificaciones;
const _computadora = Size(1366, 768);

Future<void> _abrir(
  WidgetTester tester,
  String ruta, {
  required bool movil,
  required Size size,
  bool conSesion = false,
}) async {
  debugNavegadorMovil = movil;
  addTearDown(() => debugNavegadorMovil = null);
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  PackageInfo.setMockInitialValues(
    appName: 'ri_rh_v2', packageName: 'ri_rh_v2', version: '2.1.7', buildNumber: '1', buildSignature: '',
  );

  final auth = _Auth(conSesion: conSesion);
  final incidencias = _Incidencias();
  final goRouter = router(auth);
  addTearDown(goRouter.dispose);

  await tester.pumpWidget(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthRepository>.value(value: auth),
      Provider<AppLogger>.value(value: _Log()),
      Provider<FingerprintRepository>.value(value: _Huellas()),
      Provider<AvisosRepository>.value(value: _Avisos()),
      Provider<IncidenciasRepository>.value(value: incidencias),
      Provider<AsistenciaRepository>.value(value: _NoUsadoAsistencia()),
      Provider<UsersRepository>.value(value: _Usuarios()),
      Provider<EmpleadosRepository>.value(value: _Empleados()),
      Provider<PracticantesRepository>.value(value: _Practicantes()),
      Provider<HorarioRepository>.value(value: _Horarios()),
      Provider<SignatureRepository>.value(value: _NoUsadoFirmas()),
      ChangeNotifierProvider(create: (_) => DownloadViewmodel(log: _Log(), fileDownloadService: _NoUsadoDescargas())),
      ChangeNotifierProvider(create: (_) => AuthViewmodel(authRepository: auth)),
      ChangeNotifierProvider.value(
        value: _notificaciones = NotificationViewmodel(
          log: _Log(),
          authRepository: auth,
          incidenciasRepository: incidencias,
          empleadosRepository: _Empleados(),
          vacantesRepository: _NoUsadoVacantes(),
        ),
      ),
    ],
    child: MaterialApp.router(
      routerConfig: goRouter,
      // La letra de pruebas (Ahem) es un cuadro por letra, el doble de ancha
      // que la real (~0.5 del tamaño por letra); a 0.5 mide más o menos igual.
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(0.5)),
        child: child!,
      ),
    ),
  ));
  goRouter.go(ruta);
  // No se usa pumpAndSettle: el reloj de Ingreso se actualiza cada segundo.
  for (var i = 0; i < 5; i++) {
    await tester.pump(const Duration(milliseconds: 200));
  }
}

/// Dos errores que ya existían antes del acomodo móvil (también salen en
/// computadora y solo en modo debug), en "Nueva incidencia":
/// - el CheckboxListTile de "tiempo por tiempo" va sobre un fondo blanco que
///   tapa su efecto al tocarlo;
/// - NewIncidenciaScreen e IncidenciaForm hacen dispose() del mismo
///   NewIncidenciaViewmodel al salir.
/// Se ignoran solo esos dos para que la prueba revise lo que sí importa aquí:
/// que nada se salga de la pantalla.
Future<void> _ignorandoErroresConocidos(Future<void> Function() prueba) async {
  final original = FlutterError.onError;
  FlutterError.onError = (details) {
    final mensaje = details.exceptionAsString();
    if (mensaje.contains('ListTile background color or ink splashes may be invisible') ||
        mensaje.contains('NewIncidenciaViewmodel was used after being disposed')) {
      return;
    }
    original?.call(details);
  };
  try {
    await prueba();
  } finally {
    FlutterError.onError = original;
  }
}

/// Para que el reloj de Ingreso (Timer.periodic) se cancele antes de que
/// termine la prueba.
Future<void> _cerrar(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox());
  await tester.pump(const Duration(seconds: 1));
  _notificaciones?.dispose();
  _notificaciones = null;
}

void main() {
  final pantallas = {
    'Login': Routes.login,
    'Ingreso': Routes.ingreso,
    'Ingreso Manual': Routes.ingresoManual,
    'Incidencias': Routes.incidencias,
    // "Nueva incidencia" va en sus propias pruebas de abajo (al final: el
    // dispose() doble que ya existía deja residuos para la prueba siguiente).
  };

  for (final MapEntry(key: nombre, value: ruta) in pantallas.entries) {
    testWidgets('celular: $nombre cabe en la pantalla', (tester) async {
      await _ignorandoErroresConocidos(() async {
        await _abrir(tester, ruta, movil: true, size: _celular);
        expect(find.byType(AppBar), findsOneWidget); // marco de celular (☰)
        await _cerrar(tester);
      });
    });

    testWidgets('computadora: $nombre se ve como siempre', (tester) async {
      await _ignorandoErroresConocidos(() async {
        await _abrir(tester, ruta, movil: false, size: _computadora);
        expect(find.byType(AppBar), findsNothing);
        await _cerrar(tester);
      });
    });
  }

  // Con sesión iniciada (Inicio la exige; Mis incidencias la usa en web).
  final pantallasConSesion = {
    'Inicio': Routes.home,
    'Mis incidencias': Routes.misIncidencias,
    'Avisos': Routes.avisos,
    'Solicitudes de Incidencias': Routes.pendingIncidencias,
  };

  for (final MapEntry(key: nombre, value: ruta) in pantallasConSesion.entries) {
    testWidgets('celular: $nombre cabe en la pantalla', (tester) async {
      await _abrir(tester, ruta, movil: true, size: _celular, conSesion: true);
      expect(find.byType(AppBar), findsOneWidget);
      await _cerrar(tester);
    });

    testWidgets('computadora: $nombre se ve como siempre', (tester) async {
      await _abrir(tester, ruta, movil: false, size: _computadora, conSesion: true);
      expect(find.byType(AppBar), findsNothing);
      await _cerrar(tester);
    });
  }

  testWidgets('celular: Mis incidencias muestra la lista con la línea de pasos', (tester) async {
    await _abrir(tester, Routes.misIncidencias, movil: true, size: _celular, conSesion: true);
    expect(find.textContaining('Cita médica'), findsOneWidget);
    expect(find.byType(StepTimeline), findsNWidgets(2));
    await _cerrar(tester);
  });

  testWidgets('celular: Avisos pone el calendario arriba y la lista abajo', (tester) async {
    await _abrir(tester, Routes.avisos, movil: true, size: _celular, conSesion: true);
    final calendario = tester.getTopLeft(find.byType(AvisosCalendar));
    final lista = tester.getTopLeft(find.byType(AvisosListView));
    expect(lista.dy, greaterThan(calendario.dy));
    expect(find.textContaining('comedor'), findsOneWidget);
    await _cerrar(tester);
  });

  testWidgets('celular: la ventana de nuevo aviso cabe en la pantalla', (tester) async {
    await _abrir(tester, Routes.avisos, movil: true, size: _celular, conSesion: true);
    await tester.tap(find.byTooltip('Agregar aviso'));
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(find.text('Nuevo aviso'), findsOneWidget);
    await _cerrar(tester);
  });

  testWidgets('computadora: Avisos sigue con calendario y lista lado a lado', (tester) async {
    await _abrir(tester, Routes.avisos, movil: false, size: _computadora, conSesion: true);
    final calendario = tester.getTopLeft(find.byType(AvisosCalendar));
    final lista = tester.getTopLeft(find.byType(AvisosListView));
    expect(lista.dy, calendario.dy);
    expect(lista.dx, greaterThan(calendario.dx));
    await _cerrar(tester);
  });

  testWidgets('celular: Solicitudes pone los filtros arriba y Limpiar/Aplicar abajo', (tester) async {
    await _abrir(tester, Routes.pendingIncidencias, movil: true, size: _celular, conSesion: true);
    final filtroFecha = tester.getTopLeft(find.byIcon(LucideIcons.calendar).first);
    final aplicar = tester.getTopLeft(find.text('Aplicar'));
    expect(aplicar.dy, greaterThan(filtroFecha.dy));
    expect(find.text('CON GOCE'), findsOneWidget);
    await _cerrar(tester);
  });

  testWidgets('celular: las ventanas de aprobar y de motivo de rechazo caben', (tester) async {
    await _abrir(tester, Routes.pendingIncidencias, movil: true, size: _celular, conSesion: true);
    await tester.tap(find.textContaining('Cita médica'));
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(find.text('Aprobar'), findsOneWidget);

    await tester.tap(find.text('Rechazar'));
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(find.text('Motivo de rechazo'), findsOneWidget);
    await _cerrar(tester);
  });

  testWidgets('computadora: Solicitudes sigue con filtros y botones en una fila', (tester) async {
    await _abrir(tester, Routes.pendingIncidencias, movil: false, size: _computadora, conSesion: true);
    final filtroFecha = tester.getTopLeft(find.byIcon(LucideIcons.calendar).first);
    final aplicar = tester.getCenter(find.text('Aplicar'));
    final centroFecha = tester.getCenter(find.byIcon(LucideIcons.calendar).first);
    expect(aplicar.dy, closeTo(centroFecha.dy, 2));
    expect(aplicar.dx, greaterThan(filtroFecha.dx));
    await _cerrar(tester);
  });

  // Evaluaciones que llegan por el enlace del correo (sin sesión).
  final evaluaciones = {
    'Evaluación de empleado (enlace)': '${Routes.evaluacionPublica}/abc',
    'Evaluación de practicante (enlace)': '${Routes.evaluacionPracticantePublica}/abc',
  };

  for (final MapEntry(key: nombre, value: ruta) in evaluaciones.entries) {
    testWidgets('celular: $nombre cabe y "Enviar respuesta" va a todo el ancho', (tester) async {
      await _abrir(tester, ruta, movil: true, size: _celular);
      expect(find.byType(AppBar), findsOneWidget);
      expect(tester.getSize(find.widgetWithText(ElevatedButton, 'Enviar respuesta')).width, greaterThan(300));
      await _cerrar(tester);
    });

    testWidgets('computadora: $nombre se ve como siempre', (tester) async {
      await _abrir(tester, ruta, movil: false, size: _computadora);
      expect(find.byType(AppBar), findsNothing);
      expect(tester.getSize(find.widgetWithText(ElevatedButton, 'Enviar respuesta')).width, lessThan(300));
      await _cerrar(tester);
    });
  }

  testWidgets('celular: practicante "Contratarlo" muestra puesto, rol y justificación sin salirse', (tester) async {
    await _abrir(tester, '${Routes.evaluacionPracticantePublica}/abc', movil: true, size: _celular);
    await tester.tap(find.text('Contratarlo como empleado'));
    await tester.pump();
    expect(find.text('PUESTO COMO EMPLEADO'), findsOneWidget);
    expect(find.text('Justificación'), findsOneWidget);
    await _cerrar(tester);
  });

  for (final movil in [true, false]) {
    testWidgets('${movil ? 'celular' : 'computadora'}: practicante con sesión, botones de puesto '
        '${movil ? 'abajo de la lista' : 'junto a la lista'}', (tester) async {
      await _abrir(
        tester,
        Routes.evaluacionPracticanteOfToken('abc'),
        movil: movil,
        size: movil ? _celular : _computadora,
        conSesion: true,
      );
      await tester.tap(find.text('Contratarlo como empleado'));
      await tester.pump();
      final lista = tester.getCenter(find.text('PUESTO COMO EMPLEADO'));
      final crear = tester.getCenter(find.byTooltip('Crear puesto nuevo'));
      if (movil) {
        expect(crear.dy, greaterThan(lista.dy + 20));
      } else {
        expect(crear.dx, greaterThan(lista.dx));
        expect(crear.dy, closeTo(lista.dy, 30));
      }
      await _cerrar(tester);
    });
  }

  // Listas de Recursos Humanos (comparten la tarjeta BaseEmpleadoCard).
  final listasRH = {
    'Empleados': (Routes.empleados, 'Nuevo Empleado'),
    'Practicantes': (Routes.practicantes, 'Nuevo Practicante'),
  };

  for (final MapEntry(key: nombre, value: (ruta, nuevo)) in listasRH.entries) {
    testWidgets('celular: $nombre en una columna, con "Estadísticas" abajo', (tester) async {
      await _abrir(tester, ruta, movil: true, size: _celular, conSesion: true);
      expect(find.byType(AppBar), findsOneWidget);
      // Botón de alta abajo del título, a todo el ancho.
      expect(tester.getSize(find.widgetWithText(ElevatedButton, nuevo)).width, greaterThan(300));
      // Una tarjeta por fila: la segunda va abajo de la primera.
      final expedientes = find.text('Ver Expediente');
      expect(expedientes, findsNWidgets(2));
      expect(tester.getTopLeft(expedientes.at(1)).dy, greaterThan(tester.getBottomLeft(expedientes.at(0)).dy));
      expect(tester.getTopLeft(expedientes.at(1)).dx, tester.getTopLeft(expedientes.at(0)).dx);
      // "Estadísticas" en la segunda fila de botones.
      final estadisticas = tester.getTopLeft(find.text('Estadísticas').first);
      expect(estadisticas.dy, greaterThan(tester.getBottomLeft(expedientes.first).dy));
      await _cerrar(tester);
    });

    testWidgets('computadora: $nombre sigue en dos columnas', (tester) async {
      await _abrir(tester, ruta, movil: false, size: _computadora, conSesion: true);
      expect(find.byType(AppBar), findsNothing);
      final expedientes = find.text('Ver Expediente');
      expect(expedientes, findsNWidgets(2));
      // Dos tarjetas lado a lado.
      expect(tester.getCenter(expedientes.at(1)).dy, closeTo(tester.getCenter(expedientes.at(0)).dy, 2));
      // "Estadísticas" en la misma fila que "Ver Expediente".
      expect(
        tester.getCenter(find.text('Estadísticas').first).dy,
        closeTo(tester.getCenter(expedientes.first).dy, 2),
      );
      await _cerrar(tester);
    });
  }

  testWidgets('celular: la ventana "Marcar como finiquitado" cabe', (tester) async {
    await _abrir(tester, Routes.empleados, movil: true, size: _celular, conSesion: true);
    await tester.tap(find.byIcon(LucideIcons.ellipsisVertical).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Marcar como finiquitado'));
    await tester.pumpAndSettle();
    expect(find.text('Convenio de terminación'), findsOneWidget);
    // Casi todo el ancho de la pantalla (antes ~230 px de contenido).
    expect(tester.getSize(find.byType(AlertDialog)).width, greaterThan(_celular.width - 40));
    await _cerrar(tester);
  });

  // Expedientes (ExpedienteForm + Documentación, Horario y Huellas).
  final expedientes = {
    'Expediente de empleado': '${Routes.empleados}/2',
    'Expediente de practicante': '${Routes.practicantes}/4',
  };

  for (final MapEntry(key: nombre, value: ruta) in expedientes.entries) {
    testWidgets('celular: $nombre en una columna y un campo por fila', (tester) async {
      await _abrir(tester, ruta, movil: true, size: _celular, conSesion: true);
      expect(find.byType(AppBar), findsOneWidget);
      // Documentación abajo de los datos, del mismo ancho.
      final datos = tester.getRect(find.ancestor(of: find.text('Datos Generales'), matching: find.byType(Card)));
      final documentos = tester.getRect(find.ancestor(of: find.text('Documentación'), matching: find.byType(Card)));
      expect(documentos.top, greaterThan(datos.bottom));
      expect(documentos.width, closeTo(datos.width, 1));
      // NSS abajo de NOMBRE COMPLETO.
      expect(tester.getTopLeft(find.text('NSS').first).dy, greaterThan(tester.getBottomLeft(find.text('NOMBRE COMPLETO')).dy));
      await _cerrar(tester);
    });

    testWidgets('computadora: $nombre sigue en dos columnas', (tester) async {
      await _abrir(tester, ruta, movil: false, size: _computadora, conSesion: true);
      expect(find.byType(AppBar), findsNothing);
      expect(tester.getTopLeft(find.text('Documentación')).dx, greaterThan(tester.getTopRight(find.text('Datos Generales')).dx));
      expect(tester.getCenter(find.text('NSS').first).dy, closeTo(tester.getCenter(find.text('NOMBRE COMPLETO')).dy, 2));
      await _cerrar(tester);
    });
  }

  testWidgets('celular: la ventana de horario personalizado por día cabe', (tester) async {
    await _abrir(tester, '${Routes.empleados}/2', movil: true, size: _celular, conSesion: true);
    final asignar = find.widgetWithText(ElevatedButton, 'Asignar');
    await tester.ensureVisible(asignar);
    await tester.pumpAndSettle();
    await tester.tap(asignar);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Personalizado por día'));
    await tester.pumpAndSettle();
    // Con hora de comida, para ver "SALIDA A COMER" y "REGRESO DE COMER".
    await tester.tap(find.byType(Checkbox).at(1));
    await tester.pumpAndSettle();
    expect(find.text('REGRESO DE COMER'), findsOneWidget);
    // La comida va una debajo de otra (lado a lado las etiquetas se cortan).
    expect(
      tester.getTopLeft(find.text('REGRESO DE COMER')).dy,
      greaterThan(tester.getBottomLeft(find.text('SALIDA A COMER')).dy),
    );
    expect(tester.getSize(find.byType(AlertDialog)).width, greaterThan(_celular.width - 40));
    await _cerrar(tester);
  });

  // Huellas (se abren desde el expediente). Los dos sin firma registrada.
  final huellas = {
    'Huellas del empleado': '${Routes.empleados}/2/${Routes.huellas}',
    'Huellas del practicante': '${Routes.practicantes}/4/${Routes.huellas}',
  };

  for (final MapEntry(key: nombre, value: ruta) in huellas.entries) {
    testWidgets('celular: $nombre con una mano debajo de la otra y sin captura de firma', (tester) async {
      await _abrir(tester, ruta, movil: true, size: _celular, conSesion: true);
      expect(find.byType(AppBar), findsOneWidget);
      expect(
        tester.getTopLeft(find.text('Mano derecha')).dy,
        greaterThan(tester.getBottomLeft(find.text('Mano izquierda')).dy),
      );
      // Sin lector en el celular: aviso en lugar del botón "Agregar".
      expect(find.text('La firma se captura desde la computadora con el lector de huella.'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Agregar'), findsNothing);
      await _cerrar(tester);
    });

    testWidgets('computadora: $nombre sigue con las manos lado a lado y el botón Agregar', (tester) async {
      await _abrir(tester, ruta, movil: false, size: _computadora, conSesion: true);
      expect(find.byType(AppBar), findsNothing);
      expect(
        tester.getCenter(find.text('Mano derecha')).dy,
        closeTo(tester.getCenter(find.text('Mano izquierda')).dy, 2),
      );
      expect(find.widgetWithText(ElevatedButton, 'Agregar'), findsOneWidget);
      await _cerrar(tester);
    });
  }

  testWidgets('celular: Ingreso sin sección de huella y con botón al registro remoto', (tester) async {
    await _abrir(tester, Routes.ingreso, movil: true, size: _celular);
    expect(find.text('Registra tu entrada'), findsNothing);
    expect(find.text('Registrar mi asistencia'), findsOneWidget);
    await _cerrar(tester);
  });

  testWidgets('celular: Nueva incidencia por horas pone los 3 campos uno debajo de otro', (tester) async {
    await _ignorandoErroresConocidos(() async {
      await _abrir(tester, Routes.newIncidenciaOfCategory(IncidenciaCategory.permiso), movil: true, size: _celular);
      await tester.tap(find.text('Horas'));
      await tester.pump();

      final dia = tester.getTopLeft(find.text('DÍA'));
      final inicio = tester.getTopLeft(find.text('HORA INICIO'));
      final fin = tester.getTopLeft(find.text('HORA FIN'));
      expect(inicio.dy, greaterThan(dia.dy));
      expect(fin.dy, greaterThan(inicio.dy));
      await _cerrar(tester);
    });
  });

  testWidgets('computadora: Nueva incidencia por horas sigue con los 3 campos lado a lado', (tester) async {
    await _ignorandoErroresConocidos(() async {
      await _abrir(tester, Routes.newIncidenciaOfCategory(IncidenciaCategory.permiso), movil: false, size: _computadora);
      await tester.tap(find.text('Horas'));
      await tester.pump();

      final dia = tester.getTopLeft(find.text('DÍA'));
      final fin = tester.getTopLeft(find.text('HORA FIN'));
      expect(fin.dy, dia.dy);
      expect(fin.dx, greaterThan(dia.dx));
      await _cerrar(tester);
    });
  });
}
