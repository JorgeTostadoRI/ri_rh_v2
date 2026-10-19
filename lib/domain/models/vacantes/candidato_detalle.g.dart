// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidato_detalle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CandidatoBeneficiario _$CandidatoBeneficiarioFromJson(
  Map<String, dynamic> json,
) => _CandidatoBeneficiario(
  id: (json['id'] as num?)?.toInt(),
  nombreCompleto: json['nombre_completo'] as String,
  parentesco: json['parentesco'] as String,
  direccion: json['direccion'] as String? ?? '',
  porcentaje: (json['porcentaje'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CandidatoBeneficiarioToJson(
  _CandidatoBeneficiario instance,
) => <String, dynamic>{
  'id': instance.id,
  'nombre_completo': instance.nombreCompleto,
  'parentesco': instance.parentesco,
  'direccion': instance.direccion,
  'porcentaje': instance.porcentaje,
};

_CandidatoEquipo _$CandidatoEquipoFromJson(Map<String, dynamic> json) =>
    _CandidatoEquipo(
      id: (json['id'] as num?)?.toInt(),
      descripcion: json['descripcion'] as String,
      marca: json['marca'] as String? ?? '',
      modelo: json['modelo'] as String? ?? '',
      numeroSerie: json['numero_serie'] as String? ?? '',
      accesorios: json['accesorios'] as String? ?? '',
      condicionesEntrega: json['condiciones_entrega'] as String? ?? '',
    );

Map<String, dynamic> _$CandidatoEquipoToJson(_CandidatoEquipo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descripcion': instance.descripcion,
      'marca': instance.marca,
      'modelo': instance.modelo,
      'numero_serie': instance.numeroSerie,
      'accesorios': instance.accesorios,
      'condiciones_entrega': instance.condicionesEntrega,
    };

_TurnoSugerido _$TurnoSugeridoFromJson(Map<String, dynamic> json) =>
    _TurnoSugerido(
      horaEntrada: json['hora_entrada'] as String?,
      horaComidaInicio: json['hora_comida_inicio'] as String?,
      horaComidaFin: json['hora_comida_fin'] as String?,
      horaSalida: json['hora_salida'] as String?,
      diasLaborados: json['dias_laborados'] as String? ?? '',
      diaDescanso: json['dia_descanso'] as String? ?? '',
    );

Map<String, dynamic> _$TurnoSugeridoToJson(_TurnoSugerido instance) =>
    <String, dynamic>{
      'hora_entrada': instance.horaEntrada,
      'hora_comida_inicio': instance.horaComidaInicio,
      'hora_comida_fin': instance.horaComidaFin,
      'hora_salida': instance.horaSalida,
      'dias_laborados': instance.diasLaborados,
      'dia_descanso': instance.diaDescanso,
    };

_CandidatoDetalle _$CandidatoDetalleFromJson(
  Map<String, dynamic> json,
) => _CandidatoDetalle(
  id: (json['id'] as num).toInt(),
  nombre: json['nombre'] as String,
  correo: json['correo'] as String,
  estado:
      $enumDecodeNullable(_$CandidatoEstadoEnumMap, json['estado']) ??
      CandidatoEstado.iniciado,
  fechaExpiracion: json['fecha_expiracion'] == null
      ? null
      : DateTime.parse(json['fecha_expiracion'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  puestoNombre: json['puesto_nombre'] as String?,
  puestoResponsabilidades: json['puesto_responsabilidades'] as String? ?? '',
  documentos:
      (json['documentos'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ) ??
      const <String, String?>{},
  verificadoPorIa: json['verificado_por_ia'] as bool? ?? false,
  motivoRechazoRh: json['motivo_rechazo_rh'] as String? ?? '',
  turnoSugerido: json['turno_sugerido'] == null
      ? null
      : TurnoSugerido.fromJson(json['turno_sugerido'] as Map<String, dynamic>),
  apellidoPaterno: json['apellido_paterno'] as String? ?? '',
  apellidoMaterno: json['apellido_materno'] as String? ?? '',
  nombres: json['nombres'] as String? ?? '',
  fechaNacimiento: json['fecha_nacimiento'] == null
      ? null
      : DateTime.parse(json['fecha_nacimiento'] as String),
  curp: json['curp'] as String? ?? '',
  rfc: json['rfc'] as String? ?? '',
  numeroSeguroSocial: json['numero_seguro_social'] as String? ?? '',
  clabeInterbancaria: json['clabe_interbancaria'] as String? ?? '',
  escolaridad: json['escolaridad'] as String? ?? '',
  telefono: json['telefono'] as String? ?? '',
  contactoEmergenciaNombre: json['contacto_emergencia_nombre'] as String? ?? '',
  contactoEmergenciaTelefono:
      json['contacto_emergencia_telefono'] as String? ?? '',
  direccionCalle: json['direccion_calle'] as String? ?? '',
  direccionNumero: json['direccion_numero'] as String? ?? '',
  direccionFraccionamiento: json['direccion_fraccionamiento'] as String? ?? '',
  direccionCodigoPostal: json['direccion_codigo_postal'] as String? ?? '',
  direccionMunicipio: json['direccion_municipio'] as String? ?? '',
  direccionEstado: json['direccion_estado'] as String? ?? '',
  direccionPais: json['direccion_pais'] as String? ?? '',
  nacionalidad: json['nacionalidad'] as String? ?? '',
  sexo: json['sexo'] as String? ?? '',
  estadoCivil: json['estado_civil'] as String? ?? '',
  beneficiarios:
      (json['beneficiarios'] as List<dynamic>?)
          ?.map(
            (e) => CandidatoBeneficiario.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <CandidatoBeneficiario>[],
  salarioDiario: _doubleOrNullFromJson(json['salario_diario']),
  fechaIngreso: json['fecha_ingreso'] == null
      ? null
      : DateTime.parse(json['fecha_ingreso'] as String),
  tipoContrato: json['tipo_contrato'] as String? ?? '',
  periodoTipo: json['periodo_tipo'] as String? ?? '',
  tipoJornada: json['tipo_jornada'] as String? ?? '',
  rotacionDetalle: json['rotacion_detalle'] as String? ?? '',
  diasLaborados: json['dias_laborados'] as String? ?? '',
  diaDescanso: json['dia_descanso'] as String? ?? '',
  horaEntrada: json['hora_entrada'] as String?,
  horaComidaInicio: json['hora_comida_inicio'] as String?,
  horaComidaFin: json['hora_comida_fin'] as String?,
  horaSalida: json['hora_salida'] as String?,
  formaPago: json['forma_pago'] as String? ?? '',
  modalidadPago: json['modalidad_pago'] as String? ?? '',
  bonoAsistencia: json['bono_asistencia'] as String? ?? '',
  bonoPuntualidad: json['bono_puntualidad'] as String? ?? '',
  valesDespensaMonedero: json['vales_despensa_monedero'] as bool?,
  percibeComisiones: json['percibe_comisiones'] as bool?,
  comisionesDetalle: json['comisiones_detalle'] as String? ?? '',
  herramientas: json['herramientas'] as String? ?? 'N/A',
  entregaEquipo: json['entrega_equipo'] as bool? ?? false,
  montoRetencionInfonavit: _doubleOrNullFromJson(
    json['monto_retencion_infonavit'],
  ),
  equiposEntregados:
      (json['equipos_entregados'] as List<dynamic>?)
          ?.map((e) => CandidatoEquipo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CandidatoEquipo>[],
  contratoSolicitadoEn: json['contrato_solicitado_en'] == null
      ? null
      : DateTime.parse(json['contrato_solicitado_en'] as String),
  empleado: (json['empleado'] as num?)?.toInt(),
);

Map<String, dynamic> _$CandidatoDetalleToJson(
  _CandidatoDetalle instance,
) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'correo': instance.correo,
  'estado': _$CandidatoEstadoEnumMap[instance.estado]!,
  'fecha_expiracion': instance.fechaExpiracion?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'puesto_nombre': instance.puestoNombre,
  'puesto_responsabilidades': instance.puestoResponsabilidades,
  'documentos': instance.documentos,
  'verificado_por_ia': instance.verificadoPorIa,
  'motivo_rechazo_rh': instance.motivoRechazoRh,
  'turno_sugerido': instance.turnoSugerido,
  'apellido_paterno': instance.apellidoPaterno,
  'apellido_materno': instance.apellidoMaterno,
  'nombres': instance.nombres,
  'fecha_nacimiento': instance.fechaNacimiento?.toIso8601String(),
  'curp': instance.curp,
  'rfc': instance.rfc,
  'numero_seguro_social': instance.numeroSeguroSocial,
  'clabe_interbancaria': instance.clabeInterbancaria,
  'escolaridad': instance.escolaridad,
  'telefono': instance.telefono,
  'contacto_emergencia_nombre': instance.contactoEmergenciaNombre,
  'contacto_emergencia_telefono': instance.contactoEmergenciaTelefono,
  'direccion_calle': instance.direccionCalle,
  'direccion_numero': instance.direccionNumero,
  'direccion_fraccionamiento': instance.direccionFraccionamiento,
  'direccion_codigo_postal': instance.direccionCodigoPostal,
  'direccion_municipio': instance.direccionMunicipio,
  'direccion_estado': instance.direccionEstado,
  'direccion_pais': instance.direccionPais,
  'nacionalidad': instance.nacionalidad,
  'sexo': instance.sexo,
  'estado_civil': instance.estadoCivil,
  'beneficiarios': instance.beneficiarios,
  'salario_diario': instance.salarioDiario,
  'fecha_ingreso': instance.fechaIngreso?.toIso8601String(),
  'tipo_contrato': instance.tipoContrato,
  'periodo_tipo': instance.periodoTipo,
  'tipo_jornada': instance.tipoJornada,
  'rotacion_detalle': instance.rotacionDetalle,
  'dias_laborados': instance.diasLaborados,
  'dia_descanso': instance.diaDescanso,
  'hora_entrada': instance.horaEntrada,
  'hora_comida_inicio': instance.horaComidaInicio,
  'hora_comida_fin': instance.horaComidaFin,
  'hora_salida': instance.horaSalida,
  'forma_pago': instance.formaPago,
  'modalidad_pago': instance.modalidadPago,
  'bono_asistencia': instance.bonoAsistencia,
  'bono_puntualidad': instance.bonoPuntualidad,
  'vales_despensa_monedero': instance.valesDespensaMonedero,
  'percibe_comisiones': instance.percibeComisiones,
  'comisiones_detalle': instance.comisionesDetalle,
  'herramientas': instance.herramientas,
  'entrega_equipo': instance.entregaEquipo,
  'monto_retencion_infonavit': instance.montoRetencionInfonavit,
  'equipos_entregados': instance.equiposEntregados,
  'contrato_solicitado_en': instance.contratoSolicitadoEn?.toIso8601String(),
  'empleado': instance.empleado,
};

const _$CandidatoEstadoEnumMap = {
  CandidatoEstado.iniciado: 'iniciado',
  CandidatoEstado.completado: 'completado',
  CandidatoEstado.expirado: 'expirado',
  CandidatoEstado.cancelado: 'cancelado',
  CandidatoEstado.contratado: 'contratado',
};
