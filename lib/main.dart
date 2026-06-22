import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository.dart';
import 'package:ri_rh_v2/data/repositories/asistencia/asistencia_repository_remote.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/routing/router.dart';
import 'package:ri_rh_v2/ui/core/asistencia/widgets/asistencia_screen.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppThemeProvider()..loadTheme()),
          Provider(create: (context) =>
            ApiClient(
              dioFactory: () => Dio(
                BaseOptions(
                  baseUrl: 'http://localhost:8000',
                  connectTimeout: const Duration(seconds: 5),
                  receiveTimeout: const Duration(seconds: 5),
                ),
              ),
            ),
          ),
          Provider(create: (context) =>
            AsistenciaRepositoryRemote(
              apiClient: context.read(),
            ) as AsistenciaRepository,
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
      routerConfig: router(),
    );
  }
}
