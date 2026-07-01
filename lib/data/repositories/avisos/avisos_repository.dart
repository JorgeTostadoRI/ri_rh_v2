import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class AvisosRepository {
  /// Obtener avisos
  Future<Result<List<Aviso>>> getAvisos({DateTime? query});

  /// Crear aviso
  Future<Result<Aviso>> createAviso(Aviso aviso);
}