import 'package:ri_rh_v2/utils/result.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';

abstract class AsistenciaRepository {
  /// Registra una [Asistencia]
  Future<Result<void>> createAsistencia(Asistencia asistencia);
}