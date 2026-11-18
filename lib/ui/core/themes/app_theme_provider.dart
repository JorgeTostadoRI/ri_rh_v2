import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/rh_colores.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'package:ri_rh_v2/ui/core/themes/rh_colores.dart';

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

/// El modo oscuro está en construcción: solo se puede usar corriendo la app en
/// modo debug (`flutter run`). En las versiones compiladas (web y Windows) no
/// aparece el interruptor y siempre es tema claro.
bool get modoOscuroDisponible => debugModoOscuroDisponible ?? kDebugMode;

/// Solo para pruebas: las pruebas corren en debug; esto permite ver la app
/// como en producción (`false`). Siempre regresarlo a `null`.
@visibleForTesting
bool? debugModoOscuroDisponible;

/// Preferencia del modo oscuro, solo de RH. Nunca 'darkMode': esa clave la
/// comparten todas las apps del dominio (ver [AppThemeProvider.toggleBrightness]).
const claveModoOscuroRH = 'rh_darkMode';

class AppThemeProvider extends ChangeNotifier {
  AppThemeProvider() {
    if (modoOscuroDisponible) _cargarPreferencia();
  }

  bool darkMode = false;

  /// Si ya se movió el interruptor, la preferencia guardada no lo pisa.
  bool _cambiadoAMano = false;

  /// `true` solo si el modo oscuro está prendido y se puede usar (debug).
  bool get oscuro => darkMode && modoOscuroDisponible;

  ThemeData get appTheme => oscuro ? _tema(RhColores.oscuro) : _tema(RhColores.claro);

  ThemeData _tema(RhColores c) => ThemeData(
    useMaterial3: true,
    // Tema claro: exactamente como siempre (colorSchemeSeed). Oscuro: la misma
    // semilla, con fondos y tarjetas cafés de la paleta de RH.
    colorSchemeSeed: oscuro ? null : c.primario,
    colorScheme: oscuro
        ? ColorScheme.fromSeed(seedColor: c.primario, brightness: Brightness.dark).copyWith(
            primary: c.primario,
            onPrimary: Colors.white,
            surface: c.superficie,
            onSurface: c.titulo,
            // Ventanas, menús y tarjetas sin color propio: cafés de la paleta.
            surfaceContainerLowest: c.fondo,
            surfaceContainerLow: c.superficie,
            surfaceContainer: c.superficie,
            surfaceContainerHigh: const Color(0xFF2A2017),
            surfaceContainerHighest: const Color(0xFF33271C),
            onSurfaceVariant: c.etiqueta,
            outline: c.borde,
            outlineVariant: c.borde,
            error: c.error,
          )
        : null,
    brightness: oscuro ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: oscuro ? c.fondo : null,
    canvasColor: oscuro ? c.superficie : null,
    dividerColor: oscuro ? c.borde : null,
    // En oscuro la barra de desplazamiento por defecto sale casi blanca.
    scrollbarTheme: oscuro
        ? ScrollbarThemeData(thumbColor: WidgetStatePropertyAll(c.bordeAcento))
        : null,
    extensions: [c],
    fontFamily: 'Inter',
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: c.titulo,
        fontFamily: 'Inter',
        fontSize: 30,
        fontWeight: .w900,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        color: c.titulo,
        fontFamily: 'Inter',
        fontSize: 26,
        fontWeight: .w900,
        height: 1.2,
      ),
      headlineSmall: TextStyle(
        color: c.titulo,
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: .w900,
        height: 1.4,
      ),
      titleLarge: TextStyle(
        color: c.etiqueta,
        fontFamily: 'Inter',
        fontSize: 18,
        fontWeight: .w500,
        height: 1.2,
      ),
      titleMedium: TextStyle(
        color: c.etiqueta,
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: .w500,
        height: 1.2,
      ),
      titleSmall: TextStyle(
        color: c.etiqueta,
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: .w500,
        height: 1.42,
      ),
      labelLarge: TextStyle(
        color: c.etiqueta,
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: .w500,
        height: 1.2,
      ),
      labelMedium: TextStyle(
        color: c.etiqueta,
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: .w500,
        height: 1.2,
      ),
      labelSmall: TextStyle(
        color: c.etiqueta,
        fontFamily: 'Inter',
        fontSize: 11,
        fontWeight: .w500,
        height: 1.2,
      ),
      bodyLarge: TextStyle(
        color: c.titulo,
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: .w500,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: c.titulo,
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: .w500,
        height: 1.42,
      ),
      bodySmall: TextStyle(
        color: c.titulo,
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: .w500,
        height: 1.33,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: c.etiquetaSuave,
        fontWeight: .w700,
        fontFamily: 'Inter',
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: c.borde, width: 0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: c.primario, width: 0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: c.error, width: 0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: c.borde, width: 0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: c.borde, width: 0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      filled: true,
      fillColor: c.relleno,
    ),
    // PRIMARY BUTTONS
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        backgroundColor: c.primario,
        foregroundColor: Colors.white,
        shadowColor: c.primario,
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
        foregroundColor: c.etiqueta,
        surfaceTintColor: c.relleno,
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
          color: c.borde,
          width: 0.8,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: c.primario,
    ),
  );

  /// Nunca se usa la clave 'darkMode' de SharedPreferences a propósito: en web
  /// todas las apps (Compras, Producción, Facturas...) comparten el dominio y
  /// esa clave, así que el modo oscuro de otra app se colaba aquí. RH guarda
  /// el suyo en [claveModoOscuroRH], y solo en debug.
  void toggleBrightness(bool value) {
    darkMode = value;
    _cambiadoAMano = true;
    notifyListeners();
    if (modoOscuroDisponible) _guardarPreferencia(value);
  }

  // Si no se puede leer o guardar la preferencia, simplemente se queda como
  // está (claro al abrir): no vale la pena romper la app por esto.
  Future<void> _guardarPreferencia(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(claveModoOscuroRH, value);
    } catch (_) {}
  }

  Future<void> _cargarPreferencia() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final guardado = prefs.getBool(claveModoOscuroRH) ?? false;
      if (!_cambiadoAMano && guardado != darkMode) {
        darkMode = guardado;
        notifyListeners();
      }
    } catch (_) {}
  }
}
