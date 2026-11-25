import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/data/services/file_download/file_download_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/file_preview_viewmodel.dart';
import 'package:ri_rh_v2/utils/result.dart';

class _FakeDownloadService extends FileDownloadService {
  _FakeDownloadService(this.responses);

  /// Respuestas en orden; cada llamada a fetchFile consume una.
  final List<Result<Uint8List>> responses;
  int calls = 0;

  @override
  Future<Result<Uint8List>> fetchFile({required String url}) async {
    return responses[calls++];
  }

  @override
  Future<Result<void>> downloadFile({required String filename, required String url}) async =>
      const Result.ok(null);
}

final _pdf = Uint8List.fromList([0x25, 0x50, 0x44, 0x46, 0x2D, 0x31]); // %PDF-1
final _png = Uint8List.fromList([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A]);
final _jpg = Uint8List.fromList([0xFF, 0xD8, 0xFF, 0xE0]);

FilePreviewViewmodel _viewmodel(FileDownloadService service) =>
    FilePreviewViewmodel(log: AppLogger(loggers: const []), fileDownloadService: service);

void main() {
  group('detectPreviewType', () {
    test('reconoce PDF, PNG y JPG por su contenido aunque la URL no diga', () {
      expect(detectPreviewType(_pdf, 'https://x/media/doc'), FilePreviewType.pdf);
      expect(detectPreviewType(_png, 'https://x/media/doc'), FilePreviewType.image);
      expect(detectPreviewType(_jpg, 'https://x/media/doc'), FilePreviewType.image);
    });

    test('si el contenido no se reconoce, usa la extensión (sin importar ?query)', () {
      final raro = Uint8List.fromList([1, 2, 3]);
      expect(detectPreviewType(raro, 'https://x/ine.PDF?v=2'), FilePreviewType.pdf);
      expect(detectPreviewType(raro, 'https://x/ine.jpeg'), FilePreviewType.image);
      expect(detectPreviewType(raro, 'https://x/ine.docx'), FilePreviewType.unsupported);
    });
  });

  group('FilePreviewViewmodel.load', () {
    test('baja cada archivo una sola vez', () async {
      final service = _FakeDownloadService([Result.ok(_pdf)]);
      final vm = _viewmodel(service);

      final a = await vm.load('https://x/a.pdf');
      final b = await vm.load('https://x/a.pdf');

      expect(service.calls, 1);
      expect(a, isA<Ok<FilePreview>>());
      expect((b as Ok<FilePreview>).value.type, FilePreviewType.pdf);
    });

    test('si falla, la siguiente vez lo vuelve a intentar', () async {
      final service = _FakeDownloadService([
        Result.error(Exception('sin red')),
        Result.ok(_png),
      ]);
      final vm = _viewmodel(service);

      expect(await vm.load('https://x/a.png'), isA<Error<FilePreview>>());
      // Deja que se limpie el caché del intento fallido.
      await Future<void>.delayed(Duration.zero);
      final segundo = await vm.load('https://x/a.png');

      expect(service.calls, 2);
      expect((segundo as Ok<FilePreview>).value.type, FilePreviewType.image);
    });
  });
}
