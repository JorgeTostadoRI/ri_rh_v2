import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';

import 'config/dependencies.dart';
import 'main.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_staging.dart --dart-define-from-file=config.json`.
/// Uses remote data from a server.
void main() async {
  final providers = await providersRemote;

  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    LogManager.logger.error(
      'Platform/Async error caught',
      error: exception,
      stackTrace: stackTrace,
    );
    return true;
  };

  usePathUrlStrategy();
  initializeDateFormatting('es_ES', null).then((_) {    
    runApp(MultiProvider(providers: providers, child: const MainApp()));
  });
}