import 'package:ri_rh_v2/utils/result.dart';

abstract class FileDownloadService {
  /// Download a remote file.
  /// 
  /// On browser triggers a blob download with package:web.
  /// 
  /// On platforms uses dart:io for downloading to the filesystem.
  Future<Result<void>> downloadFile({
    required String filename,
    required String url,
  });
}