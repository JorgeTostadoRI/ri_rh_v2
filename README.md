# ri_rh_v2

RI - Recursos Humanos V2

## Requisitos

- ZKFinger SDK para Windows

## Desarrollo

### 1. Crear variables de entorno

Utilizando el `config.example.json` como ejemplo, crea un `config.json` para variables de entorno de desarrollo.

### 2. Debug y Staging

Existen dos puntos de entrada para la aplicación:

- **DEBUG**: a través de `flutter run --target lib/main_development.dart` que utiliza datos de prueba completamente
locales y que simula todos los servicios externos.

- **STAGING**: a través de `flutter run --target lib/main_staging.dart --dart-define-from-file=config.json` que conecta
con servicios externos como el escaneador de huella y la API.

Si estás usando Visual Studio Code ya existen configuraciones para ambas entradas en `.vscode/launch.json` que puedes
correr directamente en el tab de `Run and Debug`.

## Release

### Configuración

#### 1. Crear variables de entorno

Utilizando el `config.example.json` como ejemplo, crea un `config.build.json` para variables de entorno de producción.

### Windows

Para realizar un release para Windows se recomienda usar [Inno Setup](https://jrsoftware.org/isinfo.php) para generar un
instalador de la aplicación.

Ten en cuenta que la aplicación requerirá de un escaner de huellas ZKTeco compatible con el SDK ZKFinger y que el equipo
donde se instale la aplicación deberá de haber instalado el SDK de ZKFinger para ofrecer todas las funcionalidades
relacionadas a huellas.

#### 1. Compilar ejecutable de aplicación

```sh
flutter build windows --target lib/main_staging.dart --dart-define-from-file=config.build.json
```

#### 2. Compilar instalador con Inno Setup

Abre el archivo `installers/desktop_inno_script.iss` con Inno Setup y selecciona la opción de `Compile` o usa la
combinación de teclas `CTRL+F9`, se creará un instalador con el nombre `ri_rh_{version_number}_setup.exe`.

#### 3. Publicar

Comparte el instalador en un release o distribuye directamente el archivo.

### Web

No se requieren otras dependencias para compilar en web.

#### 1. Compilar aplicación para web

```sh
flutter build web --target lib/main_staging.dart --dart-define-from-file=config.build.json
```

#### 2. Publicar

Puedes publicar la aplicación en servicios de la nube como Cloudfront, Google Cloud CDN, Cloudflare CDN, etc. o en un
servidor privado a través de NGINX.