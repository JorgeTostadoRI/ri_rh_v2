import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_rh_v2/domain/models/incidencias/checador_discrepancy.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_approve_dialog.dart';

Map<String, Object?> _base() => {
      'checked': true,
      'is_suspicious': true,
      'overlaps_normal_schedule': false,
      'has_checador_evidence': false,
      'message': 'Checó 2 h 40 min de las 3 h solicitadas; se pagarán 2.5 h.',
    };

void main() {
  test('lee las horas a pagar de Horas extra', () {
    final d = ChecadorDiscrepancy.fromJson({
      ..._base(),
      'horas_solicitadas': 3.0,
      'horas_a_pagar': 2.5,
      'sin_salida': false,
    });
    expect(d.horasSolicitadas, 3.0);
    expect(d.horasAPagar, 2.5);
    expect(d.sinSalida, isFalse);
    expect(d.detalleDePago, isFalse);
  });

  test('RH recibe detalle_de_pago', () {
    final d = ChecadorDiscrepancy.fromJson({..._base(), 'detalle_de_pago': true, 'horas_a_pagar': 2.5});
    expect(d.detalleDePago, isTrue);
  });

  test('acepta enteros en el JSON', () {
    final d = ChecadorDiscrepancy.fromJson({..._base(), 'horas_solicitadas': 3, 'horas_a_pagar': 0});
    expect(d.horasSolicitadas, 3.0);
    expect(d.horasAPagar, 0.0);
  });

  test('Hora por hora o servidor anterior: sin los campos nuevos', () {
    final d = ChecadorDiscrepancy.fromJson({..._base(), 'horas_solicitadas': null, 'horas_a_pagar': null});
    expect(d.horasAPagar, isNull);
    expect(d.sinSalida, isFalse);

    final anterior = ChecadorDiscrepancy.fromJson(_base());
    expect(anterior.horasSolicitadas, isNull);
  });

  test('formato de horas', () {
    expect(formatoHoras(2.5), '2.5 h');
    expect(formatoHoras(3.0), '3 h');
    expect(formatoHoras(0.0), '0 h');
  });

  test('"Si apruebas" va en negritas', () {
    final spans = mensajeAlertaSpans('No marcó su salida; Si apruebas la incidencia se pagarán las horas solicitadas (3 h).');
    expect(spans.map((s) => s.text).toList(), [
      'No marcó su salida; ',
      'Si apruebas',
      ' la incidencia se pagarán las horas solicitadas (3 h).',
    ]);
    expect(spans[0].style, isNull);
    expect(spans[1].style?.fontWeight, FontWeight.w700);
    expect(spans[2].style, isNull);
  });

  test('sin "Si apruebas" el mensaje va tal cual', () {
    final spans = mensajeAlertaSpans('Checó 2 h 40 min de las 3 h solicitadas; se pagarán 2.5 h.');
    expect(spans.length, 1);
    expect(spans.single.text, 'Checó 2 h 40 min de las 3 h solicitadas; se pagarán 2.5 h.');
  });
}
