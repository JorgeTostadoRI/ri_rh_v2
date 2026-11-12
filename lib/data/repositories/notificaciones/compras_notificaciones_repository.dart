import 'package:ri_rh_v2/domain/models/notificaciones/aviso_compra.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Acceso a los avisos de requisiciones/órdenes de compra que expone el
/// resumen compartido del backend.
abstract class ComprasNotificacionesRepository {
  Future<Result<ResumenCompras>> getResumen();

  Future<Result<void>> marcarLeida(int id);
}
