import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';

/// Lo que se le dice a la persona cuando su checada quedó registrada, según
/// el tipo. Se usa igual en el checador (huella) y en el Ingreso manual
/// (celular y remotos).
String mensajeRegistro(AsistenciaType? type) => switch (type) {
  AsistenciaType.entry => '¡Entrada registrada exitosamente!',
  AsistenciaType.exitToLunch => '¡Salida a comer registrada!',
  AsistenciaType.entryFromLunch => '¡Regreso de comer registrado!',
  AsistenciaType.exit => '¡Salida registrada exitosamente!',
  null => 'Se registró tu asistencia',
};
