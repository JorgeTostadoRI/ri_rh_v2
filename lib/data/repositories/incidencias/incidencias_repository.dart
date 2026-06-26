import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class IncidenciasRepository {
  /// Crea una solicitud de [Incidencia]
  Future<Result<void>> createIncidencia(Incidencia incidencia);
}