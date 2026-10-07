import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'puesto.freezed.dart';
part 'puesto.g.dart';

enum TipoPuesto {
  administrativo,
  directo,
  indirecto;
}

enum CategoriaPregunta {
  entrevista,
  puesto;
}

@freezed
abstract class PreguntaPuesto with _$PreguntaPuesto {
  const factory PreguntaPuesto({
    int? id,
    required CategoriaPregunta categoria,
    required String texto,
    @Default(0) int orden,
  }) = _PreguntaPuesto;

  factory PreguntaPuesto.fromJson(Map<String, Object?> json) => _$PreguntaPuestoFromJson(json);
}

@freezed
abstract class Puesto with _$Puesto {
  const factory Puesto({
    int? id,
    required String nombre,
    @JsonKey(name: 'tipos')
    required TipoPuesto tipo,
    String? rol,
    @Default('') String responsabilidades,
    /// URL del archivo de tabulador salarial ya subido (null si aún no se
    /// ha adjuntado ninguno). Para subirlo, ver [EmpleadosRepository.uploadTabuladorSalarial].
    @JsonKey(name: 'tabulador_salarial')
    String? tabuladorSalarialUrl,
    @Default(<int>[]) List<int> departamentos,
    @Default(<PreguntaPuesto>[]) List<PreguntaPuesto> preguntas,
  }) = _Puesto;

  factory Puesto.fromJson(Map<String, Object?> json) => _$PuestoFromJson(json);
}
