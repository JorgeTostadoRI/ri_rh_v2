import 'dart:typed_data';

import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';

class FingerScanDev extends FingerScanService {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Stream<Uint8List> captureStream() {
    // TODO: implement captureStream
    throw UnimplementedError();
  }

  @override
  int identify(Uint8List template) {
    // TODO: implement identify
    throw UnimplementedError();
  }

  @override
  void add(Uint8List template, int fid) {
    // TODO: implement add
  }

  @override
  void clear() {
    // TODO: implement clear
  }
}