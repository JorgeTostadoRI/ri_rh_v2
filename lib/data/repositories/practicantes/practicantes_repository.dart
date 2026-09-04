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
}