import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository_remote.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository_local.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/auth_api_client.dart';
import 'package:ri_rh_v2/data/services/shared_preferences_service.dart';
import 'package:ri_rh_v2/routing/router.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

Dio baseDio() {
  return Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8000',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppThemeProvider()..loadTheme()),
          Provider(create: (context) => SharedPreferencesService()),
          Provider(create: (context) =>
            AuthApiClient(
              dioFactory: baseDio,
            ),  
          ),
          Provider(create: (context) =>
            ApiClient(
              dioFactory: baseDio,
            ),
          ),
          Provider(create: (context) =>
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
          Provider(create: (context) =>
            IncidenciasRepositoryLocal() as IncidenciasRepository,
          ),
        ],
        child: const MyApp(),
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp.router(
      title: 'RI - Recursos Humanos',
      theme: themeProvider.appTheme,
      routerConfig: router(context.read()),
    );
  }
}
