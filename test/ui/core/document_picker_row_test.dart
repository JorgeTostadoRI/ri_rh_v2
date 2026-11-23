import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/document_picker_row.dart';

Future<TextStyle?> _estiloDelNombre(WidgetTester tester, DocumentPickerRow fila) async {
  await tester.pumpWidget(MaterialApp(home: Scaffold(body: fila)));
  return tester.widget<Text>(find.textContaining(fila.label)).style;
}

void main() {
  testWidgets('sin "faltante" se ve igual que siempre (diálogos de reclutamiento)', (tester) async {
    final estilo = await _estiloDelNombre(
      tester,
      DocumentPickerRow(label: 'Acta de nacimiento', file: null, onPick: () {}),
    );
    expect(estilo?.color, isNull);
    expect(estilo?.fontWeight, FontWeight.normal);
  });

  testWidgets('faltante: el nombre sale en rojo', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: DocumentPickerRow(label: 'Acta de nacimiento', file: null, onPick: () {}, faltante: true),
      ),
    ));
    final estilo = tester.widget<Text>(find.text('Acta de nacimiento')).style;
    final context = tester.element(find.text('Acta de nacimiento'));
    expect(estilo?.color, context.rh.error);
  });

  testWidgets('ya adjuntado se ve igual que siempre', (tester) async {
    final estilo = await _estiloDelNombre(
      tester,
      DocumentPickerRow(
        label: 'Acta de nacimiento',
        file: PlatformFile(name: 'acta.pdf', size: 1),
        onPick: () {},
      ),
    );
    expect(estilo?.color, isNull);
    expect(estilo?.fontWeight, FontWeight.w700);
  });
}
