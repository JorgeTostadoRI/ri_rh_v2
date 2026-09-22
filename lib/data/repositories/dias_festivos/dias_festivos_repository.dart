import 'package:ri_rh_v2/domain/models/dias_festivos/dia_festivo.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class DiasFestivosRepository {
  /// Obtener los dias festivos marcados
  Future<Result<List<DiaFestivo>>> getDiasFestivos();

  /// Marcar una fecha como dia festivo
  Future<Result<DiaFestivo>> createDiaFestivo(DiaFestivo diaFestivo);

  /// Desmarcar una fecha como dia festivo
  Future<Result<void>> deleteDiaFestivo(int id);
}
