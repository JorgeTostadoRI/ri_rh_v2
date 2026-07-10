abstract class FingerprintRepository {
  /// Captured fingerprint templates will be added through the stream.
  Stream<String> capture();
}