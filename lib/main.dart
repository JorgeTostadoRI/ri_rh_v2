import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/services/device_auth_service.dart';
import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';
import 'package:ri_rh_v2/routing/router.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/main_development.dart' as development;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  development.main();
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AppLifecycleListener _lifecycleListener;
  late final GoRouter _router;

  void _cleanUpFingerScanner() {
    Provider.of<FingerScanService>(context, listen: false).dispose();
  }

  Future<void> _logout() async {
    Provider.of<AuthRepository>(context, listen: false).logout();
  }

  @override
  void initState() {
    super.initState();
    _lifecycleListener = AppLifecycleListener(
      onExitRequested: () async {
        _cleanUpFingerScanner();
        await _logout();
        return AppExitResponse.exit;
      }
    );
    _router = router(context.read());
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<DeviceAuthService>(context).initializeDevice();
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
      routerConfig: _router,
    );
  }
}
