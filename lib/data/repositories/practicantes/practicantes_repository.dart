import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class PracticantesRepository {
  /// List practicantes.
  Future<Result<List<Practicante>>> getPracticantes();

  /// Retrieve practicante.
  Future<Result<Practicante>> getPracticante(int id);

  /// Forces the next [getPracticantes]/[getPracticante] call to fetch fresh
  /// data instead of returning a cached result.
  void invalidateCache();

  /// Transitions a practicante/residente between alta and baja. Returns a
  /// confirmation message from the backend (e.g. unpaid nominas removed as
  /// a side effect).
  Future<Result<String>> cambiarEstado(int practicanteId, StatusPracticante nuevoEstado, {
    DateTime? fechaBaja,
    PlatformFile? cartaLiberacion,
  });
}