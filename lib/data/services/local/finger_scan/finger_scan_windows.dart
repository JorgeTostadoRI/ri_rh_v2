import 'dart:async';
import 'dart:typed_data';

import 'package:ri_rh_v2/config/app_error.dart';
import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
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
  late final StreamController<Scan> _controller;
  bool _initialized = false;

  @override
  void init() {
    if (!_initialized) {
      try {
        _sdk = ZKFinger();
        _controller = StreamController<Scan>.broadcast(
          onListen: _connectDevice,
          onCancel: _closeDevice,
        );
        _log.info('Initialized fingerprint scanner');
        _initialized = true;
      } catch (e, stackTrace) {
        _log.error('Failed to initialize ZKFinger', error: e, stackTrace: stackTrace);
        _initialized = false;
      }
    }
  }

  @override
  Future<void> dispose() async {
    if (_initialized) {
      await _controller.close();
      _sdk.terminate();
      _initialized = false;
    }
  }

  @override
  Stream<Scan> captureStream() {
    _checkIsInit();
    return _controller.stream;
  }

  @override
  int identify(Uint8List template) {
    _checkIsInit();
    final idRes = _sdk.cache.identify(template);
    return idRes.fid;
  }

  @override
  void add(Uint8List template, int fid) {
    _checkIsInit();
    if (_sdk.cache.identify(template).successful) {
      // ignore, already registered
      return;
    }
    _sdk.cache.add(template, fid);
    _log.info('Added template FID $fid to scanner cache');
  }

  @override
  void delete(int fid) {
    _checkIsInit();
    _sdk.cache.delete(fid);
    _log.info('Deleted template FID $fid from scanner cache');
  }

  @override
  void clear() {
    _checkIsInit();
    _sdk.cache.clear();
    _log.info('Cleared scanner cache');
  }

  @override
  Uint8List merge(Uint8List template1, Uint8List template2, Uint8List template3) {
    _checkIsInit();
    final mergedTempl = _sdk.cache.merge(template1, template2, template3);
    return mergedTempl;
  }

  void _tick(_) {
    if (_device == null) {
      return;
    }

    try {
      final capture = _device!.captureFingerprint();
      if (capture != null) {
        _log.info('Scanner captured a fingerprint');
        _controller.add(Scan(
          template: capture.template,
          image: capture.image,
          width: capture.width,
          height: capture.height,
        ));
      }
    } catch (e, stackTrace) {
      // El lector se desconectó (cable flojo, driver falló) después de que
      // la app ya estaba corriendo. Sin esto, esta excepción quedaba sin
      // capturar en cada intento por segundo y nadie se enteraba de que el
      // escaneo dejó de funcionar.
      _log.error('Scanner capture failed, assuming device was disconnected', error: e, stackTrace: stackTrace);
      _timer?.cancel();
      _timer = null;
      _controller.addError(NoScannerAvailable());
    }
  }

  void _connectDevice() {
    try {
      if (_sdk.getDeviceCount() == 0) {
        throw NoScannerAvailable();
      }
      _device = _sdk.openDevice();

      _timer = Timer.periodic(const Duration(seconds: 1), _tick);
      _log.info('Connected to scanner, listening for fingerprints...');
    } catch (e, stackTrace) {
      // Esto corre sincrónicamente dentro de onListen, la primera vez que
      // algo se suscribe a captureStream() (típicamente al construir
      // AsistenciaViewmodel). Si no hay lector conectado o falla al abrirlo
      // y esto lanzara la excepción tal cual, se propagaría fuera de
      // `.listen()` y podría tumbar la pantalla completa en vez de
      // degradarse al banner de "sin conexión con escáner" como sí pasa con
      // las demás fallas del escáner.
      _log.error('Failed to connect to fingerprint scanner', error: e, stackTrace: stackTrace);
      _controller.addError(NoScannerAvailable());
    }
  }

  void _closeDevice() {
    _timer?.cancel();
    _timer = null;
    _device?.close();
    _device = null;
    _log.info('Disconnected scanner');
  }
  
  void _checkIsInit() {
    if (!_initialized) {
      throw NoScannerAvailable();
    }
  }
}