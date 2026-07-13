import 'dart:typed_data';

abstract class FingerScanService {
  /// Initializes the scanner SDK and cache
  void init();

  /// Disposes of the scanner's resources and terminates the SDK
  void dispose();

  /// A stream which captures fingerprint templates.
  Stream<Uint8List> captureStream();

  /// Identify a fingerprint [template].
  /// 
  /// Returns the fingerprint ID that was identified with the template.
  int identify(Uint8List template);

  /// Add a fingerprint [template] to the cache associated to the given [fid].
  void add(Uint8List template, int fid);

  /// Clear the cache.
  void clear();
}