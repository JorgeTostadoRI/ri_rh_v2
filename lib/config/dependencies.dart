import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository_local.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository_dev.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/avisos/avisos_repository.dart';
import 'package:ri_rh_v2/data/repositories/avisos/avisos_repository_local.dart';
import 'package:ri_rh_v2/data/repositories/avisos/avisos_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository_local.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository_local.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository_local.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository_local.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository.dart';
import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository_local.dart';
import 'package:ri_rh_v2/data/repositories/reportes/reportes_repository_remote.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/auth_api_client.dart';
import 'package:ri_rh_v2/data/services/device_auth_service.dart';
import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_dev.dart';
import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service_factory.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/data/services/shared_preferences_service.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/notification_viewmodel.dart';

Dio _dioClient() {
  const apiUrl = String.fromEnvironment('api_url', defaultValue: 'http://localhost:8000');
  return Dio(
    BaseOptions(
      baseUrl: apiUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
}

List<SingleChildWidget> get _sharedProviders {
  return [
    ChangeNotifierProvider(create: (_) => AppThemeProvider()..loadTheme()),
    Provider(create: (_) => DeviceAuthService()),
  ];
}

Future<List<SingleChildWidget>> get providersLocal async {
  await LogManager.init(debug: true);

  return [
    ..._sharedProviders,
    Provider.value(value: LogManager.logger),
    Provider.value(value: LocalDataService()),
    Provider(create: (context) =>
      FingerScanDev() as FingerScanService,
    ),
    ChangeNotifierProvider(create:(context) =>
      AuthRepositoryDev(
        log: context.read(),
        localDataService: context.read(),
      ) as AuthRepository
    ),
    Provider(create: (context) =>
      AsistenciaRepositoryLocal() as AsistenciaRepository
    ),
    Provider(create: (context) =>
      IncidenciasRepositoryLocal(
        authRepository: context.read(),
        localDataService: context.read(),
      ) as IncidenciasRepository
    ),
    Provider(create: (context) =>
      AvisosRepositoryLocal(
        localDataService: context.read(),
      ) as AvisosRepository
    ),
    Provider(create: (context) =>
      FingerprintRepositoryLocal(
        log: context.read(),
        localDataService: context.read(),
      ) as FingerprintRepository
    ),
    Provider(create: (context) =>
      EmpleadosRepositoryLocal(
        localDataService: context.read(),
      ) as EmpleadosRepository
    ),
    Provider(create: (context) =>
      PracticantesRepositoryLocal(
        localDataService: context.read(),
      ) as PracticantesRepository
    ),
    Provider(create: (context) =>
      ReportesRepositoryLocal(
        localDataService: context.read(),
      ) as ReportesRepository
    ),
    ChangeNotifierProvider(create: (context) =>
      NotificationViewmodel(
        log: context.read(),
        authRepository: context.read(),
        incidenciasRepository: context.read(),
      )
    ),
  ];
}

Future<List<SingleChildWidget>> get providersRemote async {
  await LogManager.init();
  final fingerScanService = getFingerScanService(LogManager.logger);
  fingerScanService.init();

  return [
    ..._sharedProviders,
    Provider.value(value: LogManager.logger),
    Provider(create: (context) =>
      SharedPreferencesService(
        log: context.read(),
      )
    ),
    Provider.value(value: fingerScanService),
    Provider(create: (context) =>
      AuthApiClient(
        dioFactory: _dioClient,
      ),  
    ),
    Provider(create: (context) =>
      ApiClient(
        dioFactory: _dioClient,
      ),
    ),
    ChangeNotifierProvider(create: (context) =>
      AuthRepositoryRemote(
        log: context.read(),
        apiClient: context.read(),
        authApiClient: context.read(),
        sharedPreferencesService: context.read(),
        deviceAuthService: context.read(),
      ) as AuthRepository
    ),
    Provider(create: (context) =>
      AsistenciaRepositoryRemote(
        apiClient: context.read(),
      ) as AsistenciaRepository
    ),
    Provider(create: (context) =>
      IncidenciasRepositoryRemote(
        apiClient: context.read(),
      ) as IncidenciasRepository
    ),
    Provider(create: (context) =>
      AvisosRepositoryRemote(
        apiClient: context.read(),
      ) as AvisosRepository
    ),
    Provider(create: (context) =>
      FingerprintRepositoryRemote(
        log: context.read(),
        fingerScanService: context.read(),
        apiClient: context.read(),
      ) as FingerprintRepository
    ),
    Provider(create: (context) =>
      EmpleadosRepositoryRemote(
        log: context.read(),
        apiClient: context.read(),
      ) as EmpleadosRepository,
    ),
    Provider(create: (context) =>
      PracticantesRepositoryRemote(
        log: context.read(),
        apiClient: context.read(),
      ) as PracticantesRepository
    ),
    Provider(create: (context) =>
      ReportesRepositoryRemote(
        log: context.read(),
        apiClient: context.read(),
      ) as ReportesRepository
    ),
    ChangeNotifierProvider(create: (context) =>
      NotificationViewmodel(
        log: context.read(),
        authRepository: context.read(),
        incidenciasRepository: context.read(),
      )
    ),
  ];
}