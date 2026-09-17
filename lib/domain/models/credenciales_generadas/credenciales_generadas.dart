import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credenciales_generadas.freezed.dart';
part 'credenciales_generadas.g.dart';

/// Usuario y contraseña que el backend genera automáticamente al dar de
/// alta un Empleado/Practicante sin usuario vinculado. Solo viene poblado
/// en la respuesta del POST que crea el registro; en cualquier consulta
/// posterior siempre es null.
@freezed
abstract class CredencialesGeneradas with _$CredencialesGeneradas {
  const factory CredencialesGeneradas({
    required String username,
    required String password,
  }) = _CredencialesGeneradas;

  factory CredencialesGeneradas.fromJson(Map<String, Object?> json) => _$CredencialesGeneradasFromJson(json);
}
