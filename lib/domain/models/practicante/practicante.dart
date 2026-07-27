import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/practicante/practicante_api_model.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';

part 'practicante.freezed.dart';

@freezed
abstract class Practicante with _$Practicante {
  const factory Practicante({
    required BaseEmpleado base,
    required TypePracticante type,
    required Universidad university,
    required AltaPracticante alta,
    StatusPracticante? status,
    User? user,
  }) = _Practicante;

  factory Practicante.fromApiModel({
    required PracticanteApiModel model,
    required List<User> users,
    required List<Puesto> puestos,
    required List<Universidad> universidades,
  }) => Practicante(
      base: BaseEmpleado(
        id: model.id,
        user: model.userRef != 0 ? users.firstWhere((user) => user.id == model.userRef) : null,
        nombre: model.name,
        salario: model.salary,
        puesto: puestos.firstWhere((puesto) => puesto.id == model.puestoRef),
        nacidoEn: model.fechaNacimiento,
        clabeInterbancaria: model.clabeInterbancaria,
        numeroContacto: model.numeroContacto,
        contactoEmergencia: model.contactoEmergencia,
        curp: model.curp,
        rfc: model.rfc,
        nss: model.nss,
        direccion: model.direccion,
        registradoEn: model.registeredAt,
        finalizadoEn: model.terminatedAt,
        files: BaseEmpleadoFiles(
          ineUrl: model.ineUrl,
          actaNacimientoUrl: model.actaNacimientoUrl,
          estadoCuentaUrl: model.estadoCuentaUrl,
          curpUrl: model.curpUrl,
          nssUrl: model.nssUrl,
          domicilioUrl: model.domicilioUrl,
          cvUrl: model.cvUrl,
        ),
      ),
      alta: AltaPracticante(
        rfcUrl: model.rfcUrl,
        cartaPresentacionUrl: model.cartaPresentacionUrl,
      ),
      status: model.status,
      type: model.type,
      university: universidades.firstWhere((uni) => uni.id == model.universityRef),
  );
}

@freezed
abstract class AltaPracticante with _$AltaPracticante {
  const factory AltaPracticante({
    String? rfcUrl,
    String? cartaPresentacionUrl,
  }) = _AltaPracticante;
}

enum StatusPracticante {
  alta,
  baja
}

enum TypePracticante {
  practicante,
  residente
}
