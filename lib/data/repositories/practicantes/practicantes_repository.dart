import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class PracticantesRepository {
  /// List practicantes.
  Future<Result<List<Practicante>>> getPracticantes();

  /// Retrieve practicante.
  Future<Result<Practicante>> getPracticante(int id);
}