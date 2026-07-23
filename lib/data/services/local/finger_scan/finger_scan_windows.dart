import 'dart:async';
import 'dart:typed_data';

import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:zk_finger/zk_finger.dart';

class FingerScanServiceImpl extends FingerScanService {
  FingerScanServiceImpl({
    required this._log,
  });

  final AppLogger _log;

  late final ZKFinger _sdk;
  ZKDevice? _device;
  Timer? _timer;
  late final StreamController<Uint8List> _controller;
  bool _initialized = false;

  @override
  void init() {
    if (!_initialized) {
      _sdk = ZKFinger();
      _controller = StreamController<Uint8List>.broadcast(
        onListen: _connectDevice,
        onCancel: _closeDevice,
      );
      _log.debug('FingerScanService | Initialized');
      _initialized = true;
    }
  }

  @override
  Future<void> dispose() async {
    if (_initialized) {
      await _controller.close();
      _sdk.terminate();
      _initialized = false;
      _log.debug('FingerScanService | Disposed');
    }
  }

  @override
  Stream<Uint8List> captureStream() {
    return _controller.stream;
  }

  @override
  int identify(Uint8List template) {
    final idRes = _sdk.cache.identify(template);
    return idRes.fid;
  }

  @override
  void add(Uint8List template, int fid) {
    if (_sdk.cache.identify(template).successful) {
      // ignore, already registered
      return;
    }
    _sdk.cache.add(template, fid);
  }

  @override
  void delete(int fid) {
    _sdk.cache.delete(fid);
  }

  @override
  void clear() {
    _sdk.cache.clear();
  }

  @override
  Uint8List merge(Uint8List template1, Uint8List template2, Uint8List template3) {
    final mergedTempl = _sdk.cache.merge(template1, template2, template3);
    return mergedTempl;
  }

  void _tick(_) {
    if (_device == null) {
      throw Exception('Scanner device is null');
    }

    final capture = _device!.captureFingerprint();
    if (capture != null) {
      _log.debug('FingerScanService | Captured a fingerprint');
      _controller.add(capture.template);
    }
  }

  void _connectDevice() {
    if (_sdk.getDeviceCount() == 0) {
      throw Exception('No scanners available');
    }
    _device = _sdk.openDevice();

    _timer = Timer.periodic(const Duration(seconds: 1), _tick);
    _log.debug('FingerScanService | Connected device, listening for fingerprints...');
  }

  void _closeDevice() {
    _timer?.cancel();
    _timer = null;
    _device?.close();
    _device = null;
    _log.debug('FingerScanService | Disconnected device');
  }
}