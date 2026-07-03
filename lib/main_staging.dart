import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'config/dependencies.dart';
import 'main.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_staging.dart --dart-define-from-file=config.json`.
/// Uses remote data from a server.
void main() {
  Logger.level = Level.all;

  usePathUrlStrategy();
  initializeDateFormatting('es_ES', null).then((_) {    
    runApp(MultiProvider(providers: providersRemote, child: const MainApp()));
  });
}