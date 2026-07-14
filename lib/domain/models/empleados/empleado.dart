import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'empleado.freezed.dart';
part 'empleado.g.dart';

enum Escolaridad {
  primaria,
  secundaria,
  preparatoria,
  universidad,
  postgrado;
}

enum EmpleadoEstatus {
  activo,
  procesoFiniquito,
  finiquitado;
}

@freezed
abstract class Empleado with _$Empleado {
  const factory Empleado({
    int? id,
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
    required String numeroSeguroSocial,
    required String direccionCompleta,
    required double montoRetencionInfonavit,
    // Datos de empleo
    required int puesto,
    required EmpleadoEstatus estatus,
    required double salarioDiario,
    int? antiguedad,
    int? diasVacaciones,
    DateTime? fechaAlta,
    DateTime? fechaBaja,
    // Documentos
    String? identificacionOficial,
    String? actaNacimiento,
    String? constanciaEstudio,
    String? estadoCuenta,
    String? constanciaSituacionFiscal,
    String? pdfCurp,
    String? comprobanteNss,
    String? altaImss,
    String? comprobanteDomicilio,
    String? avisoRetencionInfonavit,
    String? cartaRecomendacion1,
    String? cartaRecomendacion2,
    String? cartaRecomendacion3,
    String? cartaNoAntecedentesPenales,
    String? contratoLaboral,
    String? curriculumVitae,
    String? cartaOferta,
    String? examenMedico,
    // Documentos para finiquitar
    String? cartaRenuncia,
    String? finiquitoFirmado,
    String? bajaImss,
    String? comprobanteTransferenciaFiniquito
  }) = _Empleado;

  factory Empleado.fromJson(Map<String, Object?> json) => _$EmpleadoFromJson(json);
}
