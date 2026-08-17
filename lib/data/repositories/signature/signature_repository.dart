import 'dart:typed_data';

import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class SignatureRepository {
  Future<Result<void>> createSignature(User user, Uint8List imageBytes);
}