import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';

part 'empleado_api_model.freezed.dart';
part 'empleado_api_model.g.dart';

@freezed
abstract class EmpleadoApiModel with _$EmpleadoApiModel {
  const factory EmpleadoApiModel({
    @Default(0)
    int id,
    @JsonKey(name: 'usuario', defaultValue: 0)
    required int userRef,
    @JsonKey(name: 'jefe', defaultValue: 0)
    required int jefeRef,
    // Datos generales
    @JsonKey(name: 'nombre_completo')
    required String nombre,
    required DateTime fechaNacimiento,
    required Escolaridad escolaridad,
    required String clabeInterbancaria,
    required String numeroContacto,
    required String contactoEmergencia,
    required String rfc,
    required String curp,
    @JsonKey(name: 'numero_seguro_social')
    required String nss,
    @JsonKey(name: 'direccion_completa')
    required String direccion,
    @JsonKey(fromJson: _doubleFromJson)
    required double montoRetencionInfonavit,
    // Datos de empleo
    @JsonKey(name: 'puesto')
    required int puestoRef,
    required EmpleadoEstatus estatus,
    @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson)
    required double salario,
    int? antiguedad,
    int? diasVacaciones,
    @JsonKey(name: 'fecha_alta')
    DateTime? registeredAt,
    @JsonKey(name: 'fecha_baja')
    DateTime? terminatedAt,
    // Documentos
    @JsonKey(name: 'identificacion_oficial')
    String? ineUrl,
    @JsonKey(name: 'acta_nacimiento')
    String? actaNacimientoUrl,
    @JsonKey(name: 'constancia_estudio')
    String? constanciaEstudioUrl,
    @JsonKey(name: 'estado_cuenta')
    String? estadoCuentaUrl,
    @JsonKey(name: 'constancia_situacion_fiscal')
    String? constanciaSituacionFiscalUrl,
    @JsonKey(name: 'pdf_curp')
    String? curpUrl,
    @JsonKey(name: 'comprobante_nss')
    String? nssUrl,
    @JsonKey(name: 'alta_imss')
    String? altaImssUrl,
    @JsonKey(name: 'comprobante_domicilio')
    String? comprobanteDomicilioUrl,
    @JsonKey(name: 'aviso_retencion_infonavit')
    String? avisoInfonavitUrl,
    @JsonKey(name: 'carta_recomendacion_1')
    String? cartaRecomendacion1Url,
    @JsonKey(name: 'carta_recomendacion_2')
    String? cartaRecomendacion2Url,
    @JsonKey(name: 'carta_recomendacion_3')
    String? cartaRecomendacion3Url,
    @JsonKey(name: 'carta_no_antecedentes_penales')
    String? cartaNoAntecedentesPenalesUrl,
    @JsonKey(name: 'contrato_laboral')
    String? contratoLaboralUrl,
    @JsonKey(name: 'curriculum_vitae')
    String? cvUrl,
    @JsonKey(name: 'carta_oferta')
    String? cartaOfertaUrl,
    @JsonKey(name: 'examen_medico')
    String? examenMedicoUrl,
    // Documentos para finiquitar
    @JsonKey(name: 'carta_renuncia')
    String? cartaRenunciaUrl,
    @JsonKey(name: 'finiquito_firmado')
    String? finiquitoUrl,
    @JsonKey(name: 'baja_imss')
    String? bajaImssUrl,
    @JsonKey(name: 'comprobante_transferencia_finiquito')
    String? comprobanteFiniquitoUrl,
  }) = _EmpleadoApiModel;

  factory EmpleadoApiModel.fromJson(Map<String, Object?> json) => _$EmpleadoApiModelFromJson(json);
}

double _doubleFromJson(dynamic value) {
  if (value is num) return value.toDouble(); // Handles normal numbers
  return double.parse(value.toString()); // Handles "12.34" strings
}
