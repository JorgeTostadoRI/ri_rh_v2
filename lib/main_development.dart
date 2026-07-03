import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'config/dependencies.dart';
import 'main.dart';

/// Development config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
/// Uses local data.
void main() {
  Logger.level = Level.all;

  usePathUrlStrategy();
  initializeDateFormatting('es_ES', null).then((_) {    
    runApp(MultiProvider(providers: providersLocal, child: const MainApp()));
  });
}