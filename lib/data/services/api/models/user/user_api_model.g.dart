// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserApiModel _$UserApiModelFromJson(
  Map<String, dynamic> json,
) => _UserApiModel(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  nombre: json['nombre'] as String,
  telefono: json['telefono'] as String,
  correo: json['correo'] as String,
  rol: json['rol'] as String,
  departamento: DepartamentoApiModel.fromJson(
    json['departamento'] as Map<String, dynamic>,
  ),
  departamentosPermitidos: (json['departamentos_permitidos'] as List<dynamic>)
      .map((e) => DepartamentoApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  liderPermitido: json['lider_permitido'] as bool,
  empleadoId: (json['empleado_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserApiModelToJson(_UserApiModel instance) =>
    <String, dynamic>{
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

_DepartamentoApiModel _$DepartamentoApiModelFromJson(
  Map<String, dynamic> json,
) => _DepartamentoApiModel(
  id: (json['id'] as num).toInt(),
  nombre: json['nombre'] as String,
  descripcion: json['descripcion'] as String,
  presupuesto: json['presupuesto'] as String,
  divisa: $enumDecode(_$DivisaEnumMap, json['divisa']),
  lider: json['lider'] == null
      ? null
      : LiderApiModel.fromJson(json['lider'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DepartamentoApiModelToJson(
  _DepartamentoApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'descripcion': instance.descripcion,
  'presupuesto': instance.presupuesto,
  'divisa': _$DivisaEnumMap[instance.divisa]!,
  'lider': instance.lider,
};

const _$DivisaEnumMap = {
  Divisa.MEX: 'MEX',
  Divisa.MXN: 'MXN',
  Divisa.USD: 'USD',
};

_LiderApiModel _$LiderApiModelFromJson(Map<String, dynamic> json) =>
    _LiderApiModel(
      id: (json['id'] as num).toInt(),
      nombre: json['nombre'] as String,
      telefono: json['telefono'] as String,
      correo: json['correo'] as String,
    );

Map<String, dynamic> _$LiderApiModelToJson(_LiderApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'telefono': instance.telefono,
      'correo': instance.correo,
    };
