import 'package:intl/intl.dart';

/// "ENTRA A LAS 1:00 PM" a partir del "HH:MM" que manda el backend en
/// `AsistenciaDaily.entraALas`, con el mismo formato de hora que el resto de
/// las tablas de asistencia ([jm]).
String entraALasLabel(String hhmm, DateFormat jm) {
  final partes = hhmm.split(':');
  final hora = DateTime(2000, 1, 1, int.parse(partes[0]), int.parse(partes[1]));
  return 'ENTRA A LAS ${jm.format(hora)}';
}
