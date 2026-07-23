import 'dart:typed_data';

import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';

class FingerScanServiceImpl extends FingerScanService {
  FingerScanServiceImpl({
    required this._log,
  });

  final AppLogger _log;

  @override
  void init() {
    _log.debug('FingerScanService | Initialized');
  }

  @override
  void dispose() {
    _log.debug('FingerScanService | Disposed');
  }

  @override
  Stream<Uint8List> captureStream() async* {}

  @override
  int identify(Uint8List template) {
    return 0;
  }

  @override
  void add(Uint8List template, int fid) {}

  @override
  void delete(int fid) {}

  @override
  void clear() {}

  @override
  Uint8List merge(Uint8List template1, Uint8List template2, Uint8List template3) {
    return template3;
  }
}