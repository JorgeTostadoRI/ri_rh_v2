import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'departamento.freezed.dart';
part 'departamento.g.dart';

@freezed
abstract class Departamento with _$Departamento {
    const factory Departamento({
        required int id,
        required String nombre,
        required String descripcion,
        required double presupuesto,
        required Divisa divisa,
        Lider? lider,
    }) = _Departamento;

  factory Departamento.fromJson(Map<String, Object?> json) => _$DepartamentoFromJson(json);
}

enum Divisa {
    MEX,
    MXN,
    USD
}

@freezed
abstract class Lider with _$Lider {
    const factory Lider({
        required int id,
        required String nombre,
        required String telefono,
        required String correo,
    }) = _Lider;

  factory Lider.fromJson(Map<String, Object?> json) => _$LiderFromJson(json);
}