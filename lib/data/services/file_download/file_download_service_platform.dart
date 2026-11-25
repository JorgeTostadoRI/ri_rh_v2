import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
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

      final downloadDir = await getDownloadsDirectory();
      if (downloadDir == null) {
        return Result.error(Exception('No download directory available'));
      }
      final savePath = '${downloadDir.path}/$filename';
      await dio.download(
        _sanitizeUrl(url),
        savePath,
      );

      return const Result.ok(null);
    } on DioException catch (e) {
      return Result.error(e);
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception('$e'));
    }
  }

  @override
  Future<Result<Uint8List>> fetchFile({required String url}) async {
    try {
      final response = await _dioFactory().get<List<int>>(
        _sanitizeUrl(url),
        options: Options(responseType: ResponseType.bytes),
      );
      final data = response.data;
      if (data == null) {
        return Result.error(Exception('El archivo llegó vacío'));
      }
      return Result.ok(Uint8List.fromList(data));
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