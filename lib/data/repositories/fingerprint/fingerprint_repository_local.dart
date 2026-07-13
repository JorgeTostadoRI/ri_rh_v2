import 'dart:convert';
import 'dart:typed_data';

import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/services/api/models/huella/huella_api_model.dart';

class FingerprintRepositoryLocal extends FingerprintRepository {
  List<String> _templates = [
    '21,peposuarez',
  ];
  
  @override
  Stream<Uint8List> capture() {
    return Stream<Uint8List>.periodic(
      const Duration(seconds: 30),
      (_) => utf8.encode(_templates.first),
    );
  }

  @override
  UserInfo? matchFingerprintToUser(Uint8List template) {
    final credentials = utf8.decode(template).split(',');
    if (credentials.length < 2) return null;
    return UserInfo(
      id: int.parse(credentials[0]),
      username: credentials[1],
    );
  }

  @override
  Future<void> loadFingerprints() async {
    return Future.value(null);
  }
}