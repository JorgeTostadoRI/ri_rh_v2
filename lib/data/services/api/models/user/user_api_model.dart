import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';

part 'user_api_model.freezed.dart';
part 'user_api_model.g.dart';

@freezed
abstract class UserApiModel with _$UserApiModel {
    const factory UserApiModel({
        required int id,
        required String username,
        required String nombre,
        required String telefono,
        required String correo,
        required String rol,
        required DepartamentoApiModel departamento,
        required List<DepartamentoApiModel> departamentosPermitidos,
        required bool liderPermitido,
        int? empleadoId,
    }) = _UserApiModel;

  factory UserApiModel.fromJson(Map<String, Object?> json) => _$UserApiModelFromJson(json);
}

@freezed
abstract class DepartamentoApiModel with _$DepartamentoApiModel {
    const factory DepartamentoApiModel({
        required int id,
        required String nombre,
        required String descripcion,
        required String presupuesto,
        required Divisa divisa,
        LiderApiModel? lider,
    }) = _DepartamentoApiModel;

  factory DepartamentoApiModel.fromJson(Map<String, Object?> json) => _$DepartamentoApiModelFromJson(json);
}

@freezed
abstract class LiderApiModel with _$LiderApiModel {
    const factory LiderApiModel({
        required int id,
        required String nombre,
        required String telefono,
        required String correo,
    }) = _LiderApiModel;

  factory LiderApiModel.fromJson(Map<String, Object?> json) => _$LiderApiModelFromJson(json);
}
