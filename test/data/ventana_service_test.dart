import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/data/services/ventana/ventana_service.dart';

/// Ventana de Windows de mentiras detrás del canal de window_manager.
/// Como en Windows, "unmaximize" no es inmediato: tarda 2 consultas.
class _VentanaWindows {
  _VentanaWindows({required this.maximizada});

  bool maximizada;
  int _consultasParaDesmaximizar = 0;
  final llamadas = <String>[];

  Future<Object?> responder(MethodCall llamada) async {
    switch (llamada.method) {
      case 'isMaximized':
        if (_consultasParaDesmaximizar > 0 && --_consultasParaDesmaximizar == 0) maximizada = false;
        return maximizada;
      case 'unmaximize':
        llamadas.add('unmaximize');
        _consultasParaDesmaximizar = 2;
      case 'maximize':
        llamadas.add('maximize');
        maximizada = true;
      case 'setFullScreen':
        final activa = (llamada.arguments as Map)['isFullScreen'] as bool;
        // Si sigue maximizada, window_manager deja la barra de título.
        llamadas.add('setFullScreen($activa${activa && maximizada ? ', MAXIMIZADA' : ''})');
    }
    return null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const canal = MethodChannel('window_manager');

  _VentanaWindows simular({required bool maximizada}) {
    final ventana = _VentanaWindows(maximizada: maximizada);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(canal, ventana.responder);
    addTearDown(() => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(canal, null));
    return ventana;
  }

  test('ventana maximizada: primero se desmaximiza, y al salir se vuelve a maximizar', () async {
    final ventana = simular(maximizada: true);
    final servicio = VentanaServiceWindows();

    await servicio.pantallaCompleta(true);
    expect(ventana.llamadas, ['unmaximize', 'setFullScreen(true)']);

    await servicio.pantallaCompleta(false);
    expect(ventana.llamadas, ['unmaximize', 'setFullScreen(true)', 'setFullScreen(false)', 'maximize']);
  });

  test('ventana normal: entra y sale sin maximizar nada', () async {
    final ventana = simular(maximizada: false);
    final servicio = VentanaServiceWindows();

    await servicio.pantallaCompleta(true);
    await servicio.pantallaCompleta(false);
    expect(ventana.llamadas, ['setFullScreen(true)', 'setFullScreen(false)']);
  });
}
