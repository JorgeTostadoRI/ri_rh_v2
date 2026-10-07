import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto_params.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

typedef VacanteRowParams = ({int puestoId, String rol, int cantidad});
typedef SolicitudEditParams = ({int id, int puestoId, String rol, int cantidad});
typedef SolicitudEstatusParams = ({int id, String estatus});

// Fase B (temporal): mismo criterio que usa el backend en
// IsLiderRHoDireccion. Se ampliará a cualquier líder más adelante.
const _departamentosConAcceso = ['Recursos Humanos', 'Direccion'];

class VacantesViewmodel extends ChangeNotifier {
  VacantesViewmodel({
    required this._log,
    required this._vacantesRepository,
    required this._empleadosRepository,
    required this._authRepository,
  }) {
    load = Command0(_load)..execute();
    createBatch = Command1(_createBatch);
    updateSolicitud = Command1(_updateSolicitud);
    cambiarEstatus = Command1(_cambiarEstatus);
    createPuesto = Command1(_createPuesto);
    editPuesto = Command1(_editPuesto);
  }

  final AppLogger _log;
  final VacantesRepository _vacantesRepository;
  // Reutiliza el catálogo de puestos/departamentos y las operaciones de
  // Puesto que ya expone EmpleadosRepository (no hace falta duplicarlas).
  final EmpleadosRepository _empleadosRepository;
  final AuthRepository _authRepository;

  late final Command0 load;
  late final Command1<List<SolicitudVacante>, List<VacanteRowParams>> createBatch;
  late final Command1<SolicitudVacante, SolicitudEditParams> updateSolicitud;
  late final Command1<SolicitudVacante, SolicitudEstatusParams> cambiarEstatus;
  late final Command1<Puesto, PuestoCreateParams> createPuesto;
  late final Command1<Puesto, PuestoEditParams> editPuesto;

  List<SolicitudVacante> _solicitudes = [];
  List<SolicitudVacante> get solicitudes => _solicitudes;

  List<Puesto> _puestos = [];
  List<Puesto> get puestos => _puestos;

  List<Departamento> _departamentos = [];
  List<Departamento> get departamentos => _departamentos;

  bool _hasPermissions = false;
  bool get hasPermissions => _hasPermissions;

  bool _esDireccion = false;
  bool get esDireccion => _esDireccion;

  void _sort() {
    _solicitudes.sort((a, b) => (b.createdAt ?? DateTime(0)).compareTo(a.createdAt ?? DateTime(0)));
  }

  void _replacePuesto(Puesto puesto) {
    _puestos = [
      for (final p in _puestos)
        if (p.id == puesto.id) puesto else p,
    ];
  }

  Future<Result<void>> _load() async {
    final currentUser = _authRepository.getCurrentUser();
    _hasPermissions = currentUser?.rol == 'LIDER' && _departamentosConAcceso.contains(currentUser?.departamento?.nombre);
    _esDireccion = currentUser?.departamento?.nombre == 'Direccion';

    final resultSolicitudes = await _vacantesRepository.getSolicitudes();
    switch (resultSolicitudes) {
      case Error():
        _log.warning('Failed to load solicitudes de vacante', error: resultSolicitudes.error);
        return Result.error(resultSolicitudes.error);
      case Ok():
    }

    final resultPuestos = await _empleadosRepository.getPuestos();
    switch (resultPuestos) {
      case Error():
        _log.warning('Failed to load puestos', error: resultPuestos.error);
        return Result.error(resultPuestos.error);
      case Ok():
    }

    final resultDepartamentos = await _empleadosRepository.getDepartamentos();
    switch (resultDepartamentos) {
      case Error():
        _log.warning('Failed to load departamentos', error: resultDepartamentos.error);
        return Result.error(resultDepartamentos.error);
      case Ok():
    }

    _solicitudes = resultSolicitudes.value;
    _sort();
    _puestos = resultPuestos.value;
    _departamentos = resultDepartamentos.value;
    notifyListeners();
    return const Result.ok(null);
  }

  /// Crea una SolicitudVacante independiente por cada fila (así Dirección
  /// puede aceptar/rechazar cada una por separado). Se detiene en el primer
  /// error; lo ya creado hasta ese punto queda creado (no hay rollback) y se
  /// refleja en [solicitudes].
  Future<Result<List<SolicitudVacante>>> _createBatch(List<VacanteRowParams> filas) async {
    final creadas = <SolicitudVacante>[];
    for (final fila in filas) {
      final result = await _vacantesRepository.createSolicitud(
        puestoId: fila.puestoId,
        rol: fila.rol,
        cantidad: fila.cantidad,
      );
      switch (result) {
        case Error():
          _log.warning('Failed to create solicitud de vacante', error: result.error);
          _solicitudes = [..._solicitudes, ...creadas];
          _sort();
          notifyListeners();
          return Result.error(result.error);
        case Ok():
          creadas.add(result.value);
      }
    }
    _solicitudes = [..._solicitudes, ...creadas];
    _sort();
    notifyListeners();
    return Result.ok(creadas);
  }

  Future<Result<SolicitudVacante>> _updateSolicitud(SolicitudEditParams params) async {
    final result = await _vacantesRepository.updateSolicitud(
      id: params.id,
      puestoId: params.puestoId,
      rol: params.rol,
      cantidad: params.cantidad,
    );
    switch (result) {
      case Error():
        _log.warning('Failed to update solicitud de vacante', error: result.error);
        return Result.error(result.error);
      case Ok():
    }
    _solicitudes = [
      for (final s in _solicitudes)
        if (s.id == result.value.id) result.value else s,
    ];
    notifyListeners();
    return Result.ok(result.value);
  }

  Future<Result<SolicitudVacante>> _cambiarEstatus(SolicitudEstatusParams params) async {
    final result = await _vacantesRepository.cambiarEstatus(params.id, params.estatus);
    switch (result) {
      case Error():
        _log.warning('Failed to cambiar estatus de solicitud de vacante', error: result.error);
        return Result.error(result.error);
      case Ok():
    }
    _solicitudes = [
      for (final s in _solicitudes)
        if (s.id == result.value.id) result.value else s,
    ];
    notifyListeners();
    return Result.ok(result.value);
  }

  Future<Result<Puesto>> _createPuesto(PuestoCreateParams params) async {
    final result = await _empleadosRepository.createPuesto(
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
    final tabulador = params.tabuladorSalarial;
    if (tabulador != null) {
      final uploadResult = await _empleadosRepository.uploadTabuladorSalarial(puesto.id!, tabulador);
      switch (uploadResult) {
        case Error():
          _log.warning('Puesto creado pero falló la subida del tabulador salarial', error: uploadResult.error);
        case Ok():
          puesto = uploadResult.value;
      }
    }

    _puestos = [..._puestos, puesto];
    notifyListeners();
    return Result.ok(puesto);
  }

  Future<Result<Puesto>> _editPuesto(PuestoEditParams params) async {
    final result = await _empleadosRepository.updatePuesto(
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
    final tabulador = params.tabuladorSalarial;
    if (tabulador != null) {
      final uploadResult = await _empleadosRepository.uploadTabuladorSalarial(puesto.id!, tabulador);
      switch (uploadResult) {
        case Error():
          _log.warning('Puesto editado pero falló la subida del tabulador salarial', error: uploadResult.error);
        case Ok():
          puesto = uploadResult.value;
      }
    }

    _replacePuesto(puesto);
    notifyListeners();
    return Result.ok(puesto);
  }
}
