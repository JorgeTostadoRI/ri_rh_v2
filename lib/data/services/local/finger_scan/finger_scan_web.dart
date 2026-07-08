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
}