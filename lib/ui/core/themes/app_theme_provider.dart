import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color primaryColor = Color(0xFFE87B1E);
const Color secondaryColor = Color(0xFFFFF0DC);
const Color headingTextColor = Color(0xFF2D1E0F);
const Color labelTextColor = Color(0xFF9A7B5A);
const Color successColor = Color(0xFF52C41A);
const Color errorColor = Color(0xFFDB4444);
const Color backgroundColor = Color(0xFFFFF0DC);
const Color borderColor = Color(0xFFF5E8D8);
const Color inputFillColor = Color(0xFFFDFBF7);

class AppThemeProvider extends ChangeNotifier {
  bool darkMode = false;

  ThemeData get appTheme => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: primaryColor,
    brightness: darkMode ? Brightness.dark : Brightness.light,
    fontFamily: 'Inter',
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(0xFFC4A47A),
        fontWeight: .w700,
      ),
      border: WidgetStateInputBorder.fromMap({
        WidgetState.focused: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        WidgetState.error: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor, width: 0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        WidgetState.any: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 0.8),
          borderRadius: BorderRadius.circular(16),
        ),
      }),
      filled: true,
      fillColor: inputFillColor,
    ),
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
