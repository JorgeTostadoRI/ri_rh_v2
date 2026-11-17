import 'dart:async';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato_detalle.dart';
import 'package:ri_rh_v2/ui/core/ui/field_switcher.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_incidencia_nomina.dart';
import 'package:ri_rh_v2/domain/models/reportes/reporte_asistencia.dart';
import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';
import 'package:ri_rh_v2/domain/models/dias_festivos/dia_festivo.dart';
import 'package:ri_rh_v2/data/repositories/dias_festivos/dias_festivos_repository.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
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
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/step_timeline.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/auth_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/notification_viewmodel.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Abre las pantallas adaptadas a celular (Login, Ingreso, Ingreso Manual,
/// Incidencias, Nueva incidencia, Inicio, Mis incidencias, Avisos,
/// Solicitudes de Incidencias, las evaluaciones por enlace, las listas de
/// Empleados / Practicantes, sus expedientes, huellas y altas, Días festivos,
/// Reportes, Reclutamiento) con el router
/// real, en el tamaño de un celular y en el de una computadora. Si algo no
/// cabe (RenderFlex overflowed), Flutter lo reporta como error y la prueba falla.

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

/// Para Reclutamiento: líder de RH (todas las pestañas) o de Dirección
/// (aprueba solicitudes). Se asigna solo en esas pruebas.
User? _usuarioSesion;

Departamento _depto(int id, String nombre) =>
    Departamento(id: id, nombre: nombre, descripcion: '', presupuesto: 0, divisa: Divisa.MXN);

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
  User? getCurrentUser() => conSesion ? (_usuarioSesion ?? _usuario) : null;
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
  @override
  Future<Result<int>> getEvaluacionesPendientesCount() async => Result.ok(0);
  // Pestaña Altas IMSS: uno pendiente de envío y el contratado de la
  // solicitud 2 (con su progreso de Fase 2).
  @override
  Future<Result<List<AltaImssItem>>> getAltasImssLista() async => Result.ok([
    (
      id: 2,
      nombreCompleto: 'María Guadalupe Hernández Villaseñor',
      puesto: 'Técnico de mantenimiento industrial',
      fechaAlta: DateTime(2026, 10, 1),
      fase2Stage: Fase2Stage.evaluacionRespondida,
      fase2TotalSteps: 4,
      fechaVencimientoPeriodo: DateTime(2026, 12, 1),
      evaluacionPendiente: false,
      evaluacionRespuesta: EvaluacionRespuesta.renovar,
      evaluacionMotivoNoRenovacion: '',
      evaluacionRespondidaEn: DateTime(2026, 11, 5),
      evaluacionToken: 'abc',
    ),
    (
      id: 5,
      nombreCompleto: 'José Francisco Domínguez Arellano',
      puesto: 'Técnico de mantenimiento industrial',
      fechaAlta: DateTime(2026, 11, 10),
      fase2Stage: Fase2Stage.pendienteEnvio,
      fase2TotalSteps: 4,
      fechaVencimientoPeriodo: null,
      evaluacionPendiente: false,
      evaluacionRespuesta: null,
      evaluacionMotivoNoRenovacion: '',
      evaluacionRespondidaEn: null,
      evaluacionToken: '',
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
  Future<Result<List<PracticantePorEvaluarItem>>> getMisEvaluacionesPendientes() async => Result.ok([
    (
      id: 3,
      nombreCompleto: 'Ana Sofía Ramírez Castañeda',
      tipo: 'Practicante',
      puesto: 'Diseñador industrial de productos y empaques',
      fechaTerminacion: DateTime(2026, 11, 30),
      evaluacionToken: 'abc',
    ),
  ]);
  @override
  Future<Result<List<SeguimientoPracticanteItem>>> getSeguimientoEvaluaciones() async => Result.ok([
    for (final (id, nombre, etapa) in [
      (3, 'Ana Sofía Ramírez Castañeda', EtapaSeguimientoPracticante.evaluacionPendiente),
      (4, 'Luis Fernando Quiñones Bustamante', EtapaSeguimientoPracticante.contratar),
    ])
      (
        id: id,
        nombreCompleto: nombre,
        tipo: 'Practicante',
        puesto: 'Diseñador industrial de productos y empaques',
        jefe: 'María Guadalupe Hernández Villalobos',
        fechaTerminacion: DateTime(2026, 11, 30),
        etapa: etapa,
        evaluacionNotificadaEn: DateTime(2026, 11, 2),
        evaluacionMotivo: '',
        evaluacionRespondidaEn: DateTime(2026, 11, 6),
        solicitudEstatus: etapa == EtapaSeguimientoPracticante.contratar ? 'pendiente' : null,
        comentarioDireccion: '',
        candidatoEstado: null,
        contratoSolicitado: false,
      ),
  ]);
  @override
  Future<Result<List<Puesto>>> getPuestos() async => Result.ok([
    const Puesto(id: 1, nombre: 'Diseñador industrial de productos y empaques', tipo: TipoPuesto.administrativo),
  ]);
  @override
  Future<Result<List<Universidad>>> getUniversidades() async => Result.ok([
    const Universidad(
      id: 1,
      nombre: 'Universidad Tecnológica del Norte de Sonora',
      direccion: '',
      numeroContacto: '',
    ),
  ]);
  @override
  Future<Result<List<Departamento>>> getDepartamentos() async => Result.ok([_departamento]);
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

class _Festivos implements DiasFestivosRepository {
  // Varios días, para que al bajar hasta el final el último quede junto al
  // botón (+).
  @override
  Future<Result<List<DiaFestivo>>> getDiasFestivos() async => Result.ok([
    DiaFestivo(id: 1, fecha: DateTime(2026, 9, 16), nombre: 'Día de la Independencia de México'),
    for (var i = 2; i <= 10; i++) DiaFestivo(id: i, fecha: DateTime(2026, 11, i), nombre: ''),
  ]);
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

DateTime get _hoy => DateUtils.dateOnly(DateTime.now());

/// Reportes del día de hoy (el rango que abre la pantalla) con un empleado y
/// un practicante de nombres largos.
class _Reportes implements ReportesRepository {
  @override
  Future<Result<ReporteAsistencia>> getReporteAsistencia(DateTime start, DateTime end) async {
    final hoy = _hoy;
    ReporteAsistenciaItem item(int id, String nombre, bool practicante) {
      final user = _usuario.copyWith(id: id, nombre: nombre);
      return ReporteAsistenciaItem(
        user: user,
        asistencia: {
          hoy.toShortIsoString(): AsistenciaDaily(
            id: id,
            createdAt: hoy,
            updatedAt: hoy,
            user: user,
            attendedAt: hoy,
            status: AsistenciaStatus.late,
            minutesLate: 12,
            entryAt: hoy.add(const Duration(hours: 8, minutes: 12)),
            exitToLunchAt: hoy.add(const Duration(hours: 13)),
          ),
        },
        totalMinutesLate: 12,
        isPracticante: practicante,
      );
    }

    return Result.ok(ReporteAsistencia(dates: [hoy], items: [
      item(1, 'José Francisco Domínguez Arellano', false),
      item(3, 'Ana Sofía Ramírez Castañeda', true),
    ]));
  }

  @override
  Future<Result<ReporteIncidenciaNomina>> getReporteIncidenciaNomina(DateTime start, DateTime end) async {
    final hoy = _hoy.toShortIsoString();
    ReporteIncidenciaNominaItem item(int id, String nombre, bool practicante) => ReporteIncidenciaNominaItem(
      id: id,
      username: 'u$id',
      fullName: nombre,
      isPracticante: practicante,
      departamento: _departamento,
      codigosPorDia: {hoy: 'R'},
      statusPorDia: {hoy: AsistenciaStatus.late.jsonValue},
      minutesLatePorDia: {hoy: 12},
      minutesLate: 12,
      extraHours: 1.5,
    );
    return Result.ok(ReporteIncidenciaNomina(dates: [_hoy], items: [
      item(1, 'José Francisco Domínguez Arellano', false),
      item(3, 'Ana Sofía Ramírez Castañeda', true),
    ]));
  }

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

/// Solicitudes de Reclutamiento: una pendiente, una aceptada con candidatos
/// en distintos estados y una contratación de practicante.
class _Vacantes implements VacantesRepository {
  @override
  Future<Result<int>> getSolicitudesPendientesCount() async => Result.ok(0);
  // Revisión de candidato: el 2 completó su formulario (Detalles de
  // contratación con botones); el 5 ya tiene el contrato solicitado
  // (Completar alta).
  @override
  Future<Result<CandidatoDetalle>> getCandidatoDetalle(int id) async => Result.ok(CandidatoDetalle(
    id: id,
    nombre: 'Ana Sofía Ramírez Castañeda',
    correo: 'ana.ramirez@correo.com',
    estado: CandidatoEstado.completado,
    puestoNombre: 'Técnico de mantenimiento industrial',
    puestoResponsabilidades: 'Dar mantenimiento preventivo y correctivo a la maquinaria de la planta.',
    documentos: const {'identificacion_oficial': 'https://ejemplo.com/ine.pdf'},
    nombres: 'Ana Sofía',
    apellidoPaterno: 'Ramírez',
    apellidoMaterno: 'Castañeda',
    curp: 'RACA000101MSRMSNA1',
    rfc: 'RACA000101AB1',
    telefono: '6621234567',
    direccionCalle: 'Av. de los Insurgentes',
    direccionNumero: '1234',
    direccionFraccionamiento: 'Villa Satélite',
    direccionCodigoPostal: '83200',
    direccionMunicipio: 'Hermosillo',
    direccionEstado: 'Sonora',
    direccionPais: 'México',
    sexo: 'femenino',
    estadoCivil: 'soltero',
    tipoContrato: 'determinado',
    duracionDias: 90,
    tipoJornada: 'fijo',
    horaEntrada: '08:00:00',
    horaComidaInicio: '13:00:00',
    horaComidaFin: '14:00:00',
    horaSalida: '17:00:00',
    percibeComisiones: true,
    entregaEquipo: true,
    equiposEntregados: const [CandidatoEquipo(descripcion: 'Laptop', marca: 'Dell', modelo: 'Latitude 5440')],
    contratoSolicitadoEn: id == 5 ? DateTime(2026, 11, 12) : null,
  ));
  @override
  Future<Result<List<SolicitudVacante>>> getSolicitudes() async => Result.ok([
    SolicitudVacante(
      id: 1,
      puesto: 1,
      puestoNombre: 'Técnico de mantenimiento industrial',
      rol: 'OPERADOR',
      cantidad: 2,
      area: 'Producción',
      justificacion: 'Se abrió el segundo turno de la línea de ensamble.',
      solicitanteNombre: 'María Guadalupe Hernández Villalobos',
      createdAt: DateTime(2026, 11, 10),
    ),
    SolicitudVacante(
      id: 2,
      puesto: 1,
      puestoNombre: 'Técnico de mantenimiento industrial',
      rol: 'OPERADOR',
      cantidad: 5,
      area: 'Mantenimiento',
      estatus: EstatusVacante.aceptada,
      createdAt: DateTime(2026, 11, 3),
      candidatos: const [
        Candidato(id: 1, nombre: 'José Francisco Domínguez Arellano', correo: 'a@b.c'),
        Candidato(id: 2, nombre: 'Ana Sofía Ramírez Castañeda', correo: 'a@b.c', estado: CandidatoEstado.completado),
        Candidato(id: 3, nombre: 'Luis Fernando Quiñones Bustamante', correo: 'a@b.c', estado: CandidatoEstado.expirado),
        Candidato(
          id: 4,
          nombre: 'María Guadalupe Hernández Villaseñor',
          correo: 'a@b.c',
          estado: CandidatoEstado.contratado,
          empleado: 2,
          evaluacionTokenJefe: 'abc',
        ),
      ],
    ),
    SolicitudVacante(
      id: 3,
      puesto: 2,
      puestoNombre: 'Diseñador industrial de productos y empaques',
      rol: 'OPERADOR',
      cantidad: 1,
      estatus: EstatusVacante.aceptada,
      practicante: 3,
      practicanteNombre: 'Ana Sofía Ramírez Castañeda',
      justificacion: 'Buen desempeño durante sus prácticas.',
      createdAt: DateTime(2026, 11, 1),
    ),
  ]);
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
      Provider<VacantesRepository>.value(value: _Vacantes()),
      Provider<ReportesRepository>.value(value: _Reportes()),
      Provider<DiasFestivosRepository>.value(value: _Festivos()),
      Provider<SignatureRepository>.value(value: _NoUsadoFirmas()),
      ChangeNotifierProvider(create: (_) => DownloadViewmodel(log: _Log(), fileDownloadService: _NoUsadoDescargas())),
      ChangeNotifierProvider(create: (_) => AuthViewmodel(authRepository: auth)),
      ChangeNotifierProvider.value(
        value: _notificaciones = NotificationViewmodel(
          log: _Log(),
          authRepository: auth,
          incidenciasRepository: incidencias,
          empleadosRepository: _Empleados(),
          vacantesRepository: _Vacantes(),
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

/// La ventana abierta en sí (su Material), sin el margen alrededor: medir el
/// AlertDialog completo incluye ese margen y siempre da el ancho de pantalla.
Finder _ventana() => find.descendant(of: find.byType(AlertDialog), matching: find.byType(Material)).first;

/// Para que el reloj de Ingreso (Timer.periodic) se cancele antes de que
/// termine la prueba.
Future<void> _cerrar(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox());
  await tester.pump(const Duration(seconds: 1));
  _notificaciones?.dispose();
  _notificaciones = null;
}

/// Como cuando otro programa ya está usando la cámara de la computadora.
/// La primera vez (Ingreso, que en pruebas se cree la app de Windows y pide
/// las cámaras; en el navegador no lo hace) responde sin cámaras; desde la
/// ventana "Fotografía" falla.
class _CamaraOcupada extends CameraPlatform {
  var _llamadas = 0;

  @override
  Future<List<CameraDescription>> availableCameras() async {
    if (_llamadas++ == 0) return [];
    throw CameraException(
      'cameraNotReadable',
      'The camera is not readable due to a hardware error that prevented access to the device.',
    );
  }
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
    expect(tester.getSize(_ventana()).width, greaterThan(_celular.width - 40));
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
    expect(tester.getSize(_ventana()).width, greaterThan(_celular.width - 40));
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

  // Altas (Nuevo empleado / Nuevo practicante).
  final altas = {
    'Nuevo empleado': '${Routes.empleados}/${Routes.newEmpleado}',
    'Nuevo practicante': '${Routes.practicantes}/${Routes.newPracticante}',
  };

  for (final MapEntry(key: nombre, value: ruta) in altas.entries) {
    testWidgets('celular: $nombre con un campo por fila y "Dar de alta" a todo el ancho', (tester) async {
      await _abrir(tester, ruta, movil: true, size: _celular, conSesion: true);
      expect(find.byType(AppBar), findsOneWidget);
      // FECHA DE NACIMIENTO abajo de NOMBRE COMPLETO; RFC abajo de CURP.
      expect(tester.getTopLeft(find.text('FECHA DE NACIMIENTO')).dy,
          greaterThan(tester.getBottomLeft(find.text('NOMBRE COMPLETO')).dy));
      expect(tester.getTopLeft(find.text('RFC')).dy, greaterThan(tester.getBottomLeft(find.text('CURP')).dy));
      // Documentos uno por fila: el segundo abajo del primero.
      expect(tester.getTopLeft(find.text('Acta de nacimiento')).dy,
          greaterThan(tester.getBottomLeft(find.text('Identificación oficial')).dy));
      final boton = find.widgetWithText(ElevatedButton, 'Dar de alta');
      expect(tester.getSize(boton).width, greaterThan(_celular.width - 80));
      await _cerrar(tester);
    });

    testWidgets('computadora: $nombre sigue con los campos lado a lado', (tester) async {
      await _abrir(tester, ruta, movil: false, size: _computadora, conSesion: true);
      expect(find.byType(AppBar), findsNothing);
      expect(tester.getCenter(find.text('FECHA DE NACIMIENTO')).dy,
          closeTo(tester.getCenter(find.text('NOMBRE COMPLETO')).dy, 2));
      expect(tester.getCenter(find.text('Acta de nacimiento')).dy,
          closeTo(tester.getCenter(find.text('Identificación oficial')).dy, 2));
      final boton = find.widgetWithText(ElevatedButton, 'Dar de alta');
      expect(tester.getSize(boton).width, lessThan(300));
      await _cerrar(tester);
    });
  }

  testWidgets('celular: Nuevo empleado baja los botones de puesto abajo de la lista', (tester) async {
    await _abrir(tester, '${Routes.empleados}/${Routes.newEmpleado}', movil: true, size: _celular, conSesion: true);
    final lista = tester.getRect(find.byType(DropdownButtonFormField<Puesto>));
    expect(lista.width, greaterThan(_celular.width - 100));
    expect(tester.getTopLeft(find.byTooltip('Eliminar puesto')).dy, greaterThanOrEqualTo(lista.bottom));
    // La ventana de crear puesto ya se había ajustado (evaluaciones).
    await _cerrar(tester);
  });

  testWidgets('computadora: Nuevo empleado sigue con los botones de puesto a un lado', (tester) async {
    await _abrir(tester, '${Routes.empleados}/${Routes.newEmpleado}', movil: false, size: _computadora, conSesion: true);
    final lista = tester.getRect(find.byType(DropdownButtonFormField<Puesto>));
    expect(tester.getTopLeft(find.byTooltip('Eliminar puesto')).dx, greaterThan(lista.right));
    await _cerrar(tester);
  });

  testWidgets('celular: Nuevo practicante pone las 3 fechas una debajo de otra', (tester) async {
    await _abrir(tester, '${Routes.practicantes}/${Routes.newPracticante}', movil: true, size: _celular, conSesion: true);
    expect(tester.getTopLeft(find.text('FECHA DE INGRESO')).dy,
        greaterThan(tester.getBottomLeft(find.text('FECHA DE ALTA')).dy));
    expect(tester.getTopLeft(find.text('FECHA DE TERMINACIÓN')).dy,
        greaterThan(tester.getBottomLeft(find.text('FECHA DE INGRESO')).dy));
    await _cerrar(tester);
  });

  testWidgets('computadora: Nuevo practicante sigue con las 3 fechas en una fila', (tester) async {
    await _abrir(tester, '${Routes.practicantes}/${Routes.newPracticante}', movil: false, size: _computadora, conSesion: true);
    // Se compara la parte de arriba de cada campo: el de terminación trae la
    // nota "No se podrá cambiar después" y su etiqueta queda más abajo.
    double arriba(String etiqueta) =>
        tester.getTopLeft(find.ancestor(of: find.text(etiqueta), matching: find.byType(DateFormField))).dy;
    expect(arriba('FECHA DE INGRESO'), closeTo(arriba('FECHA DE ALTA'), 1));
    expect(arriba('FECHA DE TERMINACIÓN'), closeTo(arriba('FECHA DE ALTA'), 1));
    expect(tester.getTopLeft(find.text('FECHA DE TERMINACIÓN')).dx,
        greaterThan(tester.getTopRight(find.text('FECHA DE INGRESO')).dx));
    await _cerrar(tester);
  });

  for (final (boton, titulo) in [('Crear puesto nuevo', 'Crear puesto'), ('Crear universidad nueva', 'Crear universidad')]) {
    testWidgets('celular: la ventana "$titulo" de Nuevo practicante cabe', (tester) async {
      await _abrir(tester, '${Routes.practicantes}/${Routes.newPracticante}', movil: true, size: _celular, conSesion: true);
      await tester.ensureVisible(find.byTooltip(boton));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip(boton));
      await tester.pumpAndSettle();
      expect(find.text(titulo), findsOneWidget);
      expect(tester.getSize(_ventana()).width, greaterThan(_celular.width - 40));
      await _cerrar(tester);
    });
  }

  // Días festivos, con las fechas en español como en la app.
  Future<void> abrirFestivos(WidgetTester tester, {required bool movil}) async {
    await initializeDateFormatting('es_ES');
    Intl.defaultLocale = 'es_ES';
    addTearDown(() => Intl.defaultLocale = null);
    await _abrir(tester, Routes.diasFestivos,
        movil: movil, size: movil ? _celular : _computadora, conSesion: true);
  }

  testWidgets('celular: Días festivos con márgenes de 16, fecha más chica y el último día arriba del (+)',
      (tester) async {
    await abrirFestivos(tester, movil: true);
    expect(find.byType(AppBar), findsOneWidget);
    final fecha = find.text('16 de septiembre de 2026');
    expect(tester.getTopLeft(find.ancestor(of: fecha, matching: find.byType(ListTile))).dx, 16);
    expect(tester.widget<Text>(fecha).style?.fontSize, lessThan(24));
    // Al bajar hasta el final, el bote de basura del último día queda arriba
    // del botón (+).
    await tester.drag(find.byType(SingleChildScrollView).last, const Offset(0, -3000));
    await tester.pumpAndSettle();
    expect(tester.getRect(find.byIcon(LucideIcons.trash2).last).bottom,
        lessThan(tester.getRect(find.byType(FloatingActionButton)).top));
    await _cerrar(tester);
  });

  testWidgets('celular: las ventanas de Días festivos usan casi todo el ancho', (tester) async {
    await abrirFestivos(tester, movil: true);
    await tester.tap(find.byTooltip('Agregar día festivo'));
    await tester.pumpAndSettle();
    expect(find.text('Nuevo día festivo'), findsOneWidget);
    expect(tester.getSize(_ventana()).width, greaterThan(_celular.width - 40));
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(LucideIcons.trash2).first);
    await tester.pumpAndSettle();
    expect(find.text('Confirmar acción'), findsOneWidget);
    expect(tester.getSize(_ventana()).width, greaterThan(_celular.width - 40));
    await _cerrar(tester);
  });

  testWidgets('computadora: Días festivos se ve como siempre', (tester) async {
    await abrirFestivos(tester, movil: false);
    expect(find.byType(AppBar), findsNothing);
    final sidebar = tester.getTopRight(find.byType(CollapsibleSidebar)).dx;
    final fecha = find.text('16 de septiembre de 2026');
    expect(tester.getTopLeft(find.ancestor(of: fecha, matching: find.byType(ListTile))).dx, sidebar + 40);
    expect(tester.widget<Text>(fecha).style?.fontSize, 24);
    // Las ventanas con su tamaño de siempre.
    await tester.tap(find.byTooltip('Agregar día festivo'));
    await tester.pumpAndSettle();
    expect(tester.getSize(_ventana()).width, lessThan(_computadora.width - 160));
    await _cerrar(tester);
  });

  // Reportes.
  /// Ancho de la columna EMPLEADO (la fija) de la tabla que contiene [nombre].
  double anchoColumnaEmpleado(WidgetTester tester, String nombre) =>
      tester.getSize(find.ancestor(of: find.text(nombre), matching: find.byType(DataTable)).first).width;

  testWidgets('celular: Reportes de asistencia (Empresa) cabe en la pantalla', (tester) async {
    await _abrir(tester, Routes.reportes, movil: true, size: _celular, conSesion: true);
    expect(find.byType(AppBar), findsOneWidget);
    // Selectores dentro de la pantalla.
    expect(tester.getRect(find.text('Incidencias de Nómina')).right, lessThanOrEqualTo(_celular.width - 16));
    expect(tester.getRect(find.text('Empleados').last).right, lessThanOrEqualTo(_celular.width - 16));
    // Empresa/Empleados abajo del rango de fechas.
    expect(tester.getTopLeft(find.text('Empresa')).dy,
        greaterThan(tester.getBottomLeft(find.byIcon(LucideIcons.calendar)).dy));
    // Tarjetas 2 por fila, todas dentro de la pantalla.
    expect(tester.getRect(find.text('MINS RETARDO')).right, lessThan(_celular.width));
    expect(tester.getTopLeft(find.text('FALTAS')).dy, greaterThan(tester.getBottomLeft(find.text('CON REGISTRO')).dy));
    // Columna EMPLEADO angosta: queda ancho para lo que se desliza.
    expect(anchoColumnaEmpleado(tester, 'José Francisco Domínguez Arellano'), lessThan(160));
    await _cerrar(tester);
  });

  testWidgets('celular: Reportes de asistencia (Empleados) se puede abrir y cabe', (tester) async {
    await _abrir(tester, Routes.reportes, movil: true, size: _celular, conSesion: true);
    await tester.tap(find.text('Empleados').last);
    await tester.pumpAndSettle();
    expect(find.text('Buscar empleado por nombre'), findsOneWidget);
    await _cerrar(tester);
  });

  testWidgets('celular: Incidencias de Nómina cabe y la ventana de corrección usa casi todo el ancho',
      (tester) async {
    await _abrir(tester, Routes.reportes, movil: true, size: _celular, conSesion: true);
    await tester.tap(find.text('Incidencias de Nómina'));
    await tester.pumpAndSettle();
    expect(anchoColumnaEmpleado(tester, 'José Francisco Domínguez Arellano'), lessThan(160));
    // El código del día queda a la derecha: se desliza la tabla para verlo.
    await tester.ensureVisible(find.text('R').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('R').first);
    await tester.pumpAndSettle();
    expect(find.text('Corregir código de nómina'), findsOneWidget);
    expect(tester.getSize(_ventana()).width, greaterThan(_celular.width - 40));
    await _cerrar(tester);
  });

  testWidgets('computadora: Reportes se ve como siempre', (tester) async {
    await _abrir(tester, Routes.reportes, movil: false, size: _computadora, conSesion: true);
    expect(find.byType(AppBar), findsNothing);
    // Tarjetas en una fila y Empresa/Empleados a un lado del rango de fechas.
    expect(tester.getCenter(find.text('MINS RETARDO')).dy, closeTo(tester.getCenter(find.text('CON REGISTRO')).dy, 1));
    expect(tester.getCenter(find.text('Empresa')).dy,
        closeTo(tester.getCenter(find.byIcon(LucideIcons.calendar)).dy, 2));
    expect(anchoColumnaEmpleado(tester, 'José Francisco Domínguez Arellano'), greaterThan(200));
    await tester.tap(find.text('Incidencias de Nómina'));
    await tester.pumpAndSettle();
    expect(anchoColumnaEmpleado(tester, 'José Francisco Domínguez Arellano'), greaterThan(200));
    await _cerrar(tester);
  });

  // Reclutamiento: RH ve las 4 pestañas y las acciones de candidatos;
  // Dirección aprueba o rechaza.
  Future<void> abrirReclutamiento(WidgetTester tester, {required bool movil, String depto = 'Recursos Humanos'}) async {
    _usuarioSesion = _usuario.copyWith(departamento: _depto(9, depto));
    addTearDown(() => _usuarioSesion = null);
    await _abrir(tester, Routes.reclutamiento,
        movil: movil, size: movil ? _celular : _computadora, conSesion: true);
  }

  // Dentro del selector de pestañas (en computadora el menú lateral también
  // tiene "Practicantes").
  Future<void> pestana(WidgetTester tester, String nombre) async {
    await tester.tap(find.descendant(of: find.byType(FieldSwitcher), matching: find.text(nombre)));
    await tester.pumpAndSettle();
  }

  testWidgets('celular: Reclutamiento de RH con pestañas en 2 renglones y candidatos con botones abajo',
      (tester) async {
    await abrirReclutamiento(tester, movil: true);
    expect(find.byType(AppBar), findsOneWidget);
    // Pestañas: 2 renglones de 2, todas dentro de la pantalla.
    expect(tester.getRect(find.text('Historial')).right, lessThan(_celular.width - 16));
    expect(tester.getTopLeft(find.text('Historial')).dy, greaterThan(tester.getBottomLeft(find.text('Pendientes')).dy));
    // Candidato sin completar: "Reenviar link" abajo de su nombre.
    final reenviar = find.text('Reenviar link').first;
    await tester.ensureVisible(reenviar);
    await tester.pumpAndSettle();
    expect(tester.getTopLeft(reenviar).dy,
        greaterThan(tester.getBottomLeft(find.text('José Francisco Domínguez Arellano')).dy));
    await _cerrar(tester);
  });

  testWidgets('celular: pestañas Altas IMSS, Practicantes e Historial caben', (tester) async {
    await abrirReclutamiento(tester, movil: true);
    await pestana(tester, 'Altas IMSS');
    expect(tester.getTopLeft(find.text('Ver documento')).dy,
        greaterThan(tester.getBottomLeft(find.text('Se incluirá en el envío del viernes')).dy));
    await pestana(tester, 'Practicantes');
    final termina = find.textContaining('Termina el').first;
    expect(tester.getTopLeft(termina).dy, greaterThan(tester.getBottomLeft(find.text('Ana Sofía Ramírez Castañeda').first).dy));
    await pestana(tester, 'Historial');
    expect(find.text('Todavía no hay solicitudes terminadas'), findsOneWidget);
    await _cerrar(tester);
  });

  testWidgets('celular: Reclutamiento de Dirección cabe', (tester) async {
    await abrirReclutamiento(tester, movil: true, depto: 'Direccion');
    expect(find.text('Aceptar'), findsOneWidget);
    await _cerrar(tester);
  });

  testWidgets('celular: la ventana "Solicitar vacante(s)" deja ancho para cada campo', (tester) async {
    await abrirReclutamiento(tester, movil: true);
    await tester.tap(find.byTooltip('Solicitar vacante'));
    await tester.pumpAndSettle();
    expect(find.text('Solicitar vacante(s)'), findsOneWidget);
    expect(tester.getSize(_ventana()).width, greaterThan(_celular.width - 40));
    final cantidad = find.ancestor(of: find.text('CANTIDAD'), matching: find.byType(TextFormField));
    expect(tester.getSize(cantidad).width, greaterThan(80));
    // Área abajo de rol y cantidad.
    expect(tester.getTopLeft(find.text('AREA')).dy, greaterThan(tester.getBottomLeft(find.text('CANTIDAD')).dy));
    await _cerrar(tester);
  });

  testWidgets('computadora: Reclutamiento se ve como siempre', (tester) async {
    await abrirReclutamiento(tester, movil: false);
    expect(find.byType(AppBar), findsNothing);
    // Pestañas en una fila y botones del candidato a un lado de su nombre.
    expect(tester.getCenter(find.text('Historial')).dy, closeTo(tester.getCenter(find.text('Pendientes')).dy, 1));
    expect(tester.getCenter(find.text('Reenviar link').first).dy,
        closeTo(tester.getCenter(find.text('José Francisco Domínguez Arellano')).dy, 2));
    await pestana(tester, 'Altas IMSS');
    expect(tester.getCenter(find.text('Ver documento')).dy,
        closeTo(tester.getCenter(find.text('Se incluirá en el envío del viernes')).dy, 2));
    await pestana(tester, 'Practicantes');
    expect(tester.getTopLeft(find.textContaining('Termina el').first).dx,
        greaterThan(tester.getTopRight(find.text('Ana Sofía Ramírez Castañeda').first).dx));
    await _cerrar(tester);
  });

  // Revisión de candidato (Detalles de contratación y Completar alta).
  Future<void> abrirCandidato(WidgetTester tester, int id, {required bool movil}) async {
    _usuarioSesion = _usuario.copyWith(departamento: _depto(9, 'Recursos Humanos'));
    addTearDown(() => _usuarioSesion = null);
    await _abrir(tester, Routes.revisionOfCandidato(id),
        movil: movil, size: movil ? _celular : _computadora, conSesion: true);
  }

  Finder campo(String etiqueta) => find.ancestor(of: find.text(etiqueta), matching: find.byType(InputDecorator)).first;

  testWidgets('celular: Detalles de contratación con campos a todo el ancho y botones apilados', (tester) async {
    await abrirCandidato(tester, 2, movil: true);
    expect(find.byType(AppBar), findsOneWidget);
    // Campos a todo el ancho (antes 160-300 px fijos).
    expect(tester.getSize(campo('Salario diario')).width, greaterThan(300));
    // Horas de 2 en 2.
    expect(tester.getCenter(campo('Inicio de comida')).dy, closeTo(tester.getCenter(campo('Hora de entrada')).dy, 1));
    expect(tester.getTopLeft(campo('Fin de comida')).dy, greaterThan(tester.getBottomLeft(campo('Hora de entrada')).dy));
    // Botones a todo el ancho, "Solicitar contrato" hasta abajo.
    final solicitar = find.widgetWithText(ElevatedButton, 'Solicitar contrato');
    await tester.ensureVisible(solicitar);
    await tester.pumpAndSettle();
    expect(tester.getSize(solicitar).width, greaterThan(300));
    expect(tester.getTopLeft(solicitar).dy,
        greaterThan(tester.getBottomLeft(find.widgetWithText(OutlinedButton, 'Descargar documentos')).dy));
    await _cerrar(tester);
  });

  for (final boton in ['Rechazar documentación', 'Solicitar contrato']) {
    testWidgets('celular: la ventana "$boton" usa casi todo el ancho', (tester) async {
      await abrirCandidato(tester, 2, movil: true);
      final b = find.text(boton);
      await tester.ensureVisible(b);
      await tester.pumpAndSettle();
      await tester.tap(b);
      await tester.pumpAndSettle();
      expect(tester.getSize(_ventana()).width, greaterThan(_celular.width - 40));
      await _cerrar(tester);
    });
  }

  testWidgets('celular: Completar alta a todo el ancho', (tester) async {
    await abrirCandidato(tester, 5, movil: true);
    final completar = find.widgetWithText(ElevatedButton, 'Completar alta');
    await tester.ensureVisible(completar);
    await tester.pumpAndSettle();
    expect(tester.getSize(completar).width, greaterThan(300));
    await _cerrar(tester);
  });

  testWidgets('computadora: revisión de candidato se ve como siempre', (tester) async {
    await abrirCandidato(tester, 2, movil: false);
    expect(find.byType(AppBar), findsNothing);
    expect(tester.getSize(campo('Salario diario')).width, 200);
    expect(tester.getSize(campo('Hora de entrada')).width, 160);
    // Botones de su tamaño (no a todo el ancho).
    expect(tester.getSize(find.widgetWithText(ElevatedButton, 'Solicitar contrato')).width, lessThan(400));
    await _cerrar(tester);
  });

  // Ventana "Fotografía" de Ingreso Manual en un celular chico, con la
  // cámara ocupada por otro programa (el mensaje de error es el caso más
  // alto: 3 renglones).
  testWidgets('celular chico: la ventana "Fotografía" cabe con el error de cámara', (tester) async {
    final camaraOriginal = CameraPlatform.instance;
    CameraPlatform.instance = _CamaraOcupada();
    addTearDown(() => CameraPlatform.instance = camaraOriginal);
    // Más baja que un iPhone SE: en pruebas la letra mide la mitad.
    const chico = Size(390, 600);
    await _abrir(tester, Routes.ingresoManual, movil: true, size: chico);
    await tester.ensureVisible(find.text('Tomar foto'));
    await tester.pumpAndSettle();
    // El error de la cámara ocupada es esperado: la ventana lo muestra y,
    // como siempre, también se escapa sin atrapar (en la app va al log). Se
    // recoge aquí para que no cuente como falla; cualquier otro error sí.
    final errores = <Object>[];
    await runZonedGuarded(() async {
      await tester.tap(find.text('Tomar foto'));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 200));
      }
    }, (error, _) => errores.add(error));
    expect(errores, everyElement(isA<CameraException>()));
    expect(find.text('Fotografía'), findsOneWidget);
    expect(find.text('cameraNotReadable'), findsOneWidget);
    // Botones dentro de la pantalla.
    expect(tester.getRect(find.text('Capturar')).bottom, lessThan(chico.height));
    await _cerrar(tester);
  });

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
