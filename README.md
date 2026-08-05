# ri_rh_v2

RI - Recursos Humanos V2

## Release

### Windows

Para realizar un release para Windows se requiere que tengas [Inno Setup](https://jrsoftware.org/isinfo.php) instalado.

#### 1. Compilar ejecutable de aplicación

```sh
flutter build windows --target lib/main_staging.dart --dart-define-from-file=config.build.json
```

#### 2. Compilar instalador con Inno Setup

Abre el archivo `installers/desktop_inno_script.iss` con Inno Setup y selecciona la opción de `Compile` o usa la
combinación de teclas `CTRL+F9`, se creará un instalador con el nombre `ri_rh_{version_number}_setup.exe`.

### Web

```sh
flutter build web --target lib/main_staging.dart --dart-define-from-file=config.build.json
```
