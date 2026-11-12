import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository_remote.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia/incidencia_query.dart';
import 'package:ri_rh_v2/domain/models/query/user/user_query.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/result.dart';

User _user(int id) => User(
      id: id,
      username: 'u$id',
      nombre: 'Usuario $id',
      telefono: '',
      correo: 'u$id@example.com',
      departamentosPermitidos: const [],
      liderPermitido: false,
    );

IncidenciaApiModel _incidencia(int id, {required int solicitor, int? jefe}) => IncidenciaApiModel(
      id: id,
      solicitorRef: solicitor,
      approvedByRef: jefe,
      start: DateTime(2026, 11, 4, 17),
      end: DateTime(2026, 11, 4, 20),
      reason: 'prueba',
      files: const [],
      category: IncidenciaCategory.horasextra,
    );

/// API simulada: [usuarios] e [incidencias] se pueden cambiar entre llamadas
/// para simular altas mientras la app está abierta.
class _ApiFalsa implements ApiClient {
  List<User> usuarios = [];
  List<IncidenciaApiModel> incidencias = [];
  int pedidasDeUsuarios = 0;

  @override
  Future<Result<List<User>>> getUsers({UserQuery? query}) async {
    pedidasDeUsuarios++;
    return Result.ok(List.of(usuarios));
  }

  @override
  Future<Result<List<IncidenciaApiModel>>> getIncidenciasToReview({IncidenciaQuery? query}) async =>
      Result.ok(List.of(incidencias));

  @override
  Future<Result<List<IncidenciaApiModel>>> getIncidencias({IncidenciaQuery? query}) async =>
      Result.ok(List.of(incidencias));

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError(invocation.memberName.toString());
}

void main() {
  late _ApiFalsa api;
  late IncidenciasRepositoryRemote repo;

  setUp(() {
    api = _ApiFalsa()
      ..usuarios = [_user(1), _user(2)]
      ..incidencias = [_incidencia(10, solicitor: 1, jefe: 2)];
    repo = IncidenciasRepositoryRemote(apiClient: api);
  });

  test('guarda la lista de usuarios mientras no falte nadie', () async {
    expect(await repo.getIncidenciasToReview(), isA<Ok<List<Incidencia>>>());
    expect(await repo.getIncidenciasToReview(), isA<Ok<List<Incidencia>>>());
    expect(api.pedidasDeUsuarios, 1);
  });

  test('usuario dado de alta después de abrir la app: vuelve a pedir la lista una vez', () async {
    await repo.getIncidenciasToReview();

    // Se crea un usuario nuevo (y su jefe) y manda su primera incidencia.
    api.usuarios = [_user(1), _user(2), _user(3), _user(4)];
    api.incidencias = [...api.incidencias, _incidencia(11, solicitor: 3, jefe: 4)];

    final result = await repo.getIncidenciasToReview();
    expect(result, isA<Ok<List<Incidencia>>>());
    final incidencias = (result as Ok<List<Incidencia>>).value;
    expect(incidencias.map((i) => i.solicitor!.nombre), ['Usuario 1', 'Usuario 3']);
    expect(api.pedidasDeUsuarios, 2);

    // Ya con la lista nueva no vuelve a pedirla.
    await repo.getIncidencias();
    expect(api.pedidasDeUsuarios, 2);
  });

  test('si de verdad no existe, falla como antes (sin pedir la lista en bucle)', () async {
    api.incidencias = [_incidencia(12, solicitor: 99)];
    final result = await repo.getIncidenciasToReview();
    expect(result, isA<Error<List<Incidencia>>>());
    expect(api.pedidasDeUsuarios, 2);
  });
}
