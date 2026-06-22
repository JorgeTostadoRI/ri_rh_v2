import 'package:logger/logger.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const _tokenKey = 'TOKEN';
  final _log = Logger();

  Future<Result<String?>> fetchToken() async {
    try {
      final sharedPreferences = SharedPreferencesAsync();

      _log.d('Got token from SharedPreferences');

      return Result.ok(await sharedPreferences.getString(_tokenKey));
    } on Exception catch (e) {
      _log.w('Failed to get token', error: e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveToken(String? token) async {
    try {
      final sharedPreferences = SharedPreferencesAsync();

      if (token == null) {
        _log.d('Removed token');

        await sharedPreferences.remove(_tokenKey);
      } else {
        _log.d('Replaced token');

        await sharedPreferences.setString(_tokenKey, token);
      }

      return const Result.ok(null);
    } on Exception catch (e) {
      _log.w('Failed to set token', error: e);
      return Result.error(e);
    }
  }
}