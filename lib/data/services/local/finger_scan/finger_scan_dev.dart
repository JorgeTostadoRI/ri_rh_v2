import 'dart:typed_data';

import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';

class FingerScanDev extends FingerScanService {
  @override
  void init() {}

  @override
  void dispose() {}

  @override
  Stream<Uint8List> captureStream() {
    throw UnimplementedError();
  }

  @override
  int identify(Uint8List template) {
    throw UnimplementedError();
  }

  @override
  void add(Uint8List template, int fid) {
    throw UnimplementedError();
  }

  @override
  void delete(int fid) {
    throw UnimplementedError();
  }

  @override
  void clear() {
    throw UnimplementedError();
  }

  @override
  Uint8List merge(Uint8List template1, Uint8List template2, Uint8List template3) {
    throw UnimplementedError();
  }
}