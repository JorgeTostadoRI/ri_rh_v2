import 'package:window_manager/window_manager.dart';

/// La ventana de la app de escritorio. Separado en una interfaz para poder
/// probar la pantalla completa sin una ventana real.
abstract class VentanaService {
  Future<void> iniciar();

  Future<void> pantallaCompleta(bool activa);

  Future<void> minimizar();

  /// Igual que la X de la barra de título: la app pasa por su cierre normal
  /// (libera el lector de huellas y cierra la sesión).
  Future<void> cerrar();

  /// El título que muestra Windows en la barra de la ventana.
  Future<String> titulo();
}

/// App de Windows: usa el paquete window_manager.
class VentanaServiceWindows implements VentanaService {
  bool _maximizadaAntes = false;

  @override
  Future<void> iniciar() => windowManager.ensureInitialized();

  /// window_manager, si la ventana está maximizada, la estira a todo el
  /// monitor pero deja la barra de título de Windows. Por eso primero se
  /// desmaximiza, y al salir se vuelve a maximizar.
  @override
  Future<void> pantallaCompleta(bool activa) async {
    if (activa) {
      _maximizadaAntes = await windowManager.isMaximized();
      if (_maximizadaAntes) {
        await windowManager.unmaximize();
        // unmaximize solo le avisa a Windows; hay que esperar a que lo haga.
        for (var i = 0; i < 40 && await windowManager.isMaximized(); i++) {
          await Future<void>.delayed(const Duration(milliseconds: 25));
        }
      }
      await windowManager.setFullScreen(true);
    } else {
      await windowManager.setFullScreen(false);
      if (_maximizadaAntes) await windowManager.maximize();
      _maximizadaAntes = false;
    }
  }

  @override
  Future<void> minimizar() => windowManager.minimize();

  @override
  Future<void> cerrar() => windowManager.close();

  @override
  Future<String> titulo() => windowManager.getTitle();
}
