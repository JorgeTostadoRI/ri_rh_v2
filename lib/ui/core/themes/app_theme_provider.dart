import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color primaryColor = Color(0xFFE87B1E);
const Color secondaryColor = Color(0xFFFFF0DC);
const Color headingTextColor = Color(0xFF2D1E0F);
const Color labelTextColor = Color(0xFF9A7B5A);
const Color successColor = Color(0xFF52C41A);
const Color errorColor = Color(0xFFDB4444);
const Color backgroundColor = Color(0xFFFFF0DC);

class AppThemeProvider extends ChangeNotifier {
  bool darkMode = false;

  ThemeData get appTheme => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primaryColor,
        brightness: darkMode ? Brightness.dark : Brightness.light,
        fontFamily: 'Inter',
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
