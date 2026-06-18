import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ri_rh_v2/ui/core/attendance/widgets/attendance_screen.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppThemeProvider()..loadTheme()),
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

    return MaterialApp(
      title: 'RI - Recursos Humanos',
      theme: themeProvider.appTheme,
      home: CollapsibleSidebar(child: AttendanceScreen()),
    );
  }
}
