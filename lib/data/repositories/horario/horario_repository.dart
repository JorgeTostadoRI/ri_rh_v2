import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class HorarioRepository {
  /// List horarios.
  Future<Result<List<Horario>>> getHorarios();

  /// Create a new horario.
  Future<Result<Horario>> createHorario(Horario horario);

  /// Invalidate any cached horarios so the next [getHorarios] refetches.
  void invalidateCache();
}