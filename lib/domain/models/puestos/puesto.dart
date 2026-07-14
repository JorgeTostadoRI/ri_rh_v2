import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'puesto.freezed.dart';
part 'puesto.g.dart';

enum TipoPuesto {
  administrativo,
  directo,
  indirecto;
}

@freezed
abstract class Puesto with _$Puesto {
  const factory Puesto({
    int? id,
    required String nombre,
    @JsonKey(name: 'tipos')
    required TipoPuesto tipo,
  }) = _Puesto;

  factory Puesto.fromJson(Map<String, Object?> json) => _$PuestoFromJson(json);
}
