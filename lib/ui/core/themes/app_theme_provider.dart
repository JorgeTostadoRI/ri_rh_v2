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

const Color statusSuccessBgColor = Color(0xFFDCFCE7);
const Color statusWarningBgColor = Color(0xFFFFEDD4);
const Color statusFailureBgColor = Color(0xFFFFE2E2);
const Color statusSuccessColor = Color(0xFF00A63E);
const Color statusWarningColor = Color(0xFFF54900);
const Color statusFailureColor = Color(0xFFE7000B);

class AppThemeProvider extends ChangeNotifier {
  bool darkMode = false;

  ThemeData get appTheme => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: primaryColor,
    brightness: darkMode ? Brightness.dark : Brightness.light,
    fontFamily: 'Inter',
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: headingTextColor,
        fontFamily: 'Inter',
        fontSize: 30,
        fontWeight: .w900,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        color: headingTextColor,
        fontFamily: 'Inter',
        fontSize: 26,
        fontWeight: .w900,
        height: 1.2,
      ),
      headlineSmall: TextStyle(
        color: headingTextColor,
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: .w900,
        height: 1.4,
      ),
      titleLarge: TextStyle(
        color: labelTextColor,
        fontFamily: 'Inter',
        fontSize: 18,
        fontWeight: .w500,
        height: 1.2,
      ),
      titleMedium: TextStyle(
        color: labelTextColor,
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: .w500,
        height: 1.2,
      ),
      titleSmall: TextStyle(
        color: labelTextColor,
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: .w500,
        height: 1.42,
      ),
      labelLarge: TextStyle(
        color: labelTextColor,
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: .w500,
        height: 1.2,
      ),
      labelMedium: TextStyle(
        color: labelTextColor,
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: .w500,
        height: 1.2,
      ),
      labelSmall: TextStyle(
        color: labelTextColor,
        fontFamily: 'Inter',
        fontSize: 11,
        fontWeight: .w500,
        height: 1.2,
      ),
      bodyLarge: TextStyle(
        color: headingTextColor,
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: .w500,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: headingTextColor,
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: .w500,
        height: 1.42,
      ),
      bodySmall: TextStyle(
        color: headingTextColor,
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: .w500,
        height: 1.33,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(0xFFC4A47A),
        fontWeight: .w700,
        fontFamily: 'Inter',
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
    // PRIMARY BUTTONS
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shadowColor: primaryColor,
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: .w700,
          height: 1.5,
          fontFamily: 'Inter',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
    ),
    // SECONDARY BUTTONS
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        foregroundColor: labelTextColor,
        surfaceTintColor: inputFillColor,
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: .w700,
          height: 1.5,
          fontFamily: 'Inter',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        side: BorderSide(
          color: borderColor,
          width: 0.8,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
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
