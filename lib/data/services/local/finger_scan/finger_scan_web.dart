import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';

class FingerScanServiceImpl extends FingerScanService {
  final Logger _logger = Logger();

  @override
  void init() {
    _logger.d('Initialized mock FingerScanService');
  }

  @override
  void dispose() {
    _logger.d('Disposed mock FingerScanService');
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