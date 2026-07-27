import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';

part 'base_empleado.freezed.dart';

@freezed
abstract class BaseEmpleado with _$BaseEmpleado {
  const factory BaseEmpleado({
    @Default(0)
    int id,
    User? user,

    // Datos generales
    required String nombre,
    required DateTime nacidoEn,
    required String clabeInterbancaria,
    required String numeroContacto,
    required String contactoEmergencia,
    required String rfc,
    required String curp,
    required String nss,
    required String direccion,
    // Datos de empleo
    required Puesto puesto,
    required double salario,
    DateTime? registradoEn,
    DateTime? finalizadoEn,
    required BaseEmpleadoFiles files,
  }) = _BaseEmpleado;
}

@freezed
abstract class BaseEmpleadoFiles with _$BaseEmpleadoFiles {
  const factory BaseEmpleadoFiles({
    String? ineUrl,
    String? actaNacimientoUrl,
    String? estadoCuentaUrl,
    String? curpUrl,
    String? nssUrl,
    String? domicilioUrl,
    String? cvUrl,
  }) = _BaseEmpleadoFiles;
}