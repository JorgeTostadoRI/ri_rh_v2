import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';

abstract final class Routes {
  static const ingreso = '/ingreso';
  static const incidencias = '/incidencias';
  static const newIncidencia = ':categoriaId/new';
  static String newIncidenciaOfCategory(IncidenciaCategory category) => '$incidencias/${category.id}/new';
}