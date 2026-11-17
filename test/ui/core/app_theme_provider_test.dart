import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
  });
}
