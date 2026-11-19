# AGENTS.md — Flutter `ri_rh_v2`

App de Recursos Humanos (R&I Automation). Paquete Dart: `ri_rh_v2`.
Es la app con la **arquitectura por capas más limpia** del workspace; úsala como
referencia de estilo.

## Stack

- Flutter + **Provider** (DI y estado), `go_router`, `dio`, `freezed` /
  `json_serializable`.
- API backend: `ri_project_main` bajo `api/rh/`.

## Estructura `lib/`

| Carpeta | Contenido |
|---|---|
| `main.dart` | Arranque; delega a `main_development.dart` |
| `config/` | `dependencies.dart` (registro de repositories/providers), `assets.dart`, `app_error.dart` |
| `domain/models/` | Modelos de dominio |
| `data/repositories/<feature>/` | Interfaz + `_local.dart` + `_remote.dart` por feature: `asistencia`, `auth`, `avisos`, `dias_festivos`, `empleados`, `fingerprint`, `horario`, `incidencias`, `practicantes`, `reportes`, `signature`, `users`, `vacantes` |
| `data/services/api/models/` | DTOs de API con `freezed`/`json_serializable` (`*.freezed.dart`, `*.g.dart`) |
| `data/services/` | `device_auth_service`, `logger`, `local/finger_scan` |
| `routing/` | `router.dart`, `routes.dart` (go_router) |
| `ui/<feature>/` | Pantallas/widgets: `asistencia`, `auth`, `avisos`, `core`, `dias_festivos`, `empleados`, `expediente`, `home`, `incidencias`, `practicantes`, `puestos`, `reportes`, `vacantes` |
| `utils/time/` | Utilidades de fechas/horarios |

## Flujo funcional

- `go_router` con rutas en `lib/routing/routes.dart`: home, login e ingreso
  (huella o manual), incidencias (nuevas, pendientes y propias), avisos,
  empleados con expediente/huellas, practicantes, reportes, días festivos,
  reclutamiento/vacantes y evaluaciones (incluye variantes públicas por token).
- Pantallas por feature en `lib/ui/<feature>/`; cada una usa su repository.
- Flujo de incidencias: empleado crea → revisión del jefe → aprobación/rechazo
  de RH → reporte de nómina. Estados en `ri_project_main/docs/DOMAIN.md`.
- Flujo de reclutamiento: `SolicitudVacante` → candidato → validación →
  alta/contrato o rechazo.

## Endpoints que consume

Base: `/api/rh/` (prefijo global `URL_PREFIX`), salvo auth/usuarios.

| Dominio | Recursos |
|---|---|
| Auth / usuarios | `/api/login/`, `/api/loginbytoken/`, `/api/auth/challenges/`, `/api/auth/challenges/verify/`, `/api/usuarios/`, `/api/departamentos/` |
| Asistencia | `/api/rh/asistencias/`, `/api/rh/horas-por-hora/disponibles/` |
| Incidencias | `/api/rh/incidencias/`, `/api/rh/incidencias/pending-review/`, `/api/rh/incidencias/pending-review-count/`, `/api/rh/incidencias/{categoria}/{id}/approve|reject|generate-pdf/` |
| Avisos | `/api/rh/avisos/` (CRUD) |
| Empleados | `/api/rh/empleados/` (CRUD), `{id}/cambiar-estatus/`, `{id}/regenerar-password/`, `altas-imss-lista/`, `evaluaciones-pending-count/`, vista previa/subida de alta IMSS y contrato definitivo, evaluación y evaluación pública por token |
| Practicantes | `/api/rh/PracticantesResidentes/` (CRUD), `{id}/cambiar-estado/`, `{id}/regenerar-password/`, `mis-evaluaciones-pendientes/`, `seguimiento-evaluaciones/`, evaluación pública y baja por abandono |
| Huellas / firmas | `/api/rh/huellas/`, `/api/rh/signatures/` |
| Horarios / puestos | `/api/rh/horarios/`, `/api/rh/puesto/` |
| Días festivos | `/api/rh/dias-festivos/` |
| Reclutamiento | `/api/rh/solicitudes-vacante/` (CRUD, `cambiar-estatus`, `retroalimentacion`, `iniciar-candidato`, `iniciar-contratacion-practicante`, `pendientes-count`), `/api/rh/candidatos/{id}/` (solicitar contrato, rechazar documentación, reenviar invitación, cancelar, vista previa, completar alta) |
| Reportes | `/api/rh/reportes/asistencias/`, `/api/rh/reportes/incidencias-nomina/` |
| Mensajes | `/api/messages/` |

## Modelos Dart ↔ backend

Los modelos viven en `lib/domain/models/` y son `freezed` (se regeneran con
`build_runner`):

| Archivo | Modelo/dominio backend |
|---|---|
| `empleados/empleado.dart`, `base_empleado/`, `departamento/`, `puestos/puesto.dart` | `Empleado`, `Departamento`, `Puesto` |
| `asistencia/`, `asistencia_daily/`, `horario/`, `horario_dia.dart` | `Asistencia`, `AsistenciaDaily`, `Horario` |
| `incidencias/` | `IncidenciaModel` y variantes (permiso, vacaciones, horas extra, etc.) |
| `avisos/aviso.dart` | `Aviso` |
| `dias_festivos/dia_festivo.dart` | `DiaFestivo` |
| `practicante/practicante.dart`, `universidad/universidad.dart` | `PracticanteResidente`, `Universidad` |
| `vacantes/candidato.dart`, `candidato_detalle.dart`, `solicitud_vacante.dart` | `Candidato`, `SolicitudVacante` |
| `reportes/` | `IncidenciasNominaReport`, reporte de asistencias |
| `signature/`, `finger/`, `credenciales_generadas/`, `baja_abandono/` | Firma, huella, credenciales y baja/abandono |
| `user/user.dart` | `Usuarios` |

DTOs de API (no de dominio): `lib/data/services/api/models/`.


## Patrón a seguir

- Nueva feature: `domain/models/<x>`, `data/repositories/<x>/` (interfaz +
  remote + local), DTO en `data/services/api/models/<x>/`, UI en
  `ui/<x>/`, registrar dependencias en `config/dependencies.dart` y ruta en
  `routing/`.
- La API remota se abstrae detrás de la interfaz del repository; no llames a
  `dio` desde la UI.
- Modelos generados: si cambias un `freezed`, corre `dart run build_runner
  build --delete-conflicting-outputs`.
- Autenticación: `data/repositories/auth/` (`auth_repository_remote`,
  `auth_repository_dev`).
- Huella/biometría: `fingerprint` repository + `data/services/local/finger_scan`.

## Comandos

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome
flutter test
flutter analyze
```

Tests en `test/`: `incidencias_repository_remote_test.dart`,
`checador_discrepancy_test.dart`, `ingreso_manual_viewmodel_test.dart` y
`registros_completos_dialog_test.dart`. Un solo archivo:
`flutter test test/<archivo>.dart`.

## Build y despliegue

- Ruta publicada: `/<PREFIX>/recursos-humanos-v2` (ej.
  `/RNTV/recursos-humanos-v2`).
- Build web (usa el entrypoint de staging y `config.build.json`):

```bash
flutter build web --target lib/main_staging.dart \
  --dart-define-from-file=config.build.json \
  --base-href /RNTV/recursos-humanos-v2/
```

- Windows: `flutter build windows --target lib/main_staging.dart
  --dart-define-from-file=config.build.json` y el instalador de Inno Setup en
  `installers/desktop_inno_script.iss`.
- Rama de trabajo: `main` (ver `AGENTS.md` raíz).

