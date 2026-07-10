import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/services/api/models/asistencia/asistencia_api_model.dart';
import 'package:ri_rh_v2/data/services/api/models/huella/huella_api_model.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
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
        'usuario': asistencia.usuario,
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

  // AVISOS
  Future<Result<List<Aviso>>> getAvisos({DateTime? query}) async {
    final dio = _dioFactory();
    try {
      final Map<String, dynamic> queryParams = {};
      if (query != null) {
        queryParams.addAll({
          'show_at': query.toShortIsoString(),
        });
      }
      final response = await dio.get(
        '/api/rh/avisos/',
        queryParameters: queryParams,
      );
      final result = (response.data as List)
        .map((json) => Aviso.fromJson(json))
        .toList();
      return Result.ok(result);
    } on DioException catch (e) {
      _logger.e('DioException getting avisos', error: e.response);
      return Result.error(e);
    } on Exception catch (e) {
      _logger.e('Exception getting avisos', error: e);
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  Future<Result<Aviso>> postAviso(Aviso aviso) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);

      final formData = FormData.fromMap({
        'content': aviso.content,
        'show_at': aviso.showAt.toShortIsoString(),
        if (aviso.attachmentFile != null)
          'attachment': MultipartFile.fromBytes(
            aviso.attachmentFile!.bytes!,
            filename: aviso.attachmentFile!.name,
            contentType: getMediaTypeFromExtension(aviso.attachmentFile!.extension!),
          ),
      });
      final response = await dio.post('/api/rh/avisos/', data: formData);
      final result = Aviso.fromJson(response.data);
      return Result.ok(result);
    } on DioException catch (e) {
      _logger.e('DioException getting avisos', error: e.response);
      return Result.error(e);
    } on Exception catch (e) {
      _logger.e('Exception getting avisos', error: e);
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  Future<Result<Aviso>> patchAviso(Aviso aviso) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);

      final formData = FormData.fromMap({
        'content': aviso.content,
        'show_at': aviso.showAt.toShortIsoString(),
        'attachment': aviso.attachmentFile == null ? null : MultipartFile.fromBytes(
          aviso.attachmentFile!.bytes!,
          filename: aviso.attachmentFile!.name,
          contentType: getMediaTypeFromExtension(aviso.attachmentFile!.extension!),
        ),
      });
      final response = await dio.patch('/api/rh/avisos/${aviso.id}/', data: formData);
      final result = Aviso.fromJson(response.data);
      return Result.ok(result);
    } on DioException catch (e) {
      _logger.e('DioException getting avisos', error: e.response);
      return Result.error(e);
    } on Exception catch (e) {
      _logger.e('Exception getting avisos', error: e);
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  Future<Result<void>> deleteAviso(int id) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      await dio.delete('/api/rh/avisos/$id/');
      return Result.ok(null);
    } on DioException catch (e) {
      _logger.e('DioException getting avisos', error: e.response);
      return Result.error(e);
    } on Exception catch (e) {
      _logger.e('Exception getting avisos', error: e);
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  // HUELLAS
  Future<Result<List<HuellaApiModel>>> getHuellas() async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final response = await dio.get('/api/rh/huellas/');
      final result = (response.data as List)
      .map((json) => HuellaApiModel.fromJson(json))
      .toList();
      return Result.ok(result);
    } on Exception catch (e) {
      _logger.e('Exception getting avisos', error: e);
      return Result.error(e);
    } finally {
      dio.close();
    }
  }
}