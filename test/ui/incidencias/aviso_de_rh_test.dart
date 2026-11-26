import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_form.dart';

void main() {
  test('sin firma: ventana de firma no registrada', () {
    final aviso = avisoDeRH(const ApiException('', 400, errorCode: 'no_firma'));

    expect(aviso?.titulo, 'Firma no registrada');
    expect(aviso?.mensaje, contains('Recursos Humanos'));
  });

  test('sin jefe directo: la misma ventana de siempre', () {
    final aviso = avisoDeRH(const ApiException('', 400, errorCode: 'no_jefe'));

    expect(aviso?.titulo, 'Jefe directo no asignado');
  });

  test('otros errores no abren esta ventana', () {
    expect(avisoDeRH(const ApiException('', 400, errorCode: 'late_entry')), isNull);
    expect(avisoDeRH(const ApiException('', 500)), isNull);
    expect(avisoDeRH(Exception('x')), isNull);
  });
}
