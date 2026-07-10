import 'dart:typed_data';

import 'package:ri_rh_v2/data/services/api/models/huella/huella_api_model.dart';

abstract class FingerprintRepository {
  /// Captured fingerprint templates will be added through the stream.
  Stream<Uint8List> capture();

  /// Searches the given fingerprint [template] and returns a User if there's a match
  UserInfo? matchFingerprintToUser(Uint8List template);

  /// Loads the fingerprint data from the server onto the cache.
  Future<void> loadFingerprints();
}