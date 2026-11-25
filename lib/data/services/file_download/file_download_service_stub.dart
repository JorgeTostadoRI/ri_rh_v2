// ignore_for_file: unused_field

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:ri_rh_v2/data/services/file_download/file_download_service.dart';
import 'package:ri_rh_v2/utils/result.dart';

class FileDownloadServiceImpl extends FileDownloadService {
  final Dio Function() _dioFactory;

  FileDownloadServiceImpl({
    Dio Function()? dioFactory
  })
    : _dioFactory = dioFactory ?? (() => Dio());

  final String errorMessage = 'This is a stub';

  @override
  Future<Result<void>> downloadFile({required String filename, required String url}) async {
    return Result.error(Exception(errorMessage));
  }

  @override
  Future<Result<Uint8List>> fetchFile({required String url}) async {
    return Result.error(Exception(errorMessage));
  }
}
