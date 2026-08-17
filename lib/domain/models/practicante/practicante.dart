import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/practicante/practicante_api_model.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/model_exception.dart';

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
  }) {
    late final User? user;
    late final User? jefe;
    late final Puesto puesto;
    late final Universidad university;

    try {
      final userIndex = model.userRef == 0 ? -1 : users.indexWhere((user) => user.id == model.userRef);
      if (userIndex != -1) {
        user = users[userIndex];
      } else {
        user = null;
      }

      final jefeIndex = model.userRef == 0 ? -1 : users.indexWhere((user) => user.id == model.jefeRef);
      if (jefeIndex != -1) {
        jefe = users[jefeIndex];
      } else {
        jefe = null;
      }
      puesto = puestos.firstWhere((puesto) => puesto.id == model.puestoRef);
      university = universidades.firstWhere((uni) => uni.id == model.universityRef);
    } on StateError {
      throw ModelException(
        'Failed to find element for Practicante',
        context: {
          'model': 'Practicante',
          'id': model.id,
          'userRef': model.userRef,
          'puestoRef': model.puestoRef,
          'universityRef': model.universityRef,
        },
      );
    }

    return Practicante(
      base: BaseEmpleado(
        id: model.id,
        user: user,
        jefe: jefe,
        nombre: model.name,
        salario: model.salary,
        puesto: puesto,
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
        hasSignature: model.hasSignature,
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
      university: university,
    );
  }
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
