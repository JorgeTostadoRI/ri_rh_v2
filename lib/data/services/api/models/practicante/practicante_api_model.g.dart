// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practicante_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PracticanteApiModel _$PracticanteApiModelFromJson(Map<String, dynamic> json) =>
    _PracticanteApiModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      status: $enumDecodeNullable(_$StatusPracticanteEnumMap, json['estado']),
      type: $enumDecode(_$TypePracticanteEnumMap, json['tipo']),
      name: json['nombre_completo'] as String,
      salary: _doubleFromJson(json['salario_diario']),
      universityRef: (json['universidad'] as num).toInt(),
      puestoRef: (json['puesto'] as num).toInt(),
      fechaNacimiento: DateTime.parse(json['fecha_nacimiento'] as String),
      clabeInterbancaria: json['clabe_interbancaria'] as String,
      numeroContacto: json['numero_contacto'] as String,
      contactoEmergencia: json['contacto_emergencia'] as String,
      curp: json['curp'] as String,
      rfc: json['rfc'] as String,
      nss: json['numero_seguro_social'] as String,
      direccion: json['direccion_completa'] as String,
      userRef: (json['usuario'] as num?)?.toInt() ?? 0,
      jefeRef: (json['jefe'] as num?)?.toInt() ?? 0,
      hasSignature: json['has_signature'] as bool,
      ineUrl: json['identificacion_oficial'] as String?,
      actaNacimientoUrl: json['acta_nacimiento'] as String?,
      estadoCuentaUrl: json['estado_cuenta'] as String?,
      curpUrl: json['pdf_curp'] as String?,
      rfcUrl: json['pdf_rfc'] as String?,
      nssUrl: json['pdf_numero_seguro_social'] as String?,
      domicilioUrl: json['comprobante_domicilio'] as String?,
      cartaPresentacionUrl: json['carta_presentacion'] as String?,
      cvUrl: json['curriculum_vitae'] as String?,
      registeredAt: json['fecha_alta'] == null
          ? null
          : DateTime.parse(json['fecha_alta'] as String),
      terminatedAt: json['fecha_baja'] == null
          ? null
          : DateTime.parse(json['fecha_baja'] as String),
    );

Map<String, dynamic> _$PracticanteApiModelToJson(
  _PracticanteApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'estado': _$StatusPracticanteEnumMap[instance.status],
  'tipo': _$TypePracticanteEnumMap[instance.type]!,
  'nombre_completo': instance.name,
  'salario_diario': instance.salary,
  'universidad': instance.universityRef,
  'puesto': instance.puestoRef,
  'fecha_nacimiento': instance.fechaNacimiento.toIso8601String(),
  'clabe_interbancaria': instance.clabeInterbancaria,
  'numero_contacto': instance.numeroContacto,
  'contacto_emergencia': instance.contactoEmergencia,
  'curp': instance.curp,
  'rfc': instance.rfc,
  'numero_seguro_social': instance.nss,
  'direccion_completa': instance.direccion,
  'usuario': instance.userRef,
  'jefe': instance.jefeRef,
  'has_signature': instance.hasSignature,
  'identificacion_oficial': instance.ineUrl,
  'acta_nacimiento': instance.actaNacimientoUrl,
  'estado_cuenta': instance.estadoCuentaUrl,
  'pdf_curp': instance.curpUrl,
  'pdf_rfc': instance.rfcUrl,
  'pdf_numero_seguro_social': instance.nssUrl,
  'comprobante_domicilio': instance.domicilioUrl,
  'carta_presentacion': instance.cartaPresentacionUrl,
  'curriculum_vitae': instance.cvUrl,
  'fecha_alta': instance.registeredAt?.toIso8601String(),
  'fecha_baja': instance.terminatedAt?.toIso8601String(),
};

const _$StatusPracticanteEnumMap = {
  StatusPracticante.alta: 'alta',
  StatusPracticante.baja: 'baja',
};

const _$TypePracticanteEnumMap = {
  TypePracticante.practicante: 'practicante',
  TypePracticante.residente: 'residente',
};
