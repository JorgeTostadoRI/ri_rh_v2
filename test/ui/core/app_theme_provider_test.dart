import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  tearDown(() => debugModoOscuroDisponible = null);

  // En web todas las apps comparten el dominio y la clave 'darkMode' de
  // SharedPreferences: Compras en oscuro no debe pintar RH en oscuro.
  test('aunque otra app guardó modo oscuro, RH abre en tema claro', () async {
    SharedPreferences.setMockInitialValues({'darkMode': true});

    final tema = AppThemeProvider();
    await pumpEventQueue();

    expect(tema.darkMode, isFalse);
    expect(tema.appTheme.brightness, Brightness.light);
  });

  test('cambiar el tema de RH no toca la preferencia de las otras apps', () async {
    SharedPreferences.setMockInitialValues({'darkMode': true});

    AppThemeProvider().toggleBrightness(false);
    await pumpEventQueue();

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool('darkMode'), isTrue);
    expect(prefs.getBool(claveModoOscuroRH), isFalse);
  });

  group('modo oscuro solo en debug', () {
    test('en debug se prende, se guarda con su propia clave y se recuerda', () async {
      debugModoOscuroDisponible = true;
      SharedPreferences.setMockInitialValues({});

      final tema = AppThemeProvider()..toggleBrightness(true);
      await pumpEventQueue();

      expect(tema.appTheme.brightness, Brightness.dark);
      expect(tema.appTheme.extension<RhColores>(), RhColores.oscuro);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool(claveModoOscuroRH), isTrue);
      expect(prefs.containsKey('darkMode'), isFalse);

      final otraVez = AppThemeProvider();
      await pumpEventQueue();
      expect(otraVez.appTheme.brightness, Brightness.dark);
    });

    test('en producción siempre es claro, aunque esté guardado el oscuro', () async {
      debugModoOscuroDisponible = false;
      SharedPreferences.setMockInitialValues({claveModoOscuroRH: true, 'darkMode': true});

      final tema = AppThemeProvider();
      await pumpEventQueue();
      expect(tema.appTheme.brightness, Brightness.light);

      tema.toggleBrightness(true);
      await pumpEventQueue();
      expect(tema.appTheme.brightness, Brightness.light);
      expect(tema.appTheme.extension<RhColores>(), RhColores.claro);
    });
  });

  test('la paleta clara tiene los mismos colores de siempre', () {
    const c = RhColores.claro;
    expect(c.primario, primaryColor);
    expect(c.fondo, backgroundColor);
    expect(c.titulo, headingTextColor);
    expect(c.etiqueta, labelTextColor);
    expect(c.borde, borderColor);
    expect(c.relleno, inputFillColor);
    expect(c.exito, successColor);
    expect(c.error, errorColor);
    expect(c.exitoFondo, statusSuccessBgColor);
    expect(c.avisoFondo, statusWarningBgColor);
    expect(c.falloFondo, statusFailureBgColor);
    expect(c.exitoTexto, statusSuccessColor);
    expect(c.avisoTexto, statusWarningColor);
    expect(c.falloTexto, statusFailureColor);
  });
}
