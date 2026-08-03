import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia_query.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class IncidenciasRepository {
  /// Crea una solicitud de [Incidencia]
  Future<Result<void>> createIncidencia(Incidencia incidencia);

  /// Obten un listado de [Incidencia]
  Future<Result<List<Incidencia>>> getIncidencias(String category, {IncidenciaQuery? query});
}