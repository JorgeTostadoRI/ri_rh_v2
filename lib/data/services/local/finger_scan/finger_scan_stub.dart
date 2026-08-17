// ignore_for_file: unused_field

import 'dart:typed_data';

import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';

import 'finger_scan_service.dart';

class FingerScanServiceImpl extends FingerScanService {
  FingerScanServiceImpl({
    required this._log,
  });
  
  final AppLogger _log;
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
  Stream<Scan> captureStream() {
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
  void delete(int fid) {
    throw UnimplementedError(_errorMessage);
  }

  @override
  void clear() {
    throw UnimplementedError(_errorMessage);
  }

  @override
  Uint8List merge(Uint8List template1, Uint8List template2, Uint8List template3) {
    throw UnimplementedError(_errorMessage);
  }
}