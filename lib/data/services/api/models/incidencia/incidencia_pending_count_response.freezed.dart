// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incidencia_pending_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidenciaPendingCountResponse {

 int get total; int get permisos; int get horasExtra; int get vacaciones; int get incapacidades; int get requerimientosJudiciales;
/// Create a copy of IncidenciaPendingCountResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidenciaPendingCountResponseCopyWith<IncidenciaPendingCountResponse> get copyWith => _$IncidenciaPendingCountResponseCopyWithImpl<IncidenciaPendingCountResponse>(this as IncidenciaPendingCountResponse, _$identity);

  /// Serializes this IncidenciaPendingCountResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidenciaPendingCountResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.permisos, permisos) || other.permisos == permisos)&&(identical(other.horasExtra, horasExtra) || other.horasExtra == horasExtra)&&(identical(other.vacaciones, vacaciones) || other.vacaciones == vacaciones)&&(identical(other.incapacidades, incapacidades) || other.incapacidades == incapacidades)&&(identical(other.requerimientosJudiciales, requerimientosJudiciales) || other.requerimientosJudiciales == requerimientosJudiciales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,permisos,horasExtra,vacaciones,incapacidades,requerimientosJudiciales);

@override
String toString() {
  return 'IncidenciaPendingCountResponse(total: $total, permisos: $permisos, horasExtra: $horasExtra, vacaciones: $vacaciones, incapacidades: $incapacidades, requerimientosJudiciales: $requerimientosJudiciales)';
}


}

/// @nodoc
abstract mixin class $IncidenciaPendingCountResponseCopyWith<$Res>  {
  factory $IncidenciaPendingCountResponseCopyWith(IncidenciaPendingCountResponse value, $Res Function(IncidenciaPendingCountResponse) _then) = _$IncidenciaPendingCountResponseCopyWithImpl;
@useResult
$Res call({
 int total, int permisos, int horasExtra, int vacaciones, int incapacidades, int requerimientosJudiciales
});




}
/// @nodoc
class _$IncidenciaPendingCountResponseCopyWithImpl<$Res>
    implements $IncidenciaPendingCountResponseCopyWith<$Res> {
  _$IncidenciaPendingCountResponseCopyWithImpl(this._self, this._then);

  final IncidenciaPendingCountResponse _self;
  final $Res Function(IncidenciaPendingCountResponse) _then;

/// Create a copy of IncidenciaPendingCountResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? permisos = null,Object? horasExtra = null,Object? vacaciones = null,Object? incapacidades = null,Object? requerimientosJudiciales = null,}) {
  return _then(IncidenciaPendingCountResponse(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,permisos: null == permisos ? _self.permisos : permisos // ignore: cast_nullable_to_non_nullable
as int,horasExtra: null == horasExtra ? _self.horasExtra : horasExtra // ignore: cast_nullable_to_non_nullable
as int,vacaciones: null == vacaciones ? _self.vacaciones : vacaciones // ignore: cast_nullable_to_non_nullable
as int,incapacidades: null == incapacidades ? _self.incapacidades : incapacidades // ignore: cast_nullable_to_non_nullable
as int,requerimientosJudiciales: null == requerimientosJudiciales ? _self.requerimientosJudiciales : requerimientosJudiciales // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidenciaPendingCountResponse].
extension IncidenciaPendingCountResponsePatterns on IncidenciaPendingCountResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidenciaPendingCountResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidenciaPendingCountResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidenciaPendingCountResponse value)  $default,){
final _that = this;
switch (_that) {
case _IncidenciaPendingCountResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidenciaPendingCountResponse value)?  $default,){
final _that = this;
switch (_that) {
case _IncidenciaPendingCountResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int permisos,  int horasExtra,  int vacaciones,  int incapacidades,  int requerimientosJudiciales)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidenciaPendingCountResponse() when $default != null:
return $default(_that.total,_that.permisos,_that.horasExtra,_that.vacaciones,_that.incapacidades,_that.requerimientosJudiciales);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int permisos,  int horasExtra,  int vacaciones,  int incapacidades,  int requerimientosJudiciales)  $default,) {final _that = this;
switch (_that) {
case _IncidenciaPendingCountResponse():
return $default(_that.total,_that.permisos,_that.horasExtra,_that.vacaciones,_that.incapacidades,_that.requerimientosJudiciales);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int permisos,  int horasExtra,  int vacaciones,  int incapacidades,  int requerimientosJudiciales)?  $default,) {final _that = this;
switch (_that) {
case _IncidenciaPendingCountResponse() when $default != null:
return $default(_that.total,_that.permisos,_that.horasExtra,_that.vacaciones,_that.incapacidades,_that.requerimientosJudiciales);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidenciaPendingCountResponse implements IncidenciaPendingCountResponse {
  const _IncidenciaPendingCountResponse({required this.total, required this.permisos, required this.horasExtra, required this.vacaciones, required this.incapacidades, required this.requerimientosJudiciales});
  factory _IncidenciaPendingCountResponse.fromJson(Map<String, dynamic> json) => _$IncidenciaPendingCountResponseFromJson(json);

@override final  int total;
@override final  int permisos;
@override final  int horasExtra;
@override final  int vacaciones;
@override final  int incapacidades;
@override final  int requerimientosJudiciales;

/// Create a copy of IncidenciaPendingCountResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidenciaPendingCountResponseCopyWith<_IncidenciaPendingCountResponse> get copyWith => __$IncidenciaPendingCountResponseCopyWithImpl<_IncidenciaPendingCountResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidenciaPendingCountResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidenciaPendingCountResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.permisos, permisos) || other.permisos == permisos)&&(identical(other.horasExtra, horasExtra) || other.horasExtra == horasExtra)&&(identical(other.vacaciones, vacaciones) || other.vacaciones == vacaciones)&&(identical(other.incapacidades, incapacidades) || other.incapacidades == incapacidades)&&(identical(other.requerimientosJudiciales, requerimientosJudiciales) || other.requerimientosJudiciales == requerimientosJudiciales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,permisos,horasExtra,vacaciones,incapacidades,requerimientosJudiciales);

@override
String toString() {
  return 'IncidenciaPendingCountResponse(total: $total, permisos: $permisos, horasExtra: $horasExtra, vacaciones: $vacaciones, incapacidades: $incapacidades, requerimientosJudiciales: $requerimientosJudiciales)';
}


}

/// @nodoc
abstract mixin class _$IncidenciaPendingCountResponseCopyWith<$Res> implements $IncidenciaPendingCountResponseCopyWith<$Res> {
  factory _$IncidenciaPendingCountResponseCopyWith(_IncidenciaPendingCountResponse value, $Res Function(_IncidenciaPendingCountResponse) _then) = __$IncidenciaPendingCountResponseCopyWithImpl;
@override @useResult
$Res call({
 int total, int permisos, int horasExtra, int vacaciones, int incapacidades, int requerimientosJudiciales
});




}
/// @nodoc
class __$IncidenciaPendingCountResponseCopyWithImpl<$Res>
    implements _$IncidenciaPendingCountResponseCopyWith<$Res> {
  __$IncidenciaPendingCountResponseCopyWithImpl(this._self, this._then);

  final _IncidenciaPendingCountResponse _self;
  final $Res Function(_IncidenciaPendingCountResponse) _then;

/// Create a copy of IncidenciaPendingCountResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? permisos = null,Object? horasExtra = null,Object? vacaciones = null,Object? incapacidades = null,Object? requerimientosJudiciales = null,}) {
  return _then(_IncidenciaPendingCountResponse(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,permisos: null == permisos ? _self.permisos : permisos // ignore: cast_nullable_to_non_nullable
as int,horasExtra: null == horasExtra ? _self.horasExtra : horasExtra // ignore: cast_nullable_to_non_nullable
as int,vacaciones: null == vacaciones ? _self.vacaciones : vacaciones // ignore: cast_nullable_to_non_nullable
as int,incapacidades: null == incapacidades ? _self.incapacidades : incapacidades // ignore: cast_nullable_to_non_nullable
as int,requerimientosJudiciales: null == requerimientosJudiciales ? _self.requerimientosJudiciales : requerimientosJudiciales // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
