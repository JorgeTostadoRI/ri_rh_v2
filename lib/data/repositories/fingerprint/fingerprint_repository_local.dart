import 'dart:convert';
import 'dart:typed_data';

import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/services/api/models/huella/huella_api_model.dart';
import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/finger/finger.dart';
import 'package:ri_rh_v2/utils/result.dart';

class FingerprintRepositoryLocal extends FingerprintRepository {
  FingerprintRepositoryLocal({
    required this._log,
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  final AppLogger _log;

  final List<HuellaApiModel> _huellas = [
    HuellaApiModel(
      id: 1,
      createdAt: DateTime(2026, 7, 14),
      updatedAt: DateTime(2026, 7, 14),
      template: '1,danielfernandez,r,index',
      hand: 'r',
      finger: 'index',
      usuario: 1,
    ),
    HuellaApiModel(
      id: 2,
      createdAt: DateTime(2026, 7, 14),
      updatedAt: DateTime(2026, 7, 14),
      template: '1,danielfernandez,r,thumb',
      hand: 'r',
      finger: 'thumb',
      usuario: 1,
    ),
  ];

  int _sequentialId = 3;
  
  @override
  Stream<Scan> capture() {
    _log.debug('FingerprintRepository | Listening for fingerprint captures');
    return Stream<Scan>.empty();
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
      user: huella.usuario,
      hand: Hand.fromString(huella.hand),
      fingerName: FingerName.fromString(huella.finger),
      scanned: true,
    )).toList();
    return Result.ok(fingers);
  }

  @override
  Future<Result<void>> deleteFingerprint(int id) async {
    final index = _huellas.indexWhere((huella) => huella.id! == id);
    if (index == -1) {
      return Result.error(Exception('Not found'));
    }

    _huellas.removeAt(index);
    return Result.ok(null);
  }

  @override
  Future<Result<Finger>> enroll(Finger finger, List<Uint8List> templates) async {
    if (templates.length < 3) {
      throw Exception('3 templates are needed for enrollment');
    }

    final user = _localDataService.getUsers().firstWhere((u) => u.id == finger.user);
    
    final template = '${finger.user},${user.username},${finger.hand.apiValue},${finger.fingerName.apiValue}';
    final huella = HuellaApiModel(
      id: _sequentialId++,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      template: template,
      hand: finger.hand.apiValue,
      finger: finger.fingerName.apiValue,
      usuario: finger.user,
    );
    _huellas.add(huella);

    final fingerWithValues = finger.copyWith(
      id: huella.id!,
      scanned: true,
    );
    return Result.ok(fingerWithValues);
  }
}