import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class PracticantesRepository {
  Future<Result<List<Practicante>>> getPracticantes();
}