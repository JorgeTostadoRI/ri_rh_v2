import 'dart:typed_data';

import 'package:ri_rh_v2/data/repositories/signature/signature_repository.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

class SignatureRepositoryLocal extends SignatureRepository {
  @override
  Future<Result<void>> createSignature(User user, Uint8List imageBytes) async {
    return const Result.ok(null);
  }
}