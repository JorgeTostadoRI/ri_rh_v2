import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService({
    required this._log,
  });

  static const _tokenKey = 'TOKEN';
  final AppLogger _log;

  Future<Result<String?>> fetchToken() async {
    try {
      final sharedPreferences = SharedPreferencesAsync();

      _log.debug('SharedPreferences | Got token');

      return Result.ok(await sharedPreferences.getString(_tokenKey));
    } on Exception catch (e) {
      _log.warning('SharedPreferences | Failed to get token', error: e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveToken(String? token) async {
    try {
      final sharedPreferences = SharedPreferencesAsync();

      if (token == null) {
        _log.debug('SharedPreferences | Removed token');

        await sharedPreferences.remove(_tokenKey);
      } else {
        _log.debug('SharedPreferences | Replaced token');

        await sharedPreferences.setString(_tokenKey, token);
      }

      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('SharedPreferences | Failed to set token', error: e);
      return Result.error(e);
    }
  }
}