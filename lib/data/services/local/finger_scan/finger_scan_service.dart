abstract class FingerScanService {
  /// Initializes the scanner SDK and cache
  void init();

  /// Disposes of the scanner's resources and terminates the SDK
  void dispose();

  /// A stream which captures fingerprint templates.
  Stream<String> captureStream();
}