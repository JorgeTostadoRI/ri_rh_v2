import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository_local.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository_dev.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository_local.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/auth_api_client.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/data/services/shared_preferences_service.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

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
  ];
}

List<SingleChildWidget> get providersLocal {
  return [
    Provider.value(value: LocalDataService()),
    ChangeNotifierProvider(create:(context) =>
      AuthRepositoryDev(
        localDataService: context.read(),
      ) as AuthRepository,
    ),
    Provider(create: (context) =>
      AsistenciaRepositoryLocal() as AsistenciaRepository
    ),
    Provider(create: (context) =>
      IncidenciasRepositoryLocal() as IncidenciasRepository,
    ),
    ..._sharedProviders,
  ];
}

List<SingleChildWidget> get providersRemote {
  return [
    Provider(create: (context) => SharedPreferencesService()),
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
        apiClient: context.read(),
        authApiClient: context.read(),
        sharedPreferencesService: context.read(),
      ) as AuthRepository,
    ),
    Provider(create: (context) =>
      AsistenciaRepositoryRemote(
        apiClient: context.read(),
      ) as AsistenciaRepository,
    ),
    ..._sharedProviders,
  ];
}