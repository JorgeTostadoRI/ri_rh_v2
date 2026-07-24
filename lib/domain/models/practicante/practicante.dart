import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/practicante/practicante_api_model.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';

part 'practicante.freezed.dart';

@freezed
abstract class Practicante with _$Practicante {
  const factory Practicante({
    // Populated by backend
    @Default(0)
    int id,
    StatusPracticante? status,

    required TypePracticante type,
    required String name,
    required double salary,
    required Universidad university,
    required Puesto puesto,
    required DateTime fechaNacimiento,
    required String clabeInterbancaria,
    required String numeroContacto,
    required String contactoEmergencia,
    required String curp,
    required String rfc,
    required String nss,
    required String direccion,
    User? user,

    // Documents
    String? ineUrl,
    String? actaNacimientoUrl,
    String? estadoCuentaUrl,
    String? curpUrl,
    String? rfcUrl,
    String? nssUrl,
    String? domicilioUrl,
    String? cartaPresentacionUrl,
    String? cvUrl,

    DateTime? registeredAt,
    DateTime? terminatedAt,
  }) = _Practicante;

  factory Practicante.fromApiModel({
    required PracticanteApiModel model,
    required List<Puesto> puestos,
    required List<Universidad> universidades,
  }) => Practicante(
      id: model.id,
      status: model.status,
      type: model.type,
      name: model.name,
      salary: model.salary,
      university: universidades.firstWhere((uni) => uni.id == model.universityRef),
      puesto: puestos.firstWhere((puesto) => puesto.id == model.puestoRef),
      fechaNacimiento: model.fechaNacimiento,
      clabeInterbancaria: model.clabeInterbancaria,
      numeroContacto: model.numeroContacto,
      contactoEmergencia: model.contactoEmergencia,
      curp: model.curp,
      rfc: model.rfc,
      nss: model.nss,
      direccion: model.direccion,
      ineUrl: model.ineUrl,
      actaNacimientoUrl: model.actaNacimientoUrl,
      estadoCuentaUrl: model.estadoCuentaUrl,
      curpUrl: model.curpUrl,
      rfcUrl: model.rfcUrl,
      nssUrl: model.nssUrl,
      domicilioUrl: model.domicilioUrl,
      cartaPresentacionUrl: model.cartaPresentacionUrl,
      cvUrl: model.cvUrl,
      registeredAt: model.registeredAt,
      terminatedAt: model.terminatedAt,
  );
}

enum StatusPracticante {
  alta,
  baja
}

enum TypePracticante {
  practicante,
  residente
}
