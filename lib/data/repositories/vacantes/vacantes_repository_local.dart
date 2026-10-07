import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/utils/result.dart';

class VacantesRepositoryLocal extends VacantesRepository {
  int _sequentialId = 0;
  final _solicitudes = List<SolicitudVacante>.empty(growable: true);

  @override
  Future<Result<List<SolicitudVacante>>> getSolicitudes() async {
    return Result.ok(_solicitudes.toList());
  }

  @override
  Future<Result<SolicitudVacante>> createSolicitud({
    required int puestoId,
    required String rol,
    required int cantidad,
    required String area,
    required int turnoId,
    required String justificacion,
  }) async {
    final result = SolicitudVacante(
      id: ++_sequentialId,
      puesto: puestoId,
      rol: rol,
      cantidad: cantidad,
      area: area,
      turno: turnoId,
      justificacion: justificacion,
      createdAt: DateTime.now(),
    );
    _solicitudes.add(result);
    return Result.ok(result);
  }

  @override
  Future<Result<SolicitudVacante>> updateSolicitud({
    required int id,
    required int puestoId,
    required String rol,
    required int cantidad,
    required String area,
    required int turnoId,
    required String justificacion,
  }) async {
    final index = _solicitudes.indexWhere((s) => s.id == id);
    if (index == -1) return Result.error(Exception('Not found'));
    final updated = _solicitudes[index].copyWith(
      puesto: puestoId,
      rol: rol,
      cantidad: cantidad,
      area: area,
      turno: turnoId,
      justificacion: justificacion,
    );
    _solicitudes[index] = updated;
    return Result.ok(updated);
  }

  @override
  Future<Result<SolicitudVacante>> cambiarEstatus(int id, String estatus) async {
    final index = _solicitudes.indexWhere((s) => s.id == id);
    if (index == -1) return Result.error(Exception('Not found'));
    final updated = _solicitudes[index].copyWith(estatus: EstatusVacante.values.byName(estatus));
    _solicitudes[index] = updated;
    return Result.ok(updated);
  }
}
