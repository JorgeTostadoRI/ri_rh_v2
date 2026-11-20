import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Servidor simulado: guarda la solicitud que le llegó y responde [falla] o
/// una incidencia creada.
class _Servidor implements HttpClientAdapter {
  RequestOptions? recibida;
  DioExceptionType? falla;

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    recibida = options;
    await requestStream?.drain<void>();
    if (falla != null) throw DioException(requestOptions: options, type: falla!);
    return ResponseBody.fromString(
      '{"id": 1, "start": "2026-11-19T08:00:00", "end": "2026-11-19T18:00:00", '
      '"reason": "no pude asistir", "files": [], "category": "falta"}',
      201,
      headers: {Headers.contentTypeHeader: [Headers.jsonContentType]},
    );
  }

  @override
  void close({bool force = false}) {}
}

IncidenciaApiModel _incidencia() => IncidenciaApiModel(
      start: DateTime(2026, 11, 19, 8),
      end: DateTime(2026, 11, 19, 18),
      reason: 'no pude asistir',
      files: const [],
      category: IncidenciaCategory.falta,
    );

void main() {
  late _Servidor servidor;
  late ApiClient api;

  setUp(() {
    servidor = _Servidor();
    api = ApiClient(
      dioFactory: () => Dio(BaseOptions(
        baseUrl: 'http://servidor',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 60),
      ))..httpClientAdapter = servidor,
    );
  });

  test('enviar una incidencia espera hasta 3 minutos (subir el video)', () async {
    final resultado = await api.postIncidencia(_incidencia());

    expect(resultado, isA<Ok<IncidenciaApiModel>>());
    expect(servidor.recibida!.sendTimeout, const Duration(minutes: 3));
    expect(servidor.recibida!.receiveTimeout, const Duration(minutes: 3));
  });

  for (final tipo in [
    DioExceptionType.connectionTimeout,
    DioExceptionType.sendTimeout,
    DioExceptionType.receiveTimeout,
  ]) {
    test('si se agota el tiempo ($tipo) se reconoce como tiempo agotado', () async {
      servidor.falla = tipo;
      final resultado = await api.postIncidencia(_incidencia());

      final error = (resultado as Error<IncidenciaApiModel>).error;
      expect(error, isA<ApiException>().having((e) => e.tiempoAgotado, 'tiempoAgotado', isTrue));
    });
  }

  test('otros errores de red no se confunden con tiempo agotado', () async {
    servidor.falla = DioExceptionType.connectionError;
    final resultado = await api.postIncidencia(_incidencia());

    final error = (resultado as Error<IncidenciaApiModel>).error;
    expect(error, isA<ApiException>().having((e) => e.tiempoAgotado, 'tiempoAgotado', isFalse));
  });
}
