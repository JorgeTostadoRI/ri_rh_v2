import 'dart:async';
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';
import 'package:zk_finger/zk_finger.dart';

class FingerScanServiceImpl extends FingerScanService {
  final Logger _logger = Logger();

  late final ZKFinger _sdk;
  ZKDevice? _device;
  Timer? _timer;
  late final StreamController<String> _controller;

  @override
  void init() {
    _sdk = ZKFinger();
    _controller = StreamController<String>.broadcast(
      onListen: _connectDevice,
      onCancel: _closeDevice,
    );
    _logger.d('Initialized FingerScanService');
  }

  @override
  Future<void> dispose() async {
    await _controller.close();
    _sdk.terminate();
    _logger.d('Disposed FingerScanService');
  }

  @override
  Stream<String> captureStream() {
    return _controller.stream;
  }

  void _tick(_) {
    if (_device == null) {
      throw Exception('Scanner device is null');
    }

    final capture = _device!.captureFingerprint();
    if (capture != null) {
      final encodedTemp = base64.encode(capture.template);
      _controller.add(encodedTemp);
    }
  }

  void _connectDevice() {
    if (_sdk.getDeviceCount() == 0) {
      throw Exception('No scanners available');
    }
    _device = _sdk.openDevice();

    _timer = Timer.periodic(const Duration(seconds: 1), _tick);
    _logger.d('Connected device, listening for fingerprints...');
  }

  void _closeDevice() {
    _timer?.cancel();
    _timer = null;
    _device?.close();
    _device = null;
    _logger.d('Disconnected device');
  }
}