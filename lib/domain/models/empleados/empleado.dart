import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/empleado/empleado_api_model.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
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
    required BaseEmpleado base,
    required Escolaridad escolaridad,
    required double montoRetencionInfonavit,
    required EmpleadoEstatus estatus,
    int? antiguedad,
    int? diasVacaciones,
    required AltaEmpleo alta,
    required BajaEmpleo baja,
  }) = _Empleado;

  factory Empleado.fromApiModel({
    required EmpleadoApiModel model,
    required List<User> users,
    required List<Puesto> puestos,
  }) => Empleado(
    base: BaseEmpleado(
      id: model.id,
      user: model.userRef != 0 ? users.firstWhere((user) => user.id == model.userRef) : null,
      puesto: puestos.firstWhere((puesto) => puesto.id == model.puestoRef),
      nombre: model.nombre,
      nacidoEn: model.fechaNacimiento,
      clabeInterbancaria: model.clabeInterbancaria,
      numeroContacto: model.numeroContacto,
      contactoEmergencia: model.contactoEmergencia,
      rfc: model.rfc,
      curp: model.curp,
      nss: model.nss,
      direccion: model.direccion,
      salario: model.salario,
      registradoEn: model.registeredAt,
      finalizadoEn: model.terminatedAt,
      files: BaseEmpleadoFiles(
        ineUrl: model.ineUrl,
        actaNacimientoUrl: model.actaNacimientoUrl,
        estadoCuentaUrl: model.estadoCuentaUrl,
        curpUrl: model.curpUrl,
        nssUrl: model.nssUrl,
        domicilioUrl: model.comprobanteDomicilioUrl,
        cvUrl: model.cvUrl,
      ),
    ),
    escolaridad: model.escolaridad,
    montoRetencionInfonavit: model.montoRetencionInfonavit,
    estatus: model.estatus,
    antiguedad: model.antiguedad,
    diasVacaciones: model.diasVacaciones,
    alta: AltaEmpleo(
      constanciaEstudioUrl: model.constanciaEstudioUrl,
      constanciaSituacionFiscalUrl: model.constanciaSituacionFiscalUrl,
      altaImssUrl: model.altaImssUrl,
      avisoInfonavitUrl: model.avisoInfonavitUrl,
      cartaRecomendacion1Url: model.cartaRecomendacion1Url,
      cartaRecomendacion2Url: model.cartaRecomendacion2Url,
      cartaRecomendacion3Url: model.cartaRecomendacion3Url,
      cartaNoAntecedentesPenalesUrl: model.cartaNoAntecedentesPenalesUrl,
      contratoLaboralUrl: model.contratoLaboralUrl,
      cartaOfertaUrl: model.cartaOfertaUrl,
      examenMedicoUrl: model.examenMedicoUrl,
    ),
    baja: BajaEmpleo(
      cartaRenunciaUrl: model.cartaRenunciaUrl,
      finiquitoUrl: model.finiquitoUrl,
      bajaImssUrl: model.bajaImssUrl,
      comprobanteFiniquitoUrl: model.comprobanteFiniquitoUrl,
    ),
  );
}

@freezed
abstract class AltaEmpleo with _$AltaEmpleo {
  const factory AltaEmpleo({
    String? constanciaEstudioUrl,
    String? constanciaSituacionFiscalUrl,
    String? altaImssUrl,
    String? avisoInfonavitUrl,
    String? cartaRecomendacion1Url,
    String? cartaRecomendacion2Url,
    String? cartaRecomendacion3Url,
    String? cartaNoAntecedentesPenalesUrl,
    String? contratoLaboralUrl,
    String? cartaOfertaUrl,
    String? examenMedicoUrl,
  }) = _AltaEmpleo;
}

@freezed
abstract class BajaEmpleo with _$BajaEmpleo {
  const factory BajaEmpleo({
    String? cartaRenunciaUrl,
    String? finiquitoUrl,
    String? bajaImssUrl,
    String? comprobanteFiniquitoUrl,
  }) = _BajaEmpleo;
}