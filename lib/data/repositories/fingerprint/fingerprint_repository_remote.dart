import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/services/local/finger_scan/finger_scan_service.dart';

class FingerprintRepositoryRemote extends FingerprintRepository {
  FingerprintRepositoryRemote({
    required this._fingerScanService,
  });

  final FingerScanService _fingerScanService;

  @override
  Stream<String> capture() {
    return _fingerScanService.captureStream();
  }
}