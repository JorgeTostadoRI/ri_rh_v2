// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  nombre: json['nombre'] as String,
  telefono: json['telefono'] as String,
  correo: json['correo'] as String,
  rol: json['rol'] as String,
  departamento: Departamento.fromJson(
    json['departamento'] as Map<String, dynamic>,
  ),
  departamentosPermitidos: (json['departamentos_permitidos'] as List<dynamic>)
      .map((e) => Departamento.fromJson(e as Map<String, dynamic>))
      .toList(),
  liderPermitido: json['lider_permitido'] as bool,
  empleadoId: (json['empleado_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'nombre': instance.nombre,
  'telefono': instance.telefono,
  'correo': instance.correo,
  'rol': instance.rol,
  'departamento': instance.departamento,
  'departamentos_permitidos': instance.departamentosPermitidos,
  'lider_permitido': instance.liderPermitido,
  'empleado_id': instance.empleadoId,
};
