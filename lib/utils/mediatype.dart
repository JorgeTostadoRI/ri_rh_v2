import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

MediaType getMediaTypeFromExtension(String extension) {
  // 1. Look up the raw MIME string (e.g., "image/jpeg")
  // You can pass just the extension (e.g., "jpg" or ".jpg") or a full file path
  String? mimeType = lookupMimeType('file.$extension');

  // 2. Fallback to a safe default if the extension is unknown
  mimeType ??= 'application/octet-stream';

  // 3. Parse into a MediaType object
  return MediaType.parse(mimeType);
}