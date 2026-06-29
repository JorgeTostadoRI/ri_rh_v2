import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/services/api/models/asistencia/asistencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/utils/mediatype.dart';
import 'package:ri_rh_v2/utils/result.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({Dio Function()? dioFactory})
      : _dioFactory = dioFactory ?? (() => Dio());

  final Dio Function() _dioFactory;

  AuthHeaderProvider? _authHeaderProvider;

  final Logger _logger = Logger();

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

      final photoBytes = await asistencia.photoFile?.readAsBytes();
      final formData = FormData.fromMap({
        'empleado': asistencia.empleado,
        if (photoBytes != null)
          'photo': MultipartFile.fromBytes(
            photoBytes,
            filename: '${DateTime.now().toIso8601String()}.jpeg',
            contentType: DioMediaType('image', 'jpeg'),
          )
      });
      final response = await dio.post('/api/rh/asistencias/', data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final asistencia = AsistenciaApiModel.fromJson(response.data);
        return Result.ok(asistencia);
      } else {
        _logger.e('Invalid response', error: response.data);
        return Result.error(HttpException("Invalid response"));
      }
    } on DioException catch (e) {
      _logger.e('DioException posting asistencia', error: e.response);
      return Result.error(e);
    } on Exception catch (e) {
      _logger.e('Exception posting asistencia', error: e);
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  Future<Result<Incidencia>> postIncidencia(Incidencia incidencia) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);

      final uploadList = incidencia.files.map((f) {
        final file = f.file!;
        return MultipartFile.fromBytes(
          file.bytes!,
          filename: file.name,
          contentType: getMediaTypeFromExtension(file.extension!),
        );
      }).toList();
      final formData = FormData.fromMap({
        'start': incidencia.start.toIso8601String(),
        'end': incidencia.end.toIso8601String(),
        'reason': incidencia.reason,
        'solicitor': incidencia.solicitor,
        'uploaded_files': uploadList,
      });

      final endpoint = incidencia.categoryId;
      final response = await dio.post(
        '/api/rh/$endpoint/',
        data: formData,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = Incidencia.fromJson(response.data).copyWith(
          categoryId: incidencia.categoryId,
        );
        return Result.ok(result);
      } else {
        _logger.e('Invalid response', error: response.data);
        return Result.error(HttpException("Invalid response"));
      }
    } on DioException catch (e) {
      _logger.e('DioException posting incidencia', error: e.response);
      return Result.error(e);
    } on Exception catch (e) {
      _logger.e('Exception posting incidencia', error: e);
      return Result.error(e);
    } finally {
      dio.close();
    }
  }
}