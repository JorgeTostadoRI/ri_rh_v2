import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato.dart';

part 'candidato_detalle.freezed.dart';
part 'candidato_detalle.g.dart';

/// Beneficiario que el propio candidato declaró en su formulario público.
@freezed
abstract class CandidatoBeneficiario with _$CandidatoBeneficiario {
  const factory CandidatoBeneficiario({
    int? id,
    @JsonKey(name: 'nombre_completo') required String nombreCompleto,
    required String parentesco,
    @Default('') String direccion,
    @Default(0) int porcentaje,
  }) = _CandidatoBeneficiario;

  factory CandidatoBeneficiario.fromJson(Map<String, Object?> json) => _$CandidatoBeneficiarioFromJson(json);
}

/// Equipo entregado al candidato -- lo captura RH al solicitar el contrato,
/// solo si `entregaEquipo` es true. Alimenta el Anexo II.
@freezed
abstract class CandidatoEquipo with _$CandidatoEquipo {
  const factory CandidatoEquipo({
    int? id,
    required String descripcion,
    @Default('') String marca,
    @Default('') String modelo,
    @JsonKey(name: 'numero_serie') @Default('') String numeroSerie,
    @Default('') String accesorios,
    @JsonKey(name: 'condiciones_entrega') @Default('') String condicionesEntrega,
  }) = _CandidatoEquipo;

  factory CandidatoEquipo.fromJson(Map<String, Object?> json) => _$CandidatoEquipoFromJson(json);
}

/// El turno (Horario) que ya tiene asignado la SolicitudVacante -- se usa
/// como valor sugerido de jornada/horario en "Detalles de contratación"
/// mientras RH no haya guardado nada todavía. Null si la solicitud no
/// tiene turno o es de horario personalizado (no hay un solo horario que
/// sugerir con confianza).
@freezed
abstract class TurnoSugerido with _$TurnoSugerido {
  const factory TurnoSugerido({
    @JsonKey(name: 'hora_entrada') String? horaEntrada,
    @JsonKey(name: 'hora_comida_inicio') String? horaComidaInicio,
    @JsonKey(name: 'hora_comida_fin') String? horaComidaFin,
    @JsonKey(name: 'hora_salida') String? horaSalida,
    @JsonKey(name: 'dias_laborados') @Default('') String diasLaborados,
    @JsonKey(name: 'dia_descanso') @Default('') String diaDescanso,
  }) = _TurnoSugerido;

  factory TurnoSugerido.fromJson(Map<String, Object?> json) => _$TurnoSugeridoFromJson(json);
}

