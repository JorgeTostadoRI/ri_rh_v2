// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empleado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Empleado _$EmpleadoFromJson(Map<String, dynamic> json) => _Empleado(
  id: (json['id'] as num?)?.toInt(),
  usuario: (json['usuario'] as num).toInt(),
  nombre: json['nombre_completo'] as String,
  fechaNacimiento: DateTime.parse(json['fecha_nacimiento'] as String),
  escolaridad: $enumDecode(_$EscolaridadEnumMap, json['escolaridad']),
  clabeInterbancaria: json['clabe_interbancaria'] as String,
  numeroContacto: json['numero_contacto'] as String,
  contactoEmergencia: json['contacto_emergencia'] as String,
  rfc: json['rfc'] as String,
  curp: json['curp'] as String,
  numeroSeguroSocial: json['numero_seguro_social'] as String,
  direccionCompleta: json['direccion_completa'] as String,
  montoRetencionInfonavit: (json['monto_retencion_infonavit'] as num)
      .toDouble(),
  puesto: (json['puesto'] as num).toInt(),
  estatus: $enumDecode(_$EmpleadoEstatusEnumMap, json['estatus']),
  salarioDiario: (json['salario_diario'] as num).toDouble(),
  antiguedad: (json['antiguedad'] as num?)?.toInt(),
  diasVacaciones: (json['dias_vacaciones'] as num?)?.toInt(),
  fechaAlta: json['fecha_alta'] == null
      ? null
      : DateTime.parse(json['fecha_alta'] as String),
  fechaBaja: json['fecha_baja'] == null
      ? null
      : DateTime.parse(json['fecha_baja'] as String),
  identificacionOficial: json['identificacion_oficial'] as String?,
  actaNacimiento: json['acta_nacimiento'] as String?,
  constanciaEstudio: json['constancia_estudio'] as String?,
  estadoCuenta: json['estado_cuenta'] as String?,
  constanciaSituacionFiscal: json['constancia_situacion_fiscal'] as String?,
  pdfCurp: json['pdf_curp'] as String?,
  comprobanteNss: json['comprobante_nss'] as String?,
  altaImss: json['alta_imss'] as String?,
  comprobanteDomicilio: json['comprobante_domicilio'] as String?,
  avisoRetencionInfonavit: json['aviso_retencion_infonavit'] as String?,
  cartaRecomendacion1: json['carta_recomendacion1'] as String?,
  cartaRecomendacion2: json['carta_recomendacion2'] as String?,
  cartaRecomendacion3: json['carta_recomendacion3'] as String?,
  cartaNoAntecedentesPenales: json['carta_no_antecedentes_penales'] as String?,
  contratoLaboral: json['contrato_laboral'] as String?,
  curriculumVitae: json['curriculum_vitae'] as String?,
  cartaOferta: json['carta_oferta'] as String?,
  examenMedico: json['examen_medico'] as String?,
  cartaRenuncia: json['carta_renuncia'] as String?,
  finiquitoFirmado: json['finiquito_firmado'] as String?,
  bajaImss: json['baja_imss'] as String?,
  comprobanteTransferenciaFiniquito:
      json['comprobante_transferencia_finiquito'] as String?,
);

Map<String, dynamic> _$EmpleadoToJson(_Empleado instance) => <String, dynamic>{
  'id': instance.id,
  'usuario': instance.usuario,
  'nombre_completo': instance.nombre,
  'fecha_nacimiento': instance.fechaNacimiento.toIso8601String(),
  'escolaridad': _$EscolaridadEnumMap[instance.escolaridad]!,
  'clabe_interbancaria': instance.clabeInterbancaria,
  'numero_contacto': instance.numeroContacto,
  'contacto_emergencia': instance.contactoEmergencia,
  'rfc': instance.rfc,
  'curp': instance.curp,
  'numero_seguro_social': instance.numeroSeguroSocial,
  'direccion_completa': instance.direccionCompleta,
  'monto_retencion_infonavit': instance.montoRetencionInfonavit,
  'puesto': instance.puesto,
  'estatus': _$EmpleadoEstatusEnumMap[instance.estatus]!,
  'salario_diario': instance.salarioDiario,
  'antiguedad': instance.antiguedad,
  'dias_vacaciones': instance.diasVacaciones,
  'fecha_alta': instance.fechaAlta?.toIso8601String(),
  'fecha_baja': instance.fechaBaja?.toIso8601String(),
  'identificacion_oficial': instance.identificacionOficial,
  'acta_nacimiento': instance.actaNacimiento,
  'constancia_estudio': instance.constanciaEstudio,
  'estado_cuenta': instance.estadoCuenta,
  'constancia_situacion_fiscal': instance.constanciaSituacionFiscal,
  'pdf_curp': instance.pdfCurp,
  'comprobante_nss': instance.comprobanteNss,
  'alta_imss': instance.altaImss,
  'comprobante_domicilio': instance.comprobanteDomicilio,
  'aviso_retencion_infonavit': instance.avisoRetencionInfonavit,
  'carta_recomendacion1': instance.cartaRecomendacion1,
  'carta_recomendacion2': instance.cartaRecomendacion2,
  'carta_recomendacion3': instance.cartaRecomendacion3,
  'carta_no_antecedentes_penales': instance.cartaNoAntecedentesPenales,
  'contrato_laboral': instance.contratoLaboral,
  'curriculum_vitae': instance.curriculumVitae,
  'carta_oferta': instance.cartaOferta,
  'examen_medico': instance.examenMedico,
  'carta_renuncia': instance.cartaRenuncia,
  'finiquito_firmado': instance.finiquitoFirmado,
  'baja_imss': instance.bajaImss,
  'comprobante_transferencia_finiquito':
      instance.comprobanteTransferenciaFiniquito,
};

const _$EscolaridadEnumMap = {
  Escolaridad.primaria: 'primaria',
  Escolaridad.secundaria: 'secundaria',
  Escolaridad.preparatoria: 'preparatoria',
  Escolaridad.universidad: 'universidad',
  Escolaridad.postgrado: 'postgrado',
};

const _$EmpleadoEstatusEnumMap = {
  EmpleadoEstatus.activo: 'activo',
  EmpleadoEstatus.procesoFiniquito: 'procesoFiniquito',
  EmpleadoEstatus.finiquitado: 'finiquitado',
};
