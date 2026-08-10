import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;
import 'package:ri_rh_v2/data/services/file_download/file_download_service.dart';
import 'package:ri_rh_v2/utils/result.dart';

class FileDownloadServiceImpl extends FileDownloadService {
  final Dio Function() _dioFactory;
  
  FileDownloadServiceImpl({
    Dio Function()? dioFactory,
  })
    : _dioFactory = dioFactory ?? (() => Dio());

  @override
  Future<Result<void>> downloadFile({required String filename, required String url}) async {
    try {
      final dio = _dioFactory();
      final response = await dio.get<List<int>>(
        _sanitizeUrl(url),
        options: Options(responseType: ResponseType.bytes),
      );
      // Create the blob and temporary URL from the response bytes
      final bytes = Uint8List.fromList(response.data!).buffer.toJS;
      final blob = web.Blob([bytes].toJS);
      final blobUrl = web.URL.createObjectURL(blob);

      // Create a temporary anchor element and associate it with the blob url
      final anchor = web.document.createElement('a') as web.HTMLAnchorElement
        ..href = blobUrl
        ..download = filename;
      
      // Trigger the download
      anchor.click();

      // Release the temporary URL
      web.URL.revokeObjectURL(blobUrl);

      return const Result.ok(null);
    } on DioException catch (e) {
      return Result.error(e);
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception('$e'));
    }
  }

  String _sanitizeUrl(String originalUrl) {
    if (kDebugMode) {
      return originalUrl;
    }

    String sanitizedUrl = originalUrl;
    if (sanitizedUrl.startsWith('http://')) {
      sanitizedUrl = sanitizedUrl.replaceFirst('http://', 'https://');
    }
    return sanitizedUrl;
  }
}