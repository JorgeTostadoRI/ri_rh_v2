import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';

typedef PuestoCreateParams = ({
  String nombre,
  String tipos,
  String? rol,
  String? responsabilidades,
  PlatformFile? tabuladorSalarial,
  List<int>? departamentoIds,
  List<PreguntaPuesto>? preguntas,
});

typedef PuestoEditParams = ({
  int id,
  String nombre,
  String tipos,
  String? rol,
  String? responsabilidades,
  PlatformFile? tabuladorSalarial,
  List<int>? departamentoIds,
  List<PreguntaPuesto>? preguntas,
});
