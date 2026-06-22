import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/login_request/login_request.dart';
import 'package:ri_rh_v2/data/services/api/models/auth/login_response/login_response.dart';
import 'package:ri_rh_v2/utils/result.dart';

class AuthApiClient {
  AuthApiClient({Dio Function()? dioFactory})
    : _dioFactory = dioFactory ?? (() => Dio());

  final Dio Function() _dioFactory;

  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    final dio = _dioFactory();
    try {

      final response = await dio.post('/api/login/', data: loginRequest.toJson());
      if (response.statusCode == 200) {
        return Result.ok(LoginResponse.fromJson(response.data));
      } else {
        return const Result.error(HttpException("Login error"));
      }
    } on DioException catch (e) {
      return Result.error(Exception("${e.response?.statusCode} - ${e.response?.data}"));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      dio.close();
    }
  }
}