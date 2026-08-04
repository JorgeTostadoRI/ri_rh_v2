import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_pending_count_response.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia_query.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class IncidenciasRepository {
  /// Crea una solicitud de [Incidencia]
  Future<Result<void>> createIncidencia(Incidencia incidencia);

  /// Obten un listado de [Incidencia]
  Future<Result<List<Incidencia>>> getIncidencias(String category, {IncidenciaQuery? query});

  /// Aprueba una [Incidencia]
  Future<Result<Incidencia>> approveIncidencia(String category, int id);

  /// Rechaza una [Incidencia]
  Future<Result<Incidencia>> rejectIncidencia(String category, int id);

  /// Obtiene el numero de incidencias pendientes a revisar
  Future<Result<IncidenciaPendingCountResponse>> getIncidenciasPendingCount();
}