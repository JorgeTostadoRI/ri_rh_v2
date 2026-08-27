import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/user/user_api_model.dart';
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
        String? rol,
        Departamento? departamento,
        required List<Departamento> departamentosPermitidos,
        required bool liderPermitido,
        @Default(false)
        bool isRemote,
    }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.fromApiModel(UserApiModel model) {
    return User(
      id: model.id,
      username: model.username,
      nombre: model.nombre,
      telefono: model.telefono,
      correo: model.correo,
      rol: model.rol,
      // TODO: map all DepartamentoApiModel to Departamento
      departamento: Departamento(
        id: model.departamento.id,
        nombre: model.departamento.nombre,
        descripcion: model.departamento.descripcion,
        presupuesto: double.parse(model.departamento.presupuesto),
        divisa: model.departamento.divisa,
      ),
      departamentosPermitidos: model.departamentosPermitidos.map(
        (dep) => Departamento(
          id: dep.id,
          nombre: dep.nombre,
          descripcion: dep.descripcion,
          presupuesto: double.parse(dep.presupuesto),
          divisa: dep.divisa,
        ),
      ).toList(),
      liderPermitido: model.liderPermitido,
      isRemote: model.isRemote,
    );
  }
}