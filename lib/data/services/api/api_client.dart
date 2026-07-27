import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ri_rh_v2/data/services/api/models/asistencia/asistencia_api_model.dart';
import 'package:ri_rh_v2/data/services/api/models/empleado/empleado_api_model.dart';
import 'package:ri_rh_v2/data/services/api/models/huella/huella_api_model.dart';
import 'package:ri_rh_v2/data/services/api/models/practicante/practicante_api_model.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/mediatype.dart';
import 'package:ri_rh_v2/utils/result.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({
    Dio Function()? dioFactory,
  })
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
      return Result.ok(AsistenciaApiModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
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
      final result = Incidencia.fromJson(response.data).copyWith(
        categoryId: incidencia.categoryId,
      );
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
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
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
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
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
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
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
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
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  // HUELLAS
  Future<Result<List<HuellaApiModel>>> getHuellas({int? userId}) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final Map<String, dynamic> queryParams = {};
      if (userId != null) {
        queryParams.addAll({
          'usuario': userId,
        });
      }
      final response = await dio.get('/api/rh/huellas/', queryParameters: queryParams);
      final result = (response.data as List)
      .map((json) => HuellaApiModel.fromJson(json))
      .toList();
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  Future<Result<HuellaApiModel>> postHuella(HuellaApiModel huella) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final response = await dio.post('/api/rh/huellas/', data: huella.toJson());
      final result = HuellaApiModel.fromJson(response.data);
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  Future<Result<void>> deleteHuella(int id) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      await dio.delete('/api/rh/huellas/$id/');
      return const Result.ok(null);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  // EMPLEADOS
  Future<Result<EmpleadoApiModel>> getEmpleado(int id) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final response = await dio.get('/api/rh/empleados/$id/');
      final result = EmpleadoApiModel.fromJson(response.data);
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  Future<Result<List<EmpleadoApiModel>>> getEmpleados() async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final response = await dio.get('/api/rh/empleados/');
      final result = (response.data as List)
      .map((json) => EmpleadoApiModel.fromJson(json))
      .toList();
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  // PRACTICANTES
  Future<Result<List<PracticanteApiModel>>> getPracticantes() async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final response = await dio.get('/api/rh/PracticantesResidentes/');
      final result = (response.data as List)
      .map((json) => PracticanteApiModel.fromJson(json))
      .toList();
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  Future<Result<PracticanteApiModel>> getPracticante(int id) async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final response = await dio.get('/api/rh/PracticantesResidentes/$id/');
      final result = PracticanteApiModel.fromJson(response.data);
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  // UNIVERSIDADES
  Future<Result<List<Universidad>>> getUniversidades() async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final response = await dio.get('/api/rh/Universidad/');
      final result = (response.data as List)
      .map((json) => Universidad.fromJson(json))
      .toList();
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  // PUESTOS
  Future<Result<List<Puesto>>> getPuestos() async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final response = await dio.get('/api/rh/puesto/');
      final result = (response.data as List)
      .map((json) => Puesto.fromJson(json))
      .toList();
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }

  // USUARIOS
  Future<Result<List<User>>> getUsers() async {
    final dio = _dioFactory();
    try {
      _authHeader(dio);
      final response = await dio.get('/api/usuarios/obtener-todos-usuarios-simple/');
      final result = (response.data as List)
      .map((json) => User.fromJson(json))
      .toList();
      return Result.ok(result);
    } on DioException catch (e) {
      return Result.error(ApiException.fromDioException(e));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }
}

class ApiException implements Exception {
  final String message;
  final int statusCode;

  const ApiException(this.message, this.statusCode);

  @override
  String toString() {
    return 'ApiException: [$statusCode] $message';
  }

  factory ApiException.fromDioException(DioException e) {
    return ApiException(e.response?.data?.toString() ?? 'No message provided', e.response?.statusCode ?? 0);
  }
}