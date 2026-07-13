import 'dart:typed_data';

import 'finger_scan_service.dart';

class FingerScanServiceImpl extends FingerScanService {
  final _errorMessage = 'This is a stub, not a real implementation of FingerScanService';

  @override
  void init() {
    throw UnimplementedError(_errorMessage);
  }

  @override
  void dispose() {
    throw UnimplementedError(_errorMessage);
  }

  @override
  Stream<Uint8List> captureStream() {
    throw UnimplementedError(_errorMessage);
  }

  @override
  int identify(Uint8List template) {
    throw UnimplementedError(_errorMessage);
  }

  @override
  void add(Uint8List template, int fid) {
    throw UnimplementedError(_errorMessage);
  }

  @override
  void clear() {
    throw UnimplementedError(_errorMessage);
  }
}