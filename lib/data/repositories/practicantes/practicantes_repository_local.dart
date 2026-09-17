import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/local/local_data_service.dart';
import 'package:ri_rh_v2/domain/models/credenciales_generadas/credenciales_generadas.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/utils/result.dart';

class PracticantesRepositoryLocal extends PracticantesRepository {
  PracticantesRepositoryLocal({
    required this._localDataService,
  });

  final LocalDataService _localDataService;

  List<Practicante>? _cachedPracticantes = [];

  @override
  Future<Result<List<Practicante>>> getPracticantes() async {
    final practicantes = await _localDataService.getPracticantes();
    _cachedPracticantes = practicantes;
    return Result.ok(practicantes);
  }

  @override
  Future<Result<Practicante>> getPracticante(int id) async {
    if (_cachedPracticantes == null) {
      final resultPracticantes = await getPracticantes();
      switch (resultPracticantes) {
        case Error():
          return Result.error(resultPracticantes.error);
        case Ok():
      }
    }

    final index = _cachedPracticantes!.indexWhere((practicante) => practicante.base.id == id);
    if (index == -1) {
      return Result.error(Exception('Practicante not found'));
    }

    return Result.ok(_cachedPracticantes![index]);
  }

  @override
  void invalidateCache() {
    _cachedPracticantes = null;
  }

  @override
  Future<Result<String>> cambiarEstado(int practicanteId, StatusPracticante nuevoEstado, {
    DateTime? fechaBaja,
    PlatformFile? cartaLiberacion,
  }) async {
    return const Result.ok('Estado actualizado correctamente');
  }

  @override
  Future<Result<Practicante>> createPracticante(PracticanteCreateParams params) async {
    return Result.error(Exception('No soportado en modo local'));
  }

  @override
  Future<Result<List<Puesto>>> getPuestos() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<List<Universidad>>> getUniversidades() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<Puesto>> createPuesto(String nombre, String tipos) async {
    return Result.ok(Puesto(nombre: nombre, tipo: TipoPuesto.values.byName(tipos)));
  }

  @override
  Future<Result<Universidad>> createUniversidad(String nombre, String direccion, String numeroContacto) async {
    return Result.ok(Universidad(nombre: nombre, direccion: direccion, numeroContacto: numeroContacto));
  }

  @override
  Future<Result<List<Departamento>>> getDepartamentos() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<CredencialesGeneradas>> regenerarPassword(int practicanteId) async {
    return Result.error(Exception('No soportado en modo local'));
  }
}