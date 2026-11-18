import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/services/ventana/ventana_service.dart';
import 'package:ri_rh_v2/ui/core/ui/aviso_pantalla_completa.dart';
import 'package:ri_rh_v2/ui/core/ui/barra_titulo_pantalla_completa.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/pantalla_completa_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Ventana de mentiras: guarda lo que se le pidió.
class _Ventana implements VentanaService {
  final llamadas = <bool>[];
  bool iniciada = false;
  int minimizada = 0;
  int cerrada = 0;

  @override
  Future<void> iniciar() async => iniciada = true;

  @override
  Future<void> pantallaCompleta(bool activa) async => llamadas.add(activa);

  @override
  Future<void> minimizar() async => minimizada++;

  @override
  Future<void> cerrar() async => cerrada++;

  @override
  Future<String> titulo() async => 'ri_rh_v2';
}

const _pantalla = Size(800, 600);

Future<PantallaCompletaViewmodel> _abrir(
  WidgetTester tester, {
  bool disponible = true,
  Map<String, Object> guardado = const {},
  _Ventana? ventana,
}) async {
  tester.view.physicalSize = _pantalla;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  SharedPreferences.setMockInitialValues(guardado);
  final vm = PantallaCompletaViewmodel(ventana: ventana ?? _Ventana(), disponible: disponible);
  addTearDown(vm.dispose);
  await vm.iniciar();

  await tester.pumpWidget(ChangeNotifierProvider.value(
    value: vm,
    child: MaterialApp(
      // Igual que en main.dart.
      builder: (context, child) => AvisoPantallaCompleta(
        child: BarraTituloPantallaCompleta(child: child!),
      ),
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => const AlertDialog(content: Text('ventana abierta')),
              ),
              child: const Text('abrir'),
            ),
          ),
        ),
      ),
    ),
  ));
  return vm;
}

Future<bool?> _guardado() async => (await SharedPreferences.getInstance()).getBool(clavePantallaCompletaRH);

Future<void> _entrarYQuitarAviso(WidgetTester tester) async {
  await tester.sendKeyEvent(LogicalKeyboardKey.f11);
  await tester.pumpAndSettle(const Duration(seconds: 5));
}

final _barra = find.byKey(const Key('barraTitulo'));

/// La barra está a la vista (no escondida arriba de la pantalla).
bool _barraVisible(WidgetTester tester) => tester.getRect(_barra).bottom > 0;

Future<TestGesture> _mouse(WidgetTester tester) async {
  final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
  await mouse.addPointer(location: const Offset(400, 300));
  addTearDown(mouse.removePointer);
  await tester.pump();
  return mouse;
}

void main() {
  group('F11 y Esc', () {
    testWidgets('F11 entra y sale de pantalla completa, y avisa cómo salir', (tester) async {
      final ventana = _Ventana();
      final vm = await _abrir(tester, ventana: ventana);
      expect(vm.activa, isFalse);

      await tester.sendKeyEvent(LogicalKeyboardKey.f11);
      await tester.pump();
      expect(vm.activa, isTrue);
      expect(ventana.llamadas, [true]);
      expect(await _guardado(), isTrue);
      expect(find.text(AvisoPantallaCompleta.mensaje), findsOneWidget);

      await tester.sendKeyEvent(LogicalKeyboardKey.f11);
      await tester.pump();
      expect(vm.activa, isFalse);
      expect(ventana.llamadas, [true, false]);
      expect(await _guardado(), isFalse);
    });

    testWidgets('Esc sale de pantalla completa', (tester) async {
      final vm = await _abrir(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.f11);
      await tester.pump();

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pump();
      expect(vm.activa, isFalse);
    });

    testWidgets('con una ventana emergente abierta, Esc la cierra y sigue en pantalla completa', (tester) async {
      final vm = await _abrir(tester);
      await _entrarYQuitarAviso(tester);

      // Los clics siguen llegando al contenido en pantalla completa.
      await tester.tap(find.text('abrir'));
      await tester.pumpAndSettle();
      expect(find.text('ventana abierta'), findsOneWidget);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();
      expect(find.text('ventana abierta'), findsNothing);
      expect(vm.activa, isTrue);

      // Ya sin la ventana, Esc sí sale.
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pump();
      expect(vm.activa, isFalse);
    });

    testWidgets('recuerda la pantalla completa para la próxima vez', (tester) async {
      final ventana = _Ventana();
      final vm = await _abrir(tester, ventana: ventana, guardado: {clavePantallaCompletaRH: true});

      expect(ventana.iniciada, isTrue);
      expect(vm.activa, isTrue);
      expect(ventana.llamadas, [true]);
    });

    testWidgets('en el navegador no hace nada: F11 sigue siendo del navegador', (tester) async {
      final ventana = _Ventana();
      final vm = await _abrir(tester, ventana: ventana, disponible: false, guardado: {clavePantallaCompletaRH: true});

      await tester.sendKeyEvent(LogicalKeyboardKey.f11);
      await tester.pump();
      expect(vm.activa, isFalse);
      expect(ventana.iniciada, isFalse);
      expect(ventana.llamadas, isEmpty);
      expect(find.text(AvisoPantallaCompleta.mensaje), findsNothing);
      expect(_barra, findsNothing);
    });

    test('en las pruebas (que no son la app de Windows) no está disponible', () {
      expect(PantallaCompletaViewmodel(ventana: _Ventana()).disponible, isFalse);
    });
  });

  group('barra de título en pantalla completa', () {
    testWidgets('fuera de pantalla completa no existe', (tester) async {
      await _abrir(tester);
      expect(_barra, findsNothing);
      expect(find.byKey(const Key('zonaBarraTitulo')), findsNothing);
    });

    testWidgets('baja al acercar el mouse a la esquina de arriba a la derecha y se esconde al alejarlo',
        (tester) async {
      await _abrir(tester);
      await _entrarYQuitarAviso(tester);
      final mouse = await _mouse(tester);
      expect(_barraVisible(tester), isFalse);

      // Arriba a la izquierda no sale.
      await mouse.moveTo(const Offset(20, 2));
      await tester.pumpAndSettle();
      expect(_barraVisible(tester), isFalse);

      // En la esquina de los botones de cerrar sí.
      await mouse.moveTo(Offset(_pantalla.width - 10, 2));
      await tester.pumpAndSettle();
      expect(_barraVisible(tester), isTrue);
      expect(tester.getRect(_barra), const Rect.fromLTWH(0, 0, 800, BarraTituloPantallaCompleta.alto));
      expect(find.text('ri_rh_v2'), findsOneWidget);

      // Mientras el mouse esté sobre la barra, se queda.
      await mouse.moveTo(const Offset(300, 15));
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      expect(_barraVisible(tester), isTrue);

      // Al alejarlo se esconde sola.
      await mouse.moveTo(const Offset(300, 300));
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(_barraVisible(tester), isFalse);
    });

    testWidgets('el contenido no se mueve cuando baja la barra', (tester) async {
      await _abrir(tester);
      await _entrarYQuitarAviso(tester);
      final antes = tester.getRect(find.text('abrir'));

      final mouse = await _mouse(tester);
      await mouse.moveTo(Offset(_pantalla.width - 10, 2));
      await tester.pumpAndSettle();
      expect(_barraVisible(tester), isTrue);
      expect(tester.getRect(find.text('abrir')), antes);
    });

    testWidgets('minimizar, salir de pantalla completa y cerrar', (tester) async {
      final ventana = _Ventana();
      final vm = await _abrir(tester, ventana: ventana);
      await _entrarYQuitarAviso(tester);
      final mouse = await _mouse(tester);

      Future<void> mostrar() async {
        await mouse.moveTo(Offset(_pantalla.width - 10, 2));
        await tester.pumpAndSettle();
      }

      Future<void> clic(String tooltip) async {
        await mouse.moveTo(tester.getCenter(find.byTooltip(tooltip)));
        await tester.pump();
        await tester.tap(find.byTooltip(tooltip), kind: PointerDeviceKind.mouse);
        await tester.pumpAndSettle();
      }

      await mostrar();
      await clic('Minimizar');
      expect(ventana.minimizada, 1);

      await mostrar();
      await clic('Cerrar');
      expect(ventana.cerrada, 1);

      await mostrar();
      await clic('Salir de pantalla completa');
      expect(vm.activa, isFalse);
      expect(ventana.llamadas.last, isFalse);
      expect(await _guardado(), isFalse);
      expect(_barra, findsNothing);
    });
  });
}
