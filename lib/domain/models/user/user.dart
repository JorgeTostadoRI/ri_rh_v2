import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
    const factory User({
        required int id,
        required String username,
        required String nombre,
        required String telefono,
        required String correo,
        required String rol,
        required Departamento departamento,
        required List<Departamento> departamentosPermitidos,
        required bool liderPermitido,
        int? empleadoId,
    }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}