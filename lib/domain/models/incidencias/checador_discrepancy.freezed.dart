// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checador_discrepancy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecadorDiscrepancy {

 bool get checked;@JsonKey(name: 'is_suspicious') bool get isSuspicious;@JsonKey(name: 'overlaps_normal_schedule') bool get overlapsNormalSchedule;@JsonKey(name: 'has_checador_evidence') bool get hasChecadorEvidence; String get message;/// Solo Horas extra (null en Hora por hora o con un servidor anterior):
/// horas solicitadas y las que se pagan en nómina según el checador.
@JsonKey(name: 'horas_solicitadas') double? get horasSolicitadas;@JsonKey(name: 'horas_a_pagar') double? get horasAPagar;@JsonKey(name: 'sin_salida') bool get sinSalida;/// True solo para RH en Horas extra: el mensaje incluye cuánto se paga.
/// Al jefe directo le llega solo lo que checó.
@JsonKey(name: 'detalle_de_pago') bool get detalleDePago;
/// Create a copy of ChecadorDiscrepancy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecadorDiscrepancyCopyWith<ChecadorDiscrepancy> get copyWith => _$ChecadorDiscrepancyCopyWithImpl<ChecadorDiscrepancy>(this as ChecadorDiscrepancy, _$identity);

  /// Serializes this ChecadorDiscrepancy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecadorDiscrepancy&&(identical(other.checked, checked) || other.checked == checked)&&(identical(other.isSuspicious, isSuspicious) || other.isSuspicious == isSuspicious)&&(identical(other.overlapsNormalSchedule, overlapsNormalSchedule) || other.overlapsNormalSchedule == overlapsNormalSchedule)&&(identical(other.hasChecadorEvidence, hasChecadorEvidence) || other.hasChecadorEvidence == hasChecadorEvidence)&&(identical(other.message, message) || other.message == message)&&(identical(other.horasSolicitadas, horasSolicitadas) || other.horasSolicitadas == horasSolicitadas)&&(identical(other.horasAPagar, horasAPagar) || other.horasAPagar == horasAPagar)&&(identical(other.sinSalida, sinSalida) || other.sinSalida == sinSalida)&&(identical(other.detalleDePago, detalleDePago) || other.detalleDePago == detalleDePago));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checked,isSuspicious,overlapsNormalSchedule,hasChecadorEvidence,message,horasSolicitadas,horasAPagar,sinSalida,detalleDePago);

@override
String toString() {
  return 'ChecadorDiscrepancy(checked: $checked, isSuspicious: $isSuspicious, overlapsNormalSchedule: $overlapsNormalSchedule, hasChecadorEvidence: $hasChecadorEvidence, message: $message, horasSolicitadas: $horasSolicitadas, horasAPagar: $horasAPagar, sinSalida: $sinSalida, detalleDePago: $detalleDePago)';
}


}

/// @nodoc
abstract mixin class $ChecadorDiscrepancyCopyWith<$Res>  {
  factory $ChecadorDiscrepancyCopyWith(ChecadorDiscrepancy value, $Res Function(ChecadorDiscrepancy) _then) = _$ChecadorDiscrepancyCopyWithImpl;
@useResult
$Res call({
 bool checked,@JsonKey(name: 'is_suspicious') bool isSuspicious,@JsonKey(name: 'overlaps_normal_schedule') bool overlapsNormalSchedule,@JsonKey(name: 'has_checador_evidence') bool hasChecadorEvidence, String message,@JsonKey(name: 'horas_solicitadas') double? horasSolicitadas,@JsonKey(name: 'horas_a_pagar') double? horasAPagar,@JsonKey(name: 'sin_salida') bool sinSalida,@JsonKey(name: 'detalle_de_pago') bool detalleDePago
});




}
/// @nodoc
class _$ChecadorDiscrepancyCopyWithImpl<$Res>
    implements $ChecadorDiscrepancyCopyWith<$Res> {
  _$ChecadorDiscrepancyCopyWithImpl(this._self, this._then);

  final ChecadorDiscrepancy _self;
  final $Res Function(ChecadorDiscrepancy) _then;

/// Create a copy of ChecadorDiscrepancy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checked = null,Object? isSuspicious = null,Object? overlapsNormalSchedule = null,Object? hasChecadorEvidence = null,Object? message = null,Object? horasSolicitadas = freezed,Object? horasAPagar = freezed,Object? sinSalida = null,Object? detalleDePago = null,}) {
  return _then(ChecadorDiscrepancy(
checked: null == checked ? _self.checked : checked // ignore: cast_nullable_to_non_nullable
as bool,isSuspicious: null == isSuspicious ? _self.isSuspicious : isSuspicious // ignore: cast_nullable_to_non_nullable
as bool,overlapsNormalSchedule: null == overlapsNormalSchedule ? _self.overlapsNormalSchedule : overlapsNormalSchedule // ignore: cast_nullable_to_non_nullable
as bool,hasChecadorEvidence: null == hasChecadorEvidence ? _self.hasChecadorEvidence : hasChecadorEvidence // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,horasSolicitadas: freezed == horasSolicitadas ? _self.horasSolicitadas : horasSolicitadas // ignore: cast_nullable_to_non_nullable
as double?,horasAPagar: freezed == horasAPagar ? _self.horasAPagar : horasAPagar // ignore: cast_nullable_to_non_nullable
as double?,sinSalida: null == sinSalida ? _self.sinSalida : sinSalida // ignore: cast_nullable_to_non_nullable
as bool,detalleDePago: null == detalleDePago ? _self.detalleDePago : detalleDePago // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecadorDiscrepancy].
extension ChecadorDiscrepancyPatterns on ChecadorDiscrepancy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecadorDiscrepancy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecadorDiscrepancy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecadorDiscrepancy value)  $default,){
final _that = this;
switch (_that) {
case _ChecadorDiscrepancy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecadorDiscrepancy value)?  $default,){
final _that = this;
switch (_that) {
case _ChecadorDiscrepancy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool checked, @JsonKey(name: 'is_suspicious')  bool isSuspicious, @JsonKey(name: 'overlaps_normal_schedule')  bool overlapsNormalSchedule, @JsonKey(name: 'has_checador_evidence')  bool hasChecadorEvidence,  String message, @JsonKey(name: 'horas_solicitadas')  double? horasSolicitadas, @JsonKey(name: 'horas_a_pagar')  double? horasAPagar, @JsonKey(name: 'sin_salida')  bool sinSalida, @JsonKey(name: 'detalle_de_pago')  bool detalleDePago)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecadorDiscrepancy() when $default != null:
return $default(_that.checked,_that.isSuspicious,_that.overlapsNormalSchedule,_that.hasChecadorEvidence,_that.message,_that.horasSolicitadas,_that.horasAPagar,_that.sinSalida,_that.detalleDePago);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool checked, @JsonKey(name: 'is_suspicious')  bool isSuspicious, @JsonKey(name: 'overlaps_normal_schedule')  bool overlapsNormalSchedule, @JsonKey(name: 'has_checador_evidence')  bool hasChecadorEvidence,  String message, @JsonKey(name: 'horas_solicitadas')  double? horasSolicitadas, @JsonKey(name: 'horas_a_pagar')  double? horasAPagar, @JsonKey(name: 'sin_salida')  bool sinSalida, @JsonKey(name: 'detalle_de_pago')  bool detalleDePago)  $default,) {final _that = this;
switch (_that) {
case _ChecadorDiscrepancy():
return $default(_that.checked,_that.isSuspicious,_that.overlapsNormalSchedule,_that.hasChecadorEvidence,_that.message,_that.horasSolicitadas,_that.horasAPagar,_that.sinSalida,_that.detalleDePago);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool checked, @JsonKey(name: 'is_suspicious')  bool isSuspicious, @JsonKey(name: 'overlaps_normal_schedule')  bool overlapsNormalSchedule, @JsonKey(name: 'has_checador_evidence')  bool hasChecadorEvidence,  String message, @JsonKey(name: 'horas_solicitadas')  double? horasSolicitadas, @JsonKey(name: 'horas_a_pagar')  double? horasAPagar, @JsonKey(name: 'sin_salida')  bool sinSalida, @JsonKey(name: 'detalle_de_pago')  bool detalleDePago)?  $default,) {final _that = this;
switch (_that) {
case _ChecadorDiscrepancy() when $default != null:
return $default(_that.checked,_that.isSuspicious,_that.overlapsNormalSchedule,_that.hasChecadorEvidence,_that.message,_that.horasSolicitadas,_that.horasAPagar,_that.sinSalida,_that.detalleDePago);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChecadorDiscrepancy implements ChecadorDiscrepancy {
  const _ChecadorDiscrepancy({required this.checked, @JsonKey(name: 'is_suspicious') required this.isSuspicious, @JsonKey(name: 'overlaps_normal_schedule') required this.overlapsNormalSchedule, @JsonKey(name: 'has_checador_evidence') required this.hasChecadorEvidence, required this.message, @JsonKey(name: 'horas_solicitadas') this.horasSolicitadas, @JsonKey(name: 'horas_a_pagar') this.horasAPagar, @JsonKey(name: 'sin_salida') this.sinSalida = false, @JsonKey(name: 'detalle_de_pago') this.detalleDePago = false});
  factory _ChecadorDiscrepancy.fromJson(Map<String, dynamic> json) => _$ChecadorDiscrepancyFromJson(json);

@override final  bool checked;
@override@JsonKey(name: 'is_suspicious') final  bool isSuspicious;
@override@JsonKey(name: 'overlaps_normal_schedule') final  bool overlapsNormalSchedule;
@override@JsonKey(name: 'has_checador_evidence') final  bool hasChecadorEvidence;
@override final  String message;
/// Solo Horas extra (null en Hora por hora o con un servidor anterior):
/// horas solicitadas y las que se pagan en nómina según el checador.
@override@JsonKey(name: 'horas_solicitadas') final  double? horasSolicitadas;
@override@JsonKey(name: 'horas_a_pagar') final  double? horasAPagar;
@override@JsonKey(name: 'sin_salida') final  bool sinSalida;
/// True solo para RH en Horas extra: el mensaje incluye cuánto se paga.
/// Al jefe directo le llega solo lo que checó.
@override@JsonKey(name: 'detalle_de_pago') final  bool detalleDePago;

/// Create a copy of ChecadorDiscrepancy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecadorDiscrepancyCopyWith<_ChecadorDiscrepancy> get copyWith => __$ChecadorDiscrepancyCopyWithImpl<_ChecadorDiscrepancy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecadorDiscrepancyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecadorDiscrepancy&&(identical(other.checked, checked) || other.checked == checked)&&(identical(other.isSuspicious, isSuspicious) || other.isSuspicious == isSuspicious)&&(identical(other.overlapsNormalSchedule, overlapsNormalSchedule) || other.overlapsNormalSchedule == overlapsNormalSchedule)&&(identical(other.hasChecadorEvidence, hasChecadorEvidence) || other.hasChecadorEvidence == hasChecadorEvidence)&&(identical(other.message, message) || other.message == message)&&(identical(other.horasSolicitadas, horasSolicitadas) || other.horasSolicitadas == horasSolicitadas)&&(identical(other.horasAPagar, horasAPagar) || other.horasAPagar == horasAPagar)&&(identical(other.sinSalida, sinSalida) || other.sinSalida == sinSalida)&&(identical(other.detalleDePago, detalleDePago) || other.detalleDePago == detalleDePago));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checked,isSuspicious,overlapsNormalSchedule,hasChecadorEvidence,message,horasSolicitadas,horasAPagar,sinSalida,detalleDePago);

@override
String toString() {
  return 'ChecadorDiscrepancy(checked: $checked, isSuspicious: $isSuspicious, overlapsNormalSchedule: $overlapsNormalSchedule, hasChecadorEvidence: $hasChecadorEvidence, message: $message, horasSolicitadas: $horasSolicitadas, horasAPagar: $horasAPagar, sinSalida: $sinSalida, detalleDePago: $detalleDePago)';
}


}

/// @nodoc
abstract mixin class _$ChecadorDiscrepancyCopyWith<$Res> implements $ChecadorDiscrepancyCopyWith<$Res> {
  factory _$ChecadorDiscrepancyCopyWith(_ChecadorDiscrepancy value, $Res Function(_ChecadorDiscrepancy) _then) = __$ChecadorDiscrepancyCopyWithImpl;
@override @useResult
$Res call({
 bool checked,@JsonKey(name: 'is_suspicious') bool isSuspicious,@JsonKey(name: 'overlaps_normal_schedule') bool overlapsNormalSchedule,@JsonKey(name: 'has_checador_evidence') bool hasChecadorEvidence, String message,@JsonKey(name: 'horas_solicitadas') double? horasSolicitadas,@JsonKey(name: 'horas_a_pagar') double? horasAPagar,@JsonKey(name: 'sin_salida') bool sinSalida,@JsonKey(name: 'detalle_de_pago') bool detalleDePago
});




}
/// @nodoc
class __$ChecadorDiscrepancyCopyWithImpl<$Res>
    implements _$ChecadorDiscrepancyCopyWith<$Res> {
  __$ChecadorDiscrepancyCopyWithImpl(this._self, this._then);

  final _ChecadorDiscrepancy _self;
  final $Res Function(_ChecadorDiscrepancy) _then;

/// Create a copy of ChecadorDiscrepancy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checked = null,Object? isSuspicious = null,Object? overlapsNormalSchedule = null,Object? hasChecadorEvidence = null,Object? message = null,Object? horasSolicitadas = freezed,Object? horasAPagar = freezed,Object? sinSalida = null,Object? detalleDePago = null,}) {
  return _then(_ChecadorDiscrepancy(
checked: null == checked ? _self.checked : checked // ignore: cast_nullable_to_non_nullable
as bool,isSuspicious: null == isSuspicious ? _self.isSuspicious : isSuspicious // ignore: cast_nullable_to_non_nullable
as bool,overlapsNormalSchedule: null == overlapsNormalSchedule ? _self.overlapsNormalSchedule : overlapsNormalSchedule // ignore: cast_nullable_to_non_nullable
as bool,hasChecadorEvidence: null == hasChecadorEvidence ? _self.hasChecadorEvidence : hasChecadorEvidence // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,horasSolicitadas: freezed == horasSolicitadas ? _self.horasSolicitadas : horasSolicitadas // ignore: cast_nullable_to_non_nullable
as double?,horasAPagar: freezed == horasAPagar ? _self.horasAPagar : horasAPagar // ignore: cast_nullable_to_non_nullable
as double?,sinSalida: null == sinSalida ? _self.sinSalida : sinSalida // ignore: cast_nullable_to_non_nullable
as bool,detalleDePago: null == detalleDePago ? _self.detalleDePago : detalleDePago // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