/// Vista completa de un Candidato para RH (Fase F): sus datos/documentos ya
/// llenados en el formulario público (solo lectura aquí) más los "Detalles
/// de contratación" que RH llena antes de "Solicitar contrato" (editables).
@freezed
abstract class CandidatoDetalle with _$CandidatoDetalle {
  const factory CandidatoDetalle({
    required int id,
    required String nombre,
    required String correo,
    @Default(CandidatoEstado.iniciado) CandidatoEstado estado,
    @JsonKey(name: 'fecha_expiracion') DateTime? fechaExpiracion,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'puesto_nombre') String? puestoNombre,
    @JsonKey(name: 'puesto_responsabilidades') @Default('') String puestoResponsabilidades,
    @Default(<String, String?>{}) Map<String, String?> documentos,
    @JsonKey(name: 'verificado_por_ia') @Default(false) bool verificadoPorIa,
    @JsonKey(name: 'motivo_rechazo_rh') @Default('') String motivoRechazoRh,
    @JsonKey(name: 'turno_sugerido') TurnoSugerido? turnoSugerido,

    // --- Llenado por el candidato (solo lectura aquí) ---
    @JsonKey(name: 'apellido_paterno') @Default('') String apellidoPaterno,
    @JsonKey(name: 'apellido_materno') @Default('') String apellidoMaterno,
    @Default('') String nombres,
    @JsonKey(name: 'fecha_nacimiento') DateTime? fechaNacimiento,
    @Default('') String curp,
    @Default('') String rfc,
    @JsonKey(name: 'numero_seguro_social') @Default('') String numeroSeguroSocial,
    @JsonKey(name: 'clabe_interbancaria') @Default('') String clabeInterbancaria,
    @Default('') String escolaridad,
    @Default('') String telefono,
    @JsonKey(name: 'contacto_emergencia_nombre') @Default('') String contactoEmergenciaNombre,
    @JsonKey(name: 'contacto_emergencia_telefono') @Default('') String contactoEmergenciaTelefono,
    @JsonKey(name: 'direccion_calle') @Default('') String direccionCalle,
    @JsonKey(name: 'direccion_numero') @Default('') String direccionNumero,
    @JsonKey(name: 'direccion_fraccionamiento') @Default('') String direccionFraccionamiento,
    @JsonKey(name: 'direccion_codigo_postal') @Default('') String direccionCodigoPostal,
    @JsonKey(name: 'direccion_municipio') @Default('') String direccionMunicipio,
    @JsonKey(name: 'direccion_estado') @Default('') String direccionEstado,
    @JsonKey(name: 'direccion_pais') @Default('') String direccionPais,
    @Default('') String nacionalidad,
    @Default('') String sexo,
    @JsonKey(name: 'estado_civil') @Default('') String estadoCivil,
    @Default(<CandidatoBeneficiario>[]) List<CandidatoBeneficiario> beneficiarios,

    // --- "Detalles de contratación" (RH, editable vía PATCH) ---
    @JsonKey(name: 'salario_diario', fromJson: _doubleOrNullFromJson) double? salarioDiario,
    @JsonKey(name: 'fecha_ingreso') DateTime? fechaIngreso,
    @JsonKey(name: 'tipo_contrato') @Default('') String tipoContrato,
    @JsonKey(name: 'periodo_tipo') @Default('') String periodoTipo,
    @JsonKey(name: 'tipo_jornada') @Default('') String tipoJornada,
    @JsonKey(name: 'rotacion_detalle') @Default('') String rotacionDetalle,
    @JsonKey(name: 'dias_laborados') @Default('') String diasLaborados,
    @JsonKey(name: 'dia_descanso') @Default('') String diaDescanso,
    @JsonKey(name: 'hora_entrada') String? horaEntrada,
    @JsonKey(name: 'hora_comida_inicio') String? horaComidaInicio,
    @JsonKey(name: 'hora_comida_fin') String? horaComidaFin,
    @JsonKey(name: 'hora_salida') String? horaSalida,
    @JsonKey(name: 'forma_pago') @Default('') String formaPago,
    @JsonKey(name: 'modalidad_pago') @Default('') String modalidadPago,
    @JsonKey(name: 'bono_asistencia') @Default('') String bonoAsistencia,
    @JsonKey(name: 'bono_puntualidad') @Default('') String bonoPuntualidad,
    @JsonKey(name: 'vales_despensa_monedero') bool? valesDespensaMonedero,
    @JsonKey(name: 'percibe_comisiones') bool? percibeComisiones,
    @JsonKey(name: 'comisiones_detalle') @Default('') String comisionesDetalle,
    @Default('N/A') String herramientas,
    @JsonKey(name: 'entrega_equipo') @Default(false) bool entregaEquipo,
    @JsonKey(name: 'equipos_entregados') @Default(<CandidatoEquipo>[]) List<CandidatoEquipo> equiposEntregados,
    @JsonKey(name: 'contrato_solicitado_en') DateTime? contratoSolicitadoEn,
  }) = _CandidatoDetalle;

  factory CandidatoDetalle.fromJson(Map<String, Object?> json) => _$CandidatoDetalleFromJson(json);
}

double? _doubleOrNullFromJson(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}

/// (value, label) de los choices del backend (Candidato.*_CHOICES en
/// ri_rh/models/vacantes.py) -- se usan para armar los dropdowns de
/// "Detalles de contratación".
abstract final class CandidatoChoices {
  static const sexo = [('masculino', 'Masculino'), ('femenino', 'Femenino')];
  static const estadoCivil = [
    ('soltero', 'Soltero(a)'),
    ('casado', 'Casado(a)'),
    ('union_libre', 'Unión libre'),
    ('divorciado', 'Divorciado(a)'),
    ('viudo', 'Viudo(a)'),
    ('separado', 'Separado(a)'),
  ];
  static const tipoContrato = [('indeterminado', 'Indeterminado'), ('determinado', 'Determinado')];
  static const periodoTipo = [
    ('prueba', 'Periodo a prueba (hasta 30 días)'),
    ('capacitacion', 'Capacitación (hasta 90 días)'),
  ];
  static const tipoJornada = [('rotativo', 'Rotativo'), ('fijo', 'Fijo')];
  static const formaPago = [('semanal', 'Semanal'), ('quincenal', 'Quincenal'), ('mensual', 'Mensual')];
  static const modalidadPago = [
    ('transferencia', 'Transferencia'),
    ('efectivo', 'Efectivo'),
    ('cheque', 'Cheque'),
  ];
}
