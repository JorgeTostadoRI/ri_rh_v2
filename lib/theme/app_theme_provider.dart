import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color primaryColor = Color(0xFFE87B1E);
const Color secondaryColor = Color(0xFFFFF0DC);

class AppThemeProvider extends ChangeNotifier {
  bool darkMode = false;

  ThemeData get appTheme => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primaryColor,
        brightness: darkMode ? Brightness.dark : Brightness.light,
      );

  void toggleBrightness(bool value) {
    darkMode = value;
    notifyListeners();
    saveTheme(value);
  }

  void saveTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    darkMode = prefs.getBool('darkMode') ?? false;
    notifyListeners();
  }
}
