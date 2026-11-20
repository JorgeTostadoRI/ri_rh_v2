import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/fingerprint/fingerprint_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/models/scan/scan.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_date_option.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia/incidencia_query.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/utils/result.dart';

User _persona(int id) => User(
  id: id,
  username: 'u$id',
  nombre: 'Persona $id',
  telefono: '',
  correo: '',
  departamentosPermitidos: const [],
  liderPermitido: false,
  isRemote: true,
);

final _josue = _persona(1);

class _Sesion extends AuthRepository {
  @override
  Future<bool> get isAuthenticated async => true;
  @override
  Future<bool> get isRH async => false;
  @override
  Future<Result<User>> login({required String username, required String password}) => throw UnimplementedError();
  @override
  Future<Result<User>> loginViaChallenge(String username) => throw UnimplementedError();
  @override
  Future<Result<void>> logout() async => const Result.ok(null);
  @override
  User? getCurrentUser() => _josue;
  @override
  Future<Result<void>> updateRole(String role) => throw UnimplementedError();
  @override
  Future<Result<void>> updateDepartment(Departamento department) => throw UnimplementedError();
}

class _Huellas implements FingerprintRepository {
  @override
  Stream<Scan> capture() => const Stream.empty();
  @override
  Future<void> loadFingerprints() async {}
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

/// Servidor simulado: [guardadas] son las incidencias que ya tiene.
class _Incidencias implements IncidenciasRepository {
  List<Incidencia> guardadas = [];
  Exception? fallaAlConsultar;
  int enviadas = 0;
  IncidenciaQuery? consulta;

  @override
  Future<Result<void>> createIncidencia(Incidencia incidencia) async {
    enviadas++;
    guardadas = [...guardadas, incidencia.copyWith(id: guardadas.length + 1, state: IncidenciaState.pending)];
    return const Result.ok(null);
  }

  @override
  Future<Result<List<Incidencia>>> getIncidencias({IncidenciaQuery? query}) async {
    consulta = query;
    if (fallaAlConsultar != null) return Result.error(fallaAlConsultar!);
    return Result.ok(guardadas);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

/// Falta del 19/11/2026 de 8:00 a 10:30 ya capturada en el formulario.
NewIncidenciaViewmodel _formulario(_Incidencias servidor) => NewIncidenciaViewmodel(
  log: AppLogger(loggers: const []),
  authRepository: _Sesion(),
  incidenciasRepository: servidor,
  fingerprintRepository: _Huellas(),
)
  ..initDateOption(IncidenciaDateOption.HOUR_RANGE)
  ..onStartDateSaved(DateTime(2026, 11, 19))
  ..onStartTimeSaved(const TimeOfDay(hour: 8, minute: 0))
  ..onEndTimeSaved(const TimeOfDay(hour: 10, minute: 30))
  ..onReasonChanged('no pude asistir por un problema personal');

Incidencia _guardada({
  User? solicitor,
  IncidenciaCategory category = IncidenciaCategory.falta,
  IncidenciaState state = IncidenciaState.pending,
  DateTime? start,
}) => Incidencia(
  id: 99,
  solicitor: solicitor ?? _josue,
  category: category,
  state: state,
  start: (start ?? DateTime(2026, 11, 19, 8)).toUtc(),
  end: DateTime(2026, 11, 19, 10, 30).toUtc(),
  reason: 'no pude asistir por un problema personal',
  files: const [],
);

void main() {
  test('un envío normal se manda sin revisar antes', () async {
    final servidor = _Incidencias();
    final resultado = await _formulario(servidor).submitData(IncidenciaCategory.falta);

    expect((resultado as Ok<EnvioIncidencia>).value, EnvioIncidencia.enviada);
    expect(servidor.enviadas, 1);
    expect(servidor.consulta, isNull);
  });

  test('reintento: si el intento anterior sí se guardó, no la duplica', () async {
    final servidor = _Incidencias()..guardadas = [_guardada()];
    final resultado = await _formulario(servidor).submitData(IncidenciaCategory.falta, reintento: true);

    expect((resultado as Ok<EnvioIncidencia>).value, EnvioIncidencia.yaRegistrada);
    expect(servidor.enviadas, 0);
    // Solo busca las suyas, de ese tipo y de ese día.
    expect(servidor.consulta!.solicitores, [_josue.id]);
    expect(servidor.consulta!.categories, [IncidenciaCategory.falta]);
    expect(servidor.consulta!.startRange!.start, DateTime(2026, 11, 19));
  });

  test('reintento: si no se había guardado, la envía', () async {
    final servidor = _Incidencias();
    final resultado = await _formulario(servidor).submitData(IncidenciaCategory.falta, reintento: true);

    expect((resultado as Ok<EnvioIncidencia>).value, EnvioIncidencia.enviada);
    expect(servidor.enviadas, 1);
  });

  test('reintento: otra parecida (otro tipo, otra hora, otra persona o rechazada) no cuenta como la misma', () async {
    final servidor = _Incidencias()
      ..guardadas = [
        _guardada(category: IncidenciaCategory.permiso),
        _guardada(start: DateTime(2026, 11, 19, 9)),
        _guardada(solicitor: _persona(2)),
        _guardada(state: IncidenciaState.rejected),
      ];
    final resultado = await _formulario(servidor).submitData(IncidenciaCategory.falta, reintento: true);

    expect((resultado as Ok<EnvioIncidencia>).value, EnvioIncidencia.enviada);
    expect(servidor.enviadas, 1);
  });

  test('reintento: si no se puede confirmar, no la reenvía (podría duplicarla)', () async {
    final servidor = _Incidencias()
      ..fallaAlConsultar = const ApiException('tiempo', 0, tiempoAgotado: true);
    final resultado = await _formulario(servidor).submitData(IncidenciaCategory.falta, reintento: true);

    final error = (resultado as Error<EnvioIncidencia>).error;
    expect(error, isA<ApiException>().having((e) => e.tiempoAgotado, 'tiempoAgotado', isTrue));
    expect(servidor.enviadas, 0);
  });
}
