import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ri_rh_v2/data/services/ventana/ventana_service.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Preferencia de pantalla completa de la app de Windows.
const clavePantallaCompletaRH = 'rh_pantallaCompleta';

/// Pantalla completa de la app de Windows (sin barra de título ni barra de
/// tareas):
/// - F11 entra y sale.
/// - Esc sale, salvo que haya una ventana emergente abierta (ahí Esc la cierra
///   como siempre).
/// - Se recuerda para la próxima vez que se abra la app.
///
/// En el navegador no hace nada: ahí F11 es del navegador.
class PantallaCompletaViewmodel extends ChangeNotifier {
  PantallaCompletaViewmodel({required this.ventana, bool? disponible})
      : disponible = disponible ?? esAppWindows;

  final VentanaService ventana;

  /// `false` en el navegador: ahí no se registra ninguna tecla.
  final bool disponible;

  bool _activa = false;
  bool get activa => _activa;

  bool _iniciado = false;

  /// Registra F11/Esc y, si la última vez se dejó en pantalla completa,
  /// vuelve a entrar.
  Future<void> iniciar() async {
    if (!disponible || _iniciado) return;
    _iniciado = true;
    HardwareKeyboard.instance.addHandler(_teclaPresionada);
    try {
      await ventana.iniciar();
    } catch (_) {
      // Sin acceso a la ventana no hay pantalla completa, pero la app sigue.
      return;
    }
    if (await _leerPreferencia()) await cambiar(true);
  }

  Future<void> alternar() => cambiar(!_activa);

  Future<void> cambiar(bool activa) async {
    if (!disponible || activa == _activa) return;
    _activa = activa;
    notifyListeners();
    try {
      await ventana.pantallaCompleta(activa);
    } catch (_) {}
    await _guardarPreferencia(activa);
  }

  bool _teclaPresionada(KeyEvent evento) {
    if (evento is! KeyDownEvent) return false;
    if (evento.logicalKey == LogicalKeyboardKey.f11) {
      alternar();
      return true;
    }
    if (evento.logicalKey == LogicalKeyboardKey.escape && _activa && !_hayVentanaEmergente) {
      cambiar(false);
    }
    // Esc no se consume: lo demás de la app sigue recibiéndolo.
    return false;
  }

  /// Ventanas emergentes, menús y listas desplegables toman el foco dentro de
  /// su propia ruta (PopupRoute).
  static bool get _hayVentanaEmergente {
    final contexto = FocusManager.instance.primaryFocus?.context;
    if (contexto == null || !contexto.mounted) return false;
    return ModalRoute.of(contexto) is PopupRoute;
  }

  Future<bool> _leerPreferencia() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(clavePantallaCompletaRH) ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<void> _guardarPreferencia(bool activa) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(clavePantallaCompletaRH, activa);
    } catch (_) {}
  }

  @override
  void dispose() {
    if (_iniciado) HardwareKeyboard.instance.removeHandler(_teclaPresionada);
    super.dispose();
  }
}
