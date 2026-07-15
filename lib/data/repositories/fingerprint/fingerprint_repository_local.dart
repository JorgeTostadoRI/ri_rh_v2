import 'dart:convert';
import 'dart:typed_data';

import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/services/api/models/huella/huella_api_model.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/utils/result.dart';

class FingerprintRepositoryLocal extends FingerprintRepository {
  List<String> _templates = [
    '21,peposuarez',
  ];

  final List<HuellaApiModel> _huellas = [
    HuellaApiModel(
      id: 1,
      createdAt: DateTime(2026, 7, 14),
      template: '1,danielfernandez,r,index',
      hand: 'r',
      finger: 'index',
      usuario: 1,
    ),
    HuellaApiModel(
      id: 2,
      createdAt: DateTime(2026, 7, 14),
      template: '1,danielfernandez,r,thumb',
      hand: 'r',
      finger: 'thumb',
      usuario: 1,
    ),
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

  @override
  Future<Result<List<Finger>>> getFingerprintsOfUser(int id) async {
    final huellas = _huellas.where((huella) => huella.usuario == id).toList();
    final fingers = huellas.map((huella) => Finger(
      id: huella.id!,
      hand: Hand.fromString(huella.hand),
      fingerName: FingerName.fromString(huella.finger),
      scanned: true,
    )).toList();
    return Result.ok(fingers);
  }
}