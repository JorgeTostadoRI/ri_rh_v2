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

No hay carpeta `test/` con tests propios actualmente; si agregas tests, crea
`test/` y sigue el patrón del resto de apps.

Builds: `windows/`, `web/` e `installers/`.
