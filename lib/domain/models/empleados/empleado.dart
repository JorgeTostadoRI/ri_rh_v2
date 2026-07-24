import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/empleado/empleado_api_model.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';

part 'empleado.freezed.dart';

enum Escolaridad {
  primaria,
  secundaria,
  preparatoria,
  universidad,
  postgrado;
}

enum EmpleadoEstatus {
  activo,
  @JsonValue('proceso_finiquito')
  procesoFiniquito,
  finiquitado;
}

@freezed
abstract class Empleado with _$Empleado {
  const factory Empleado({
    @Default(0)
    int id,
    User? user,
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
    required String nss,
    required String direccion,
    required double montoRetencionInfonavit,
    // Datos de empleo
    required Puesto puesto,
    required EmpleadoEstatus estatus,
    required double salario,
    int? antiguedad,
    int? diasVacaciones,
    DateTime? registeredAt,
    DateTime? terminatedAt,
    // Documentos
    String? ineUrl,
    String? actaNacimientoUrl,
    String? constanciaEstudioUrl,
    String? estadoCuentaUrl,
    String? constanciaSituacionFiscalUrl,
    String? curpUrl,
    String? nssUrl,
    String? altaImssUrl,
    String? comprobanteDomicilioUrl,
    String? avisoInfonavitUrl,
    String? cartaRecomendacion1Url,
    String? cartaRecomendacion2Url,
    String? cartaRecomendacion3Url,
    String? cartaNoAntecedentesPenalesUrl,
    String? contratoLaboralUrl,
    String? cvUrl,
    String? cartaOfertaUrl,
    String? examenMedicoUrl,
    // Documentos para finiquitar
    String? cartaRenunciaUrl,
    String? finiquitoUrl,
    String? bajaImssUrl,
    String? comprobanteFiniquitoUrl,
  }) = _Empleado;

  factory Empleado.fromApiModel({
    required EmpleadoApiModel model,
    required List<User> users,
    required List<Puesto> puestos,
  }) => Empleado(
    id: model.id,
    user: model.userRef != 0 ? users.firstWhere((user) => user.id == model.userRef) : null,
    puesto: puestos.firstWhere((puesto) => puesto.id == model.puestoRef),
    nombre: model.nombre,
    fechaNacimiento: model.fechaNacimiento,
    escolaridad: model.escolaridad,
    clabeInterbancaria: model.clabeInterbancaria,
    numeroContacto: model.numeroContacto,
    contactoEmergencia: model.contactoEmergencia,
    rfc: model.rfc,
    curp: model.curp,
    nss: model.nss,
    direccion: model.direccion,
    montoRetencionInfonavit: model.montoRetencionInfonavit,
    estatus: model.estatus,
    salario: model.salario,
    antiguedad: model.antiguedad,
    diasVacaciones: model.diasVacaciones,
    registeredAt: model.registeredAt,
    terminatedAt: model.terminatedAt,
    ineUrl: model.ineUrl,
    actaNacimientoUrl: model.actaNacimientoUrl,
    constanciaEstudioUrl: model.constanciaEstudioUrl,
    estadoCuentaUrl: model.estadoCuentaUrl,
    constanciaSituacionFiscalUrl: model.constanciaSituacionFiscalUrl,
    curpUrl: model.curpUrl,
    nssUrl: model.nssUrl,
    altaImssUrl: model.altaImssUrl,
    comprobanteDomicilioUrl: model.comprobanteDomicilioUrl,
    avisoInfonavitUrl: model.avisoInfonavitUrl,
    cartaRecomendacion1Url: model.cartaRecomendacion1Url,
    cartaRecomendacion2Url: model.cartaRecomendacion2Url,
    cartaRecomendacion3Url: model.cartaRecomendacion3Url,
    cartaNoAntecedentesPenalesUrl: model.cartaNoAntecedentesPenalesUrl,
    contratoLaboralUrl: model.contratoLaboralUrl,
    cvUrl: model.cvUrl,
    cartaOfertaUrl: model.cartaOfertaUrl,
    examenMedicoUrl: model.examenMedicoUrl,
    cartaRenunciaUrl: model.cartaRenunciaUrl,
    finiquitoUrl: model.finiquitoUrl,
    bajaImssUrl: model.bajaImssUrl,
    comprobanteFiniquitoUrl: model.comprobanteFiniquitoUrl,
  );
}
