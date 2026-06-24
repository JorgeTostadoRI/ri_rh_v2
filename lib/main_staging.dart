import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';
import 'main.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_staging.dart --dart-define-from-file=config.json`.
/// Uses remote data from a server.
void main() {
  Logger.level = Level.all;

  runApp(MultiProvider(providers: providersRemote, child: const MainApp()));
}