import 'dart:typed_data';

import 'package:ri_rh_v2/data/repositories/signature/signature_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

class SignatureRepositoryRemote extends SignatureRepository {
  final AppLogger _log;
  final ApiClient _apiClient;

  SignatureRepositoryRemote({
    required this._log,
    required this._apiClient,
  });

  @override
  Future<Result<void>> createSignature(User user, Uint8List imageBytes) async {
    try {
      final result = await _apiClient.postSignature(user, imageBytes);
      switch (result) {
        case Error():
          _log.error('Failed to create signature', error: result.error);
          return Result.error(result.error);
        case Ok():
      }

      return const Result.ok(null);
    } on Exception catch (e, stackTrace) {
      _log.error('Unexpected error when creating signature', error: e, stackTrace: stackTrace);
      return Result.error(e);
    }
  }
}