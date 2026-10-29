import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto_params.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// El jefe directo contesta, desde su propia pantalla (autenticada), la
/// evaluación de un practicante por terminar sus prácticas -- llega aquí
/// por el link del correo que se le manda 7 días antes de su fecha de
/// terminación. Mismo esquema que `EvaluacionJefeViewmodel` (empleados).
///
/// Para "contratar" elige el puesto como empleado, y con sesión puede crear,
/// editar o eliminar puestos igual que en Nuevo Empleado (mismo catálogo y
/// mismas operaciones que `NuevoEmpleadoViewmodel`). Sin sesión (`publica`)
/// solo elige de la lista que trae la evaluación.
class EvaluacionPracticanteViewmodel extends ChangeNotifier {
  EvaluacionPracticanteViewmodel({
    required this.token,
    this.publica = false,
    required this._log,
    required this._practicantesRepository,
    this._empleadosRepository,
  }) {
    load = Command1(_load)..execute(token);
    responder = Command1(_responder);
    loadCatalogos = Command0(_loadCatalogos);
    createPuesto = Command1(_createPuesto);
    editPuesto = Command1(_editPuesto);
    deletePuesto = Command1(_deletePuesto);
    if (puedeEditarPuestos) loadCatalogos.execute();
  }

  final String token;

  /// Sin sesión -- solo la jefa que contesta desde el link del correo.
  final bool publica;
  final AppLogger _log;
  final PracticantesRepository _practicantesRepository;
  final EmpleadosRepository? _empleadosRepository;

  /// Crear/editar/eliminar puestos requiere sesión.
  bool get puedeEditarPuestos => !publica && _empleadosRepository != null;

  late final Command1<EvaluacionPracticanteDetalle, String> load;
  EvaluacionPracticanteDetalle? _detalle;
  EvaluacionPracticanteDetalle? get detalle => _detalle;

  late final Command1<
    void,
    ({EvaluacionPracticanteRespuesta respuesta, String? motivo, PropuestaContratacion? contratacion})
  >
  responder;

  late final Command0 loadCatalogos;
  late final Command1<Puesto, PuestoCreateParams> createPuesto;
  late final Command1<Puesto, PuestoEditParams> editPuesto;
  late final Command1<int, int> deletePuesto;

  List<Puesto> _puestos = [];
  List<Puesto> get puestos => _puestos;

  List<Departamento> _departamentos = [];
  List<Departamento> get departamentos => _departamentos;

  /// Lo que se ofrece en "PUESTO COMO EMPLEADO": con sesión, el catálogo
  /// completo (se actualiza al crear/editar/eliminar); sin sesión, la lista
  /// que trae la evaluación.
  List<({int id, String nombre, String? rol})> get opcionesPuesto => puedeEditarPuestos
      ? [for (final p in _puestos) (id: p.id!, nombre: p.nombre, rol: p.rol)]
      : _detalle?.puestos ?? const [];

  Future<Result<EvaluacionPracticanteDetalle>> _load(String token) async {
    final result = await _practicantesRepository.getEvaluacion(token, publica: publica);
    switch (result) {
      case Error():
        _log.warning('Failed to load evaluacion de practicante', error: result.error);
      case Ok():
        _detalle = result.value;
    }
    notifyListeners();
    return result;
  }

  Future<Result<void>> _responder(
    ({EvaluacionPracticanteRespuesta respuesta, String? motivo, PropuestaContratacion? contratacion}) params,
  ) async {
    final result = await _practicantesRepository.responderEvaluacion(
      token,
      params.respuesta,
      motivo: params.motivo,
      contratacion: params.contratacion,
      publica: publica,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to responder evaluacion de practicante', error: result.error);
        return result;
      case Ok():
    }
    await load.execute(token);
    return result;
  }

  Future<Result<void>> _loadCatalogos() async {
    final repository = _empleadosRepository!;
    final resultPuestos = await repository.getPuestos();
    switch (resultPuestos) {
      case Error():
        _log.warning('Failed to load puestos', error: resultPuestos.error);
        return Result.error(resultPuestos.error);
      case Ok():
    }

    final resultDepartamentos = await repository.getDepartamentos();
    switch (resultDepartamentos) {
      case Error():
        _log.warning('Failed to load departamentos', error: resultDepartamentos.error);
        return Result.error(resultDepartamentos.error);
      case Ok():
    }

    _puestos = resultPuestos.value;
    _departamentos = resultDepartamentos.value;
    notifyListeners();
    return const Result.ok(null);
  }

  Future<Result<Puesto>> _createPuesto(PuestoCreateParams params) async {
    final repository = _empleadosRepository!;
    final result = await repository.createPuesto(
      params.nombre,
      params.tipos,
      rol: params.rol,
      responsabilidades: params.responsabilidades,
      departamentoIds: params.departamentoIds,
      preguntas: params.preguntas,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to create puesto', error: result.error);
        return Result.error(result.error);
      case Ok():
    }

    var puesto = result.value;
    _puestos = [..._puestos, puesto];
    notifyListeners();

    // El tabulador se sube en un segundo paso (multipart) una vez que el
    // Puesto ya existe -- igual que en NuevoEmpleadoViewmodel.
    final tabulador = params.tabuladorSalarial;
    if (tabulador != null) {
      final uploadResult = await repository.uploadTabuladorSalarial(puesto.id!, tabulador);
      switch (uploadResult) {
        case Error():
          _log.warning('Puesto creado pero falló la subida del tabulador salarial', error: uploadResult.error);
          return Result.error(uploadResult.error);
        case Ok():
          puesto = uploadResult.value;
          _reemplazarPuesto(puesto);
      }
    }

    return Result.ok(puesto);
  }

  Future<Result<Puesto>> _editPuesto(PuestoEditParams params) async {
    final repository = _empleadosRepository!;
    final result = await repository.updatePuesto(
      params.id,
      nombre: params.nombre,
      tipos: params.tipos,
      rol: params.rol,
      responsabilidades: params.responsabilidades,
      departamentoIds: params.departamentoIds,
      preguntas: params.preguntas,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to update puesto', error: result.error);
        return Result.error(result.error);
      case Ok():
    }

    var puesto = result.value;
    _reemplazarPuesto(puesto);

    final tabulador = params.tabuladorSalarial;
    if (tabulador != null) {
      final uploadResult = await repository.uploadTabuladorSalarial(puesto.id!, tabulador);
      switch (uploadResult) {
        case Error():
          _log.warning('Puesto editado pero falló la subida del tabulador salarial', error: uploadResult.error);
          return Result.error(uploadResult.error);
        case Ok():
          puesto = uploadResult.value;
          _reemplazarPuesto(puesto);
      }
    }

    return Result.ok(puesto);
  }

  Future<Result<int>> _deletePuesto(int id) async {
    final result = await _empleadosRepository!.deletePuesto(id);
    switch (result) {
      case Error():
        _log.warning('Failed to delete puesto', error: result.error);
        return Result.error(result.error);
      case Ok():
    }
    _puestos = _puestos.where((p) => p.id != id).toList();
    notifyListeners();
    return Result.ok(id);
  }

  void _reemplazarPuesto(Puesto puesto) {
    _puestos = [
      for (final p in _puestos)
        if (p.id == puesto.id) puesto else p,
    ];
    notifyListeners();
  }
}
