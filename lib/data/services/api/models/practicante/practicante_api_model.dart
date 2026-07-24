import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';

part 'practicante_api_model.freezed.dart';
part 'practicante_api_model.g.dart';

@freezed
abstract class PracticanteApiModel with _$PracticanteApiModel {
  const factory PracticanteApiModel({
    // Populated by backend
    @Default(0)
    int id,
    @JsonKey(name: 'estado')
    StatusPracticante? status,

    @JsonKey(name: 'tipo')
    required TypePracticante type,
    @JsonKey(name: 'nombre_completo')
    required String name,
    @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson)
    required double salary,
    @JsonKey(name: 'universidad')
    required int universityRef,
    @JsonKey(name: 'puesto')
    required int puestoRef,
    required DateTime fechaNacimiento,
    required String clabeInterbancaria,
    required String numeroContacto,
    required String contactoEmergencia,
    required String curp,
    required String rfc,
    @JsonKey(name: 'numero_seguro_social')
    required String nss,
    @JsonKey(name: 'direccion_completa')
    required String direccion,
    @JsonKey(defaultValue: 0, name: 'usuario')
    required int userRef,

    // Documents
    @JsonKey(name: 'identificacion_oficial')
    String? ineUrl,
    @JsonKey(name: 'acta_nacimiento')
    String? actaNacimientoUrl,
    @JsonKey(name: 'estado_cuenta')
    String? estadoCuentaUrl,
    @JsonKey(name: 'pdf_curp')
    String? curpUrl,
    @JsonKey(name: 'pdf_rfc')
    String? rfcUrl,
    @JsonKey(name: 'pdf_numero_seguro_social')
    String? nssUrl,
    @JsonKey(name: 'comprobante_domicilio')
    String? domicilioUrl,
    @JsonKey(name: 'carta_presentacion')
    String? cartaPresentacionUrl,
    @JsonKey(name: 'curriculum_vitae')
    String? cvUrl,

    @JsonKey(name: 'fechaAlta')
    DateTime? registeredAt,
    @JsonKey(name: 'fechaBaja')
    DateTime? terminatedAt,
  }) = _PracticanteApiModel;

  factory PracticanteApiModel.fromJson(Map<String, Object?> json) => _$PracticanteApiModelFromJson(json);
}

double _doubleFromJson(dynamic value) {
  if (value is num) return value.toDouble(); // Handles normal numbers
  return double.parse(value.toString()); // Handles "12.34" strings
}