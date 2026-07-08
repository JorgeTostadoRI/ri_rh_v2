import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';
import 'package:zk_finger/zk_finger.dart';

class FingerScanServiceImpl extends FingerScanService {
  final Logger _logger = Logger();

  late final ZKCache _cache;

  @override
  void init() {
    final initRes = ZKFinger.init();
    if (initRes != 0 && initRes != 1) {
      _logger.f('ZKFinger failed to initialize: $initRes');
      throw Exception('Failed to initialize service');
    }

    _cache = ZKFinger.initCache();

    _logger.d('Initialized FingerScanService');
  }

  @override
  void dispose() {
    _cache.close();

    final termRes = ZKFinger.terminate();
    if (termRes != 0) {
      _logger.f('ZKFinger failed to terminate: $termRes');
      throw Exception('Failed to dispose service');
    }

    _logger.d('Disposed FingerScanService');
  }
}