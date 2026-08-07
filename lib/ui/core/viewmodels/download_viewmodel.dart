import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/services/file_download/file_download_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class DownloadViewmodel extends ChangeNotifier {
  final AppLogger _log;
  final FileDownloadService _fileDownloadService;

  DownloadViewmodel({
    required this._log,
    required this._fileDownloadService,
  }) {
    downloadFile = Command1(_downloadFile);
  }

  late final Command1<void, DownloadFileParams> downloadFile;

  Future<Result<void>> _downloadFile(DownloadFileParams params) async {
    try {
      final resultDownload = await _fileDownloadService.downloadFile(
        filename: params.filename,
        url: params.url,
      );
      switch (resultDownload) {
        case Error():
          _log.error('Failed to download file', error: resultDownload.error);
          return Result.error(resultDownload.error);
        case Ok():
      }
      return const Result.ok(null);
    } on Exception catch (e, stackTrace) {
      _log.error('Unknown error when downloading file', error: e, stackTrace: stackTrace);
      return Result.error(e);
    }
  }
}

class DownloadFileParams {
  final String filename;
  final String url;

  const DownloadFileParams({
    required this.filename,
    required this.url,
  });
}