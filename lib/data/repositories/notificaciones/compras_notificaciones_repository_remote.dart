import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ri_rh_v2/data/repositories/notificaciones/compras_notificaciones_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/data/services/shared_preferences_service.dart';
import 'package:ri_rh_v2/domain/models/notificaciones/aviso_compra.dart';
import 'package:ri_rh_v2/utils/result.dart';

class ComprasNotificacionesRepositoryRemote
    extends ComprasNotificacionesRepository {
  ComprasNotificacionesRepositoryRemote({
    required this._sharedPreferences,
    required this._log,
  });

  final SharedPreferencesService _sharedPreferences;
  final AppLogger _log;

  static const _apiUrl = String.fromEnvironment(
    'api_url',
    defaultValue: 'http://localhost:8000',
  );

  String get _base {
    if (kIsWeb && Uri.base.host.isNotEmpty) {
      final segments =
          Uri.base.pathSegments.where((segment) => segment.isNotEmpty).toList();
      if (segments.length >= 2) {
        return '${Uri.base.origin}/${segments.first}';
      }
    }
    return _apiUrl.replaceFirst(RegExp(r'/+$'), '');
  }

  Future<String?> _token() async {
    final result = await _sharedPreferences.fetchToken();
    return switch (result) {
      Ok(value: final token) => token,
      Error() => null,
    };
  }

  Dio _dio() => Dio(
        BaseOptions(
          baseUrl: _base,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  @override
  Future<Result<ResumenCompras>> getResumen() async {
    final token = await _token();
    if (token == null || token.isEmpty) {
      return Result.error(Exception('Sin sesión'));
    }

    final dio = _dio();
    try {
      final response = await dio.get(
        '/api/rh/notificaciones/resumen/',
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      final data = response.data is Map
          ? Map<String, dynamic>.from(response.data as Map)
          : <String, dynamic>{};
      return Result.ok(ResumenCompras.fromJson(data));
    } on DioException catch (e) {
      _log.error('No se pudo cargar el resumen de avisos de Compras', error: e);
      return Result.error(Exception(e.message ?? 'Error de red'));
    } finally {
      dio.close();
    }
  }

  @override
  Future<Result<void>> marcarLeida(int id) async {
    final token = await _token();
    if (token == null || token.isEmpty) {
      return Result.error(Exception('Sin sesión'));
    }

    final dio = _dio();
    try {
      await dio.patch(
        '/api/messages/$id/',
        data: {'leido': true},
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      return const Result.ok(null);
    } on DioException catch (e) {
      _log.error('No se pudo marcar como leído el aviso $id', error: e);
      return Result.error(Exception(e.message ?? 'Error de red'));
    } finally {
      dio.close();
    }
  }
}
