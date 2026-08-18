import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'config/dependencies.dart';
import 'main.dart';

/// Development config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
/// Uses local data.
void main() async {
  final providers = await providersLocal;

  initializeDateFormatting('es_ES', null).then((_) {    
    runApp(MultiProvider(providers: providers, child: const MainApp()));
  });
}