import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/data/services/file_download/file_download_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Qué tipo de archivo es, para saber cómo dibujar la vista previa.
enum FilePreviewType { pdf, image, unsupported }

class FilePreview {
  const FilePreview({required this.bytes, required this.type});

  final Uint8List bytes;
  final FilePreviewType type;
}

/// Trae los archivos para las vistas previas y los guarda en memoria, para que
/// cada archivo se baje una sola vez mientras viva este viewmodel (por ejemplo,
/// mientras el usuario está en un expediente).
class FilePreviewViewmodel {
  FilePreviewViewmodel({
    required this._log,
    required this._fileDownloadService,
  });

  final AppLogger _log;
  final FileDownloadService _fileDownloadService;

  final Map<String, Future<Result<FilePreview>>> _cache = {};

  /// Regresa la vista previa del archivo. Si ya se pidió antes, regresa la
  /// misma (aunque siga cargando). Si falla, se olvida para poder reintentar
  /// la siguiente vez.
  Future<Result<FilePreview>> load(String url) {
    final cached = _cache[url];
    if (cached != null) return cached;

    final future = _fetch(url);
    _cache[url] = future;
    future.then((result) {
      if (result is Error<FilePreview>) _cache.remove(url);
    });
    return future;
  }

  Future<Result<FilePreview>> _fetch(String url) async {
    final result = await _fileDownloadService.fetchFile(url: url);
    switch (result) {
      case Error<Uint8List>():
        _log.error('Failed to load file preview', error: result.error);
        return Result.error(result.error);
      case Ok<Uint8List>():
        final bytes = result.value;
        return Result.ok(FilePreview(bytes: bytes, type: detectPreviewType(bytes, url)));
    }
  }
}

/// Decide el tipo por el contenido del archivo y, si no se reconoce, por la
/// extensión de la URL.
@visibleForTesting
FilePreviewType detectPreviewType(Uint8List bytes, String url) {
  bool startsWith(List<int> firma) =>
      bytes.length >= firma.length &&
      Iterable<int>.generate(firma.length).every((i) => bytes[i] == firma[i]);

  if (startsWith(const [0x25, 0x50, 0x44, 0x46])) return FilePreviewType.pdf; // %PDF
  if (startsWith(const [0x89, 0x50, 0x4E, 0x47])) return FilePreviewType.image; // PNG
  if (startsWith(const [0xFF, 0xD8, 0xFF])) return FilePreviewType.image; // JPG

  final path = Uri.tryParse(url)?.path.toLowerCase() ?? url.toLowerCase();
  if (path.endsWith('.pdf')) return FilePreviewType.pdf;
  if (path.endsWith('.png') || path.endsWith('.jpg') || path.endsWith('.jpeg')) {
    return FilePreviewType.image;
  }
  return FilePreviewType.unsupported;
}
