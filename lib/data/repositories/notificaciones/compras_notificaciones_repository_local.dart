import 'package:ri_rh_v2/data/repositories/notificaciones/compras_notificaciones_repository.dart';
import 'package:ri_rh_v2/domain/models/notificaciones/aviso_compra.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Implementación local (modo desarrollo sin backend) sin avisos.
class ComprasNotificacionesRepositoryLocal
    extends ComprasNotificacionesRepository {
  @override
  Future<Result<ResumenCompras>> getResumen() async {
    return const Result.ok(
      ResumenCompras(noLeidas: 0, avisos: []),
    );
  }

  @override
  Future<Result<void>> marcarLeida(int id) async {
    return const Result.ok(null);
  }
}
