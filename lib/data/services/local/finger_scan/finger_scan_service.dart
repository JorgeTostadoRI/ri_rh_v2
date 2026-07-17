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

  /// Delete fingerprint template with the given [fid].
  void delete(int fid);

  /// Clear the cache.
  void clear();

  /// Merges three fingerprint templates into one.
  Uint8List merge(Uint8List template1, Uint8List template2, Uint8List template3);
}