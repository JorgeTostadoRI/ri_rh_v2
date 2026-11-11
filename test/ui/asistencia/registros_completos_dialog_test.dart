import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/registros_completos_dialog.dart';

ApiException _error({String? nombre}) => ApiException(
      'Ya completaste tus registros de asistencia del día',
      400,
      errorCode: 'registros_completos',
      data: {
        'code': 'registros_completos',
        'nombre': ?nombre,
      },
    );

Future<void> _abrir(WidgetTester tester, ApiException error) async {
  await tester.pumpWidget(MaterialApp(
    home: Builder(
      builder: (context) => TextButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => RegistrosCompletosDialog(error: error),
        ),
        child: const Text('abrir'),
      ),
    ),
  ));
  await tester.tap(find.text('abrir'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('muestra el nombre y se cierra sola a los 15 segundos', (tester) async {
    await _abrir(tester, _error(nombre: 'Juan Pérez'));

    expect(find.text('Registros completos'), findsOneWidget);
    expect(find.text('Juan Pérez, ya completaste tus registros de asistencia del día.'), findsOneWidget);

    await tester.pump(const Duration(seconds: 14));
    await tester.pumpAndSettle();
    expect(find.text('Registros completos'), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('Registros completos'), findsNothing);
  });

  testWidgets('sin nombre muestra el mensaje genérico', (tester) async {
    await _abrir(tester, _error());
    expect(find.text('Ya completaste tus registros de asistencia del día.'), findsOneWidget);
  });

  testWidgets('Entendido la cierra antes', (tester) async {
    await _abrir(tester, _error(nombre: 'Juan Pérez'));
    await tester.tap(find.text('Entendido'));
    await tester.pumpAndSettle();
    expect(find.text('Registros completos'), findsNothing);

    // El timer ya no hace nada después de cerrada.
    await tester.pump(const Duration(seconds: 20));
    expect(tester.takeException(), isNull);
  });

  testWidgets('se cierra cuando alguien pone el dedo', (tester) async {
    final lecturas = StreamController<void>.broadcast();
    addTearDown(lecturas.close);
    late BuildContext ctx;
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) {
        ctx = context;
        return const SizedBox();
      }),
    ));
    showDialog(
      context: ctx,
      builder: (_) => RegistrosCompletosDialog(error: _error(nombre: 'Ana'), cerrarCon: lecturas.stream),
    );
    await tester.pumpAndSettle();
    expect(find.text('Registros completos'), findsOneWidget);

    lecturas.add(null);
    await tester.pumpAndSettle();
    expect(find.text('Registros completos'), findsNothing);

    // Otra lectura o el timer después de cerrada no truenan.
    lecturas.add(null);
    await tester.pump(const Duration(seconds: 20));
    expect(tester.takeException(), isNull);
  });

  testWidgets('el cierre automático no cierra otra ventana abierta encima', (tester) async {
    late BuildContext ctx;
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) {
        ctx = context;
        return const SizedBox();
      }),
    ));
    showDialog(context: ctx, builder: (_) => RegistrosCompletosDialog(error: _error(nombre: 'Ana')));
    await tester.pumpAndSettle();
    showDialog(context: ctx, builder: (_) => const AlertDialog(title: Text('Otra ventana')));
    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 15));
    await tester.pumpAndSettle();
    expect(find.text('Otra ventana'), findsOneWidget);
    expect(find.text('Registros completos'), findsNothing);
  });
}
