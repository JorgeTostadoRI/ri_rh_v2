import 'package:dio/dio.dart';
import 'package:ri_rh_v2/data/services/file_download/file_download_service.dart';

import 'file_download_service_stub.dart'
  if (dart.library.io) 'file_download_service_platform.dart'
  if (dart.library.js_interop) 'file_download_service_web.dart';

FileDownloadService getFileDownloadService({
  Dio Function()? dioFactory,
}) {
  return FileDownloadServiceImpl(dioFactory: dioFactory);
}