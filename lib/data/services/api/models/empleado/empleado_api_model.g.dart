// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empleado_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmpleadoApiModel _$EmpleadoApiModelFromJson(
  Map<String, dynamic> json,
) => _EmpleadoApiModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userRef: (json['usuario'] as num?)?.toInt() ?? 0,
  jefeRef: (json['jefe'] as num?)?.toInt() ?? 0,
  nombre: json['nombre_completo'] as String,
  fechaNacimiento: DateTime.parse(json['fecha_nacimiento'] as String),
  escolaridad: $enumDecode(_$EscolaridadEnumMap, json['escolaridad']),
  clabeInterbancaria: json['clabe_interbancaria'] as String,
  numeroContacto: json['numero_contacto'] as String,
  contactoEmergencia: json['contacto_emergencia'] as String,
  rfc: json['rfc'] as String,
  curp: json['curp'] as String,
  nss: json['numero_seguro_social'] as String,
  direccion: json['direccion_completa'] as String,
  montoRetencionInfonavit: _doubleFromJson(json['monto_retencion_infonavit']),
  puestoRef: (json['puesto'] as num).toInt(),
  estatus: $enumDecode(_$EmpleadoEstatusEnumMap, json['estatus']),
  salario: _doubleFromJson(json['salario_diario']),
  antiguedad: (json['antiguedad'] as num?)?.toInt(),
  diasVacaciones: (json['dias_vacaciones'] as num?)?.toInt(),
  registeredAt: json['fecha_alta'] == null
      ? null
      : DateTime.parse(json['fecha_alta'] as String),
  terminatedAt: json['fecha_baja'] == null
      ? null
      : DateTime.parse(json['fecha_baja'] as String),
  ineUrl: json['identificacion_oficial'] as String?,
  actaNacimientoUrl: json['acta_nacimiento'] as String?,
  constanciaEstudioUrl: json['constancia_estudio'] as String?,
  estadoCuentaUrl: json['estado_cuenta'] as String?,
  constanciaSituacionFiscalUrl: json['constancia_situacion_fiscal'] as String?,
  curpUrl: json['pdf_curp'] as String?,
  nssUrl: json['comprobante_nss'] as String?,
  altaImssUrl: json['alta_imss'] as String?,
  comprobanteDomicilioUrl: json['comprobante_domicilio'] as String?,
  avisoInfonavitUrl: json['aviso_retencion_infonavit'] as String?,
  cartaRecomendacion1Url: json['carta_recomendacion_1'] as String?,
  cartaRecomendacion2Url: json['carta_recomendacion_2'] as String?,
  cartaRecomendacion3Url: json['carta_recomendacion_3'] as String?,
  cartaNoAntecedentesPenalesUrl:
      json['carta_no_antecedentes_penales'] as String?,
  contratoLaboralUrl: json['contrato_laboral'] as String?,
  cvUrl: json['curriculum_vitae'] as String?,
  cartaOfertaUrl: json['carta_oferta'] as String?,
  examenMedicoUrl: json['examen_medico'] as String?,
  cartaRenunciaUrl: json['carta_renuncia'] as String?,
  finiquitoUrl: json['finiquito_firmado'] as String?,
  bajaImssUrl: json['baja_imss'] as String?,
  comprobanteFiniquitoUrl:
      json['comprobante_transferencia_finiquito'] as String?,
);

Map<String, dynamic> _$EmpleadoApiModelToJson(_EmpleadoApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usuario': instance.userRef,
      'jefe': instance.jefeRef,
      'nombre_completo': instance.nombre,
      'fecha_nacimiento': instance.fechaNacimiento.toIso8601String(),
      'escolaridad': _$EscolaridadEnumMap[instance.escolaridad]!,
      'clabe_interbancaria': instance.clabeInterbancaria,
      'numero_contacto': instance.numeroContacto,
      'contacto_emergencia': instance.contactoEmergencia,
      'rfc': instance.rfc,
      'curp': instance.curp,
      'numero_seguro_social': instance.nss,
      'direccion_completa': instance.direccion,
      'monto_retencion_infonavit': instance.montoRetencionInfonavit,
      'puesto': instance.puestoRef,
      'estatus': _$EmpleadoEstatusEnumMap[instance.estatus]!,
      'salario_diario': instance.salario,
      'antiguedad': instance.antiguedad,
      'dias_vacaciones': instance.diasVacaciones,
      'fecha_alta': instance.registeredAt?.toIso8601String(),
      'fecha_baja': instance.terminatedAt?.toIso8601String(),
      'identificacion_oficial': instance.ineUrl,
      'acta_nacimiento': instance.actaNacimientoUrl,
      'constancia_estudio': instance.constanciaEstudioUrl,
      'estado_cuenta': instance.estadoCuentaUrl,
      'constancia_situacion_fiscal': instance.constanciaSituacionFiscalUrl,
      'pdf_curp': instance.curpUrl,
      'comprobante_nss': instance.nssUrl,
      'alta_imss': instance.altaImssUrl,
      'comprobante_domicilio': instance.comprobanteDomicilioUrl,
      'aviso_retencion_infonavit': instance.avisoInfonavitUrl,
      'carta_recomendacion_1': instance.cartaRecomendacion1Url,
      'carta_recomendacion_2': instance.cartaRecomendacion2Url,
      'carta_recomendacion_3': instance.cartaRecomendacion3Url,
      'carta_no_antecedentes_penales': instance.cartaNoAntecedentesPenalesUrl,
      'contrato_laboral': instance.contratoLaboralUrl,
      'curriculum_vitae': instance.cvUrl,
      'carta_oferta': instance.cartaOfertaUrl,
      'examen_medico': instance.examenMedicoUrl,
      'carta_renuncia': instance.cartaRenunciaUrl,
      'finiquito_firmado': instance.finiquitoUrl,
      'baja_imss': instance.bajaImssUrl,
      'comprobante_transferencia_finiquito': instance.comprobanteFiniquitoUrl,
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
  EmpleadoEstatus.procesoFiniquito: 'proceso_finiquito',
  EmpleadoEstatus.finiquitado: 'finiquitado',
};
