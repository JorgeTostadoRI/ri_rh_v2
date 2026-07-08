export 'finger_scan_service.dart';

import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';

import 'finger_scan_stub.dart'
  if (dart.library.io) 'finger_scan_windows.dart'
  if (dart.library.js_interop) 'finger_scan_web.dart';

/// Factory constructor for FingerScanService.
FingerScanService getFingerScanService() {
  return FingerScanServiceImpl();
}