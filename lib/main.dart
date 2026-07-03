import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('es'),
        Locale('en'),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == deviceLocale?.languageCode) {
            Intl.defaultLocale = deviceLocale.toString();
            return deviceLocale;
          }
        }

        return const Locale('en');
      },
      routerConfig: router(context.read()),
    );
  }
}
