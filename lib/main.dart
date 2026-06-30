import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ri_rh_v2/routing/router.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/main_development.dart' as development;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
