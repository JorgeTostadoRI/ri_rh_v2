import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/mensaje_registro.dart';

void main() {
  test('cada tipo de checada tiene su propio mensaje', () {
    expect(mensajeRegistro(AsistenciaType.entry), '¡Entrada registrada exitosamente!');
    expect(mensajeRegistro(AsistenciaType.exitToLunch), '¡Salida a comer registrada!');
    expect(mensajeRegistro(AsistenciaType.entryFromLunch), '¡Regreso de comer registrado!');
    expect(mensajeRegistro(AsistenciaType.exit), '¡Salida registrada exitosamente!');
  });

  test('si no llega el tipo, un mensaje general', () {
    expect(mensajeRegistro(null), 'Se registró tu asistencia');
  });
}
