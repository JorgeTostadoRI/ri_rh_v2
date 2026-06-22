import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ri_rh_v2/data/services/api/models/asistencia/asistencia_api_model.dart';
import 'package:ri_rh_v2/utils/result.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({Dio Function()? dioFactory})
      : _dioFactory = dioFactory ?? (() => Dio());

  final Dio Function() _dioFactory;

  AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }

  void _authHeader(Dio dio) async {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      dio.options.headers[HttpHeaders.authorizationHeader] = header;
    }
  }

  Future<Result<AsistenciaApiModel>> postAsistencia(AsistenciaApiModel asistencia) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final formData = FormData.fromMap({
        'empleado': asistencia.empleado,
        if (asistencia.photo != null)
          'photo': MultipartFile.fromFile(asistencia.photo!)
      });
      final response = await dio.post('/api/rh/asistencias/', data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final asistencia = AsistenciaApiModel.fromJson(response.data);
        return Result.ok(asistencia);
      } else {
        return Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      dio.close();
    }
  }
}