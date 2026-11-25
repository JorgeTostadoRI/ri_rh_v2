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

Future<_SinRed> _montar(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1400, 1000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final service = _SinRed();
  final log = AppLogger(loggers: const []);
  await tester.pumpWidget(MultiProvider(
    providers: [
      Provider<AppLogger>.value(value: log),
      Provider<FileDownloadService>.value(value: service),
      ChangeNotifierProvider(create: (_) => DownloadViewmodel(log: log, fileDownloadService: service)),
    ],
    child: const MaterialApp(
      home: Scaffold(
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
  group('tamaño de la vista previa', () {
    test('en una laptop usa casi todo el alto, con proporción de hoja carta', () {
      final size = DocumentHoverPreview.previewSize(const Size(1536, 868), availableWidth: 1100);
      expect(size.height, 836); // 868 - 16 arriba - 16 abajo
      expect(size.width, closeTo(611, 1));
    });

    test('en pantallas altas no pasa de 900 de alto', () {
      final size = DocumentHoverPreview.previewSize(const Size(1920, 1200), availableWidth: 1400);
      expect(size.height, 900);
    });

    test('si a los lados hay poco espacio, se angosta', () {
      final size = DocumentHoverPreview.previewSize(const Size(900, 600), availableWidth: 380);
      expect(size.width, 380);
      expect(size.height, 568);
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

  testWidgets('si solo pasa por encima rápido, no sale nada', (tester) async {
    final service = await _montar(tester);
    final mouse = await _mouseSobre(tester, find.text('INE/Identificación'));

    await tester.pump(const Duration(milliseconds: 150));
    await mouse.moveTo(const Offset(10, 10));
    await tester.pump(DocumentHoverPreview.hoverDelay);

    expect(find.byType(DocumentPreviewCard), findsNothing);
    expect(service.calls, 0);
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
