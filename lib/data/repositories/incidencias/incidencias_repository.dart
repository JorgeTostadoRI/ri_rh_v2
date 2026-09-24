import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia/incidencia_query.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class IncidenciasRepository {
  /// Crea una solicitud de [Incidencia]
  Future<Result<void>> createIncidencia(Incidencia incidencia);

  /// Obten un listado de [Incidencia]
  Future<Result<List<Incidencia>>> getIncidencias({IncidenciaQuery? query});

  /// Obten un [List<Incidencia>] pendientes de revisión
  Future<Result<List<Incidencia>>> getIncidenciasToReview({IncidenciaQuery? query});

  /// Aprueba una [Incidencia].
  ///
  /// [conGoce] solo aplica cuando es un Permiso y lo aprueba el jefe
  /// directo (primer paso) -- decide si es con o sin goce de sueldo.
  Future<Result<Incidencia>> approveIncidencia(Incidencia incidencia, {bool? conGoce});

  /// Rechaza una [Incidencia].
  /// 
  /// Debe incluir el motivo de rechazo.
  Future<Result<Incidencia>> rejectIncidencia(Incidencia incidencia);

  /// Obtiene el numero de incidencias pendientes a revisar
  Future<Result<int>> getIncidenciasToReviewCount();

  /// Generar el PDF de la incidencia
  Future<Result<Incidencia>> generatePDF(Incidencia incidencia, bool force);
}