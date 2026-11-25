import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/services/file_download/file_download_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/download_viewmodel.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/document_preview.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/document_viewer_dialog.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/expediente_files.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Siempre falla al traer el archivo: así se ve el mensaje de error sin tener
/// que decodificar imágenes ni PDFs en la prueba.
class _SinRed extends FileDownloadService {
  int calls = 0;

  @override
  Future<Result<Uint8List>> fetchFile({required String url}) async {
    calls++;
    return Result.error(Exception('sin red'));
  }

  @override
  Future<Result<void>> downloadFile({required String filename, required String url}) async =>
      const Result.ok(null);
}

/// [menuLateral]: como en la app, la pantalla va dentro de un Navigator
/// propio (el ShellRoute) a la derecha del menú, que tiene su propia capa de
/// overlays corrida ese ancho.
Future<_SinRed> _montar(
  WidgetTester tester, {
  Size pantalla = const Size(1400, 1000),
  double? menuLateral,
}) async {
  tester.view.physicalSize = pantalla;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final service = _SinRed();
  final log = AppLogger(loggers: const []);
  const expediente = Scaffold(
    body: Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: 360,
        child: SingleChildScrollView(
          child: ExpedienteFiles(
            files: BaseEmpleadoFiles(ineUrl: 'https://x/media/ine.pdf'),
          ),
        ),
      ),
    ),
  );
  await tester.pumpWidget(MultiProvider(
    providers: [
      Provider<AppLogger>.value(value: log),
      Provider<FileDownloadService>.value(value: service),
      ChangeNotifierProvider(create: (_) => DownloadViewmodel(log: log, fileDownloadService: service)),
    ],
    child: MaterialApp(
      home: menuLateral == null
          ? expediente
          : Row(
              children: [
                SizedBox(width: menuLateral),
                Expanded(
                  child: Navigator(
                    onGenerateRoute: (_) => MaterialPageRoute<void>(builder: (_) => expediente),
                  ),
                ),
              ],
            ),
    ),
  ));
  return service;
}

Future<TestGesture> _mouseSobre(WidgetTester tester, Finder finder) async {
  final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
  addTearDown(mouse.removePointer);
  await mouse.addPointer(location: Offset.zero);
  await tester.pump();
  await mouse.moveTo(tester.getCenter(finder));
  await tester.pump();
  return mouse;
}

void main() {
  group('tamaño y lugar de la vista previa', () {
    // Documento en la columna derecha, como en la captura (laptop 1536×868).
    const laptop = Size(1536, 868);
    const docDerecha = Rect.fromLTWH(1165, 275, 315, 60);

    test('en una laptop sale a la izquierda, casi todo el alto, en proporción carta', () {
      final rect = DocumentHoverPreview.previewRect(laptop, docDerecha)!;
      expect(rect.height, 836); // 868 - 16 arriba - 16 abajo
      expect(rect.width, closeTo(611, 1));
      expect(rect.right, lessThanOrEqualTo(docDerecha.left));
    });

    test('en pantallas altas no pasa de 900 de alto', () {
      final rect = DocumentHoverPreview.previewRect(
        const Size(1920, 1200), const Rect.fromLTWH(1500, 300, 380, 60))!;
      expect(rect.height, 900);
    });

    test('si la lista ocupa todo el ancho, sale abajo o arriba sin tapar el documento', () {
      const doc = Rect.fromLTWH(16, 200, 868, 60);
      final rect = DocumentHoverPreview.previewRect(const Size(900, 900), doc)!;
      expect(rect.overlaps(doc), isFalse);
      expect(rect.top, greaterThanOrEqualTo(doc.bottom)); // abajo hay más espacio
    });

    test('si en ningún lado cabe una vista útil, no sale', () {
      const doc = Rect.fromLTWH(16, 150, 568, 60);
      expect(DocumentHoverPreview.previewRect(const Size(600, 360), doc), isNull);
    });

    test('nunca tapa el documento ni se sale de la pantalla, en ningún tamaño', () {
      const pantallas = [Size(1920, 1080), Size(1536, 868), Size(1280, 720), Size(1024, 600), Size(800, 600), Size(700, 1000)];
      for (final screen in pantallas) {
        for (final w in [260.0, 340.0, screen.width - 32]) {
          for (var x = 16.0; x + w <= screen.width - 16; x += 97) {
            for (var y = 0.0; y + 60 <= screen.height; y += 53) {
              final doc = Rect.fromLTWH(x, y, w, 60);
              final rect = DocumentHoverPreview.previewRect(screen, doc);
              if (rect == null) continue;
              final where = 'pantalla $screen, documento $doc → tarjeta $rect';
              expect(rect.overlaps(doc), isFalse, reason: where);
              expect(rect.left, greaterThanOrEqualTo(16 - 0.001), reason: where);
              expect(rect.top, greaterThanOrEqualTo(16 - 0.001), reason: where);
              expect(rect.right, lessThanOrEqualTo(screen.width - 16 + 0.001), reason: where);
              expect(rect.bottom, lessThanOrEqualTo(screen.height - 16 + 0.001), reason: where);
            }
          }
        }
      }
    });
  });

  testWidgets('al dejar el mouse sobre un documento subido sale la vista previa a la izquierda', (tester) async {
    final service = await _montar(tester);
    final mouse = await _mouseSobre(tester, find.text('INE/Identificación'));

    // Recién llega el mouse: todavía no sale.
    expect(find.byType(DocumentPreviewCard), findsNothing);

    await tester.pump(DocumentHoverPreview.hoverDelay);
    await tester.pump();
    expect(find.byType(DocumentPreviewCard), findsOneWidget);
    expect(find.text('No se pudo cargar la vista previa'), findsOneWidget);
    expect(service.calls, 1);

    // Sale del lado izquierdo de la lista de documentos.
    final tarjeta = tester.getRect(find.byType(DocumentPreviewCard));
    final documento = tester.getRect(find.text('INE/Identificación').first);
    expect(tarjeta.right, lessThan(documento.left));

    // Al quitar el mouse desaparece.
    await mouse.moveTo(const Offset(10, 10));
    await tester.pump();
    expect(find.byType(DocumentPreviewCard), findsNothing);
  });

  for (final pantalla in const [Size(1366, 768), Size(1280, 720), Size(1630, 910), Size(1920, 1080)]) {
    testWidgets('con el menú lateral ($pantalla) la vista previa no tapa el nombre ni los botones', (tester) async {
      await _montar(tester, pantalla: pantalla, menuLateral: 290);
      await _mouseSobre(tester, find.text('INE/Identificación'));
      await tester.pump(DocumentHoverPreview.hoverDelay);
      await tester.pump();

      final tarjeta = tester.getRect(find.byType(DocumentPreviewCard));
      for (final parte in [
        find.text('INE/Identificación').first,
        find.byTooltip('Ver documento'),
        find.byTooltip('Descargar'),
      ]) {
        expect(tarjeta.overlaps(tester.getRect(parte)), isFalse, reason: '$parte tapado por $tarjeta');
      }
      // Y no se sale de la pantalla.
      expect((Offset.zero & pantalla).contains(tarjeta.topLeft), isTrue);
      expect(tarjeta.right, lessThanOrEqualTo(pantalla.width));
      expect(tarjeta.bottom, lessThanOrEqualTo(pantalla.height));
    });
  }

  testWidgets('si solo pasa por encima rápido, no sale nada', (tester) async {
    final service = await _montar(tester);
    final mouse = await _mouseSobre(tester, find.text('INE/Identificación'));

    await tester.pump(const Duration(milliseconds: 150));
    await mouse.moveTo(const Offset(10, 10));
    await tester.pump(DocumentHoverPreview.hoverDelay);

    expect(find.byType(DocumentPreviewCard), findsNothing);
    expect(service.calls, 0);
  });

  testWidgets('clic en un documento subido abre el visor; la X lo cierra', (tester) async {
    final service = await _montar(tester);

    await tester.tap(find.text('INE/Identificación'));
    await tester.pumpAndSettle();

    expect(find.byType(DocumentViewerDialog), findsOneWidget);
    expect(find.text('No se pudo cargar el documento'), findsOneWidget);
    expect(find.byTooltip('Descargar'), findsWidgets);
    expect(service.calls, 1);

    await tester.tap(find.byTooltip('Cerrar'));
    await tester.pumpAndSettle();
    expect(find.byType(DocumentViewerDialog), findsNothing);
  });

  testWidgets('el botón del ojo abre el visor', (tester) async {
    await _montar(tester);

    // Solo el documento subido (INE) tiene el botón.
    expect(find.byTooltip('Ver documento'), findsOneWidget);
    await tester.tap(find.byTooltip('Ver documento'));
    await tester.pumpAndSettle();

    expect(find.byType(DocumentViewerDialog), findsOneWidget);
  });

  testWidgets('el botón de descarga descarga, no abre el visor', (tester) async {
    await _montar(tester);

    await tester.tap(find.byTooltip('Descargar'));
    await tester.pumpAndSettle();

    expect(find.byType(DocumentViewerDialog), findsNothing);
    expect(find.text('Se ha descargado el archivo'), findsOneWidget);
  });

  testWidgets('clic en un documento sin subir no abre nada', (tester) async {
    await _montar(tester);

    await tester.tap(find.text('Acta de nacimiento'));
    await tester.pumpAndSettle();

    expect(find.byType(DocumentViewerDialog), findsNothing);
  });

  testWidgets('los documentos sin subir no tienen vista previa', (tester) async {
    final service = await _montar(tester);
    await _mouseSobre(tester, find.text('Acta de nacimiento'));

    await tester.pump(DocumentHoverPreview.hoverDelay);
    await tester.pump();

    expect(find.byType(DocumentPreviewCard), findsNothing);
    expect(service.calls, 0);
  });
}
