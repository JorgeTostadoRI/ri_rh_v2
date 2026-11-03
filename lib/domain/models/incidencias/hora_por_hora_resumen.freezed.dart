// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hora_por_hora_resumen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HoraPorHoraResumen {

 int get id; DateTime get start; DateTime get end; IncidenciaState get state;@JsonKey(name: 'approved_by') int? get approvedByRef;@JsonKey(name: 'rh_approved_by') int? get rhApprovedByRef; HoraPorHoraChecador? get checador;
/// Create a copy of HoraPorHoraResumen
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoraPorHoraResumenCopyWith<HoraPorHoraResumen> get copyWith => _$HoraPorHoraResumenCopyWithImpl<HoraPorHoraResumen>(this as HoraPorHoraResumen, _$identity);

  /// Serializes this HoraPorHoraResumen to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoraPorHoraResumen&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.state, state) || other.state == state)&&(identical(other.approvedByRef, approvedByRef) || other.approvedByRef == approvedByRef)&&(identical(other.rhApprovedByRef, rhApprovedByRef) || other.rhApprovedByRef == rhApprovedByRef)&&(identical(other.checador, checador) || other.checador == checador));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start,end,state,approvedByRef,rhApprovedByRef,checador);

@override
String toString() {
  return 'HoraPorHoraResumen(id: $id, start: $start, end: $end, state: $state, approvedByRef: $approvedByRef, rhApprovedByRef: $rhApprovedByRef, checador: $checador)';
}


}

/// @nodoc
abstract mixin class $HoraPorHoraResumenCopyWith<$Res>  {
  factory $HoraPorHoraResumenCopyWith(HoraPorHoraResumen value, $Res Function(HoraPorHoraResumen) _then) = _$HoraPorHoraResumenCopyWithImpl;
@useResult
$Res call({
 int id, DateTime start, DateTime end, IncidenciaState state,@JsonKey(name: 'approved_by') int? approvedByRef,@JsonKey(name: 'rh_approved_by') int? rhApprovedByRef, HoraPorHoraChecador? checador
});


$HoraPorHoraChecadorCopyWith<$Res>? get checador;

}
/// @nodoc
class _$HoraPorHoraResumenCopyWithImpl<$Res>
    implements $HoraPorHoraResumenCopyWith<$Res> {
  _$HoraPorHoraResumenCopyWithImpl(this._self, this._then);

  final HoraPorHoraResumen _self;
  final $Res Function(HoraPorHoraResumen) _then;

/// Create a copy of HoraPorHoraResumen
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? start = null,Object? end = null,Object? state = null,Object? approvedByRef = freezed,Object? rhApprovedByRef = freezed,Object? checador = freezed,}) {
  return _then(HoraPorHoraResumen(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as IncidenciaState,approvedByRef: freezed == approvedByRef ? _self.approvedByRef : approvedByRef // ignore: cast_nullable_to_non_nullable
as int?,rhApprovedByRef: freezed == rhApprovedByRef ? _self.rhApprovedByRef : rhApprovedByRef // ignore: cast_nullable_to_non_nullable
as int?,checador: freezed == checador ? _self.checador : checador // ignore: cast_nullable_to_non_nullable
as HoraPorHoraChecador?,
  ));
}
/// Create a copy of HoraPorHoraResumen
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HoraPorHoraChecadorCopyWith<$Res>? get checador {
    if (_self.checador == null) {
    return null;
  }

  return $HoraPorHoraChecadorCopyWith<$Res>(_self.checador!, (value) {
    return _then(_self.copyWith(checador: value));
  });
}
}


/// Adds pattern-matching-related methods to [HoraPorHoraResumen].
extension HoraPorHoraResumenPatterns on HoraPorHoraResumen {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HoraPorHoraResumen value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HoraPorHoraResumen() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HoraPorHoraResumen value)  $default,){
final _that = this;
switch (_that) {
case _HoraPorHoraResumen():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HoraPorHoraResumen value)?  $default,){
final _that = this;
switch (_that) {
case _HoraPorHoraResumen() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime start,  DateTime end,  IncidenciaState state, @JsonKey(name: 'approved_by')  int? approvedByRef, @JsonKey(name: 'rh_approved_by')  int? rhApprovedByRef,  HoraPorHoraChecador? checador)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HoraPorHoraResumen() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.state,_that.approvedByRef,_that.rhApprovedByRef,_that.checador);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime start,  DateTime end,  IncidenciaState state, @JsonKey(name: 'approved_by')  int? approvedByRef, @JsonKey(name: 'rh_approved_by')  int? rhApprovedByRef,  HoraPorHoraChecador? checador)  $default,) {final _that = this;
switch (_that) {
case _HoraPorHoraResumen():
return $default(_that.id,_that.start,_that.end,_that.state,_that.approvedByRef,_that.rhApprovedByRef,_that.checador);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime start,  DateTime end,  IncidenciaState state, @JsonKey(name: 'approved_by')  int? approvedByRef, @JsonKey(name: 'rh_approved_by')  int? rhApprovedByRef,  HoraPorHoraChecador? checador)?  $default,) {final _that = this;
switch (_that) {
case _HoraPorHoraResumen() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.state,_that.approvedByRef,_that.rhApprovedByRef,_that.checador);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HoraPorHoraResumen implements HoraPorHoraResumen {
  const _HoraPorHoraResumen({required this.id, required this.start, required this.end, required this.state, @JsonKey(name: 'approved_by') this.approvedByRef, @JsonKey(name: 'rh_approved_by') this.rhApprovedByRef, this.checador});
  factory _HoraPorHoraResumen.fromJson(Map<String, dynamic> json) => _$HoraPorHoraResumenFromJson(json);

@override final  int id;
@override final  DateTime start;
@override final  DateTime end;
@override final  IncidenciaState state;
@override@JsonKey(name: 'approved_by') final  int? approvedByRef;
@override@JsonKey(name: 'rh_approved_by') final  int? rhApprovedByRef;
@override final  HoraPorHoraChecador? checador;

/// Create a copy of HoraPorHoraResumen
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HoraPorHoraResumenCopyWith<_HoraPorHoraResumen> get copyWith => __$HoraPorHoraResumenCopyWithImpl<_HoraPorHoraResumen>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HoraPorHoraResumenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HoraPorHoraResumen&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.state, state) || other.state == state)&&(identical(other.approvedByRef, approvedByRef) || other.approvedByRef == approvedByRef)&&(identical(other.rhApprovedByRef, rhApprovedByRef) || other.rhApprovedByRef == rhApprovedByRef)&&(identical(other.checador, checador) || other.checador == checador));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start,end,state,approvedByRef,rhApprovedByRef,checador);

@override
String toString() {
  return 'HoraPorHoraResumen(id: $id, start: $start, end: $end, state: $state, approvedByRef: $approvedByRef, rhApprovedByRef: $rhApprovedByRef, checador: $checador)';
}


}

/// @nodoc
abstract mixin class _$HoraPorHoraResumenCopyWith<$Res> implements $HoraPorHoraResumenCopyWith<$Res> {
  factory _$HoraPorHoraResumenCopyWith(_HoraPorHoraResumen value, $Res Function(_HoraPorHoraResumen) _then) = __$HoraPorHoraResumenCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime start, DateTime end, IncidenciaState state,@JsonKey(name: 'approved_by') int? approvedByRef,@JsonKey(name: 'rh_approved_by') int? rhApprovedByRef, HoraPorHoraChecador? checador
});


@override $HoraPorHoraChecadorCopyWith<$Res>? get checador;

}
/// @nodoc
class __$HoraPorHoraResumenCopyWithImpl<$Res>
    implements _$HoraPorHoraResumenCopyWith<$Res> {
  __$HoraPorHoraResumenCopyWithImpl(this._self, this._then);

  final _HoraPorHoraResumen _self;
  final $Res Function(_HoraPorHoraResumen) _then;

/// Create a copy of HoraPorHoraResumen
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? start = null,Object? end = null,Object? state = null,Object? approvedByRef = freezed,Object? rhApprovedByRef = freezed,Object? checador = freezed,}) {
  return _then(_HoraPorHoraResumen(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as IncidenciaState,approvedByRef: freezed == approvedByRef ? _self.approvedByRef : approvedByRef // ignore: cast_nullable_to_non_nullable
as int?,rhApprovedByRef: freezed == rhApprovedByRef ? _self.rhApprovedByRef : rhApprovedByRef // ignore: cast_nullable_to_non_nullable
as int?,checador: freezed == checador ? _self.checador : checador // ignore: cast_nullable_to_non_nullable
as HoraPorHoraChecador?,
  ));
}

/// Create a copy of HoraPorHoraResumen
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HoraPorHoraChecadorCopyWith<$Res>? get checador {
    if (_self.checador == null) {
    return null;
  }

  return $HoraPorHoraChecadorCopyWith<$Res>(_self.checador!, (value) {
    return _then(_self.copyWith(checador: value));
  });
}
}


/// @nodoc
mixin _$HoraPorHoraChecador {

@JsonKey(name: 'is_suspicious') bool get isSuspicious; String get message;
/// Create a copy of HoraPorHoraChecador
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoraPorHoraChecadorCopyWith<HoraPorHoraChecador> get copyWith => _$HoraPorHoraChecadorCopyWithImpl<HoraPorHoraChecador>(this as HoraPorHoraChecador, _$identity);

  /// Serializes this HoraPorHoraChecador to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoraPorHoraChecador&&(identical(other.isSuspicious, isSuspicious) || other.isSuspicious == isSuspicious)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuspicious,message);

@override
String toString() {
  return 'HoraPorHoraChecador(isSuspicious: $isSuspicious, message: $message)';
}


}

/// @nodoc
abstract mixin class $HoraPorHoraChecadorCopyWith<$Res>  {
  factory $HoraPorHoraChecadorCopyWith(HoraPorHoraChecador value, $Res Function(HoraPorHoraChecador) _then) = _$HoraPorHoraChecadorCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_suspicious') bool isSuspicious, String message
});




}
/// @nodoc
class _$HoraPorHoraChecadorCopyWithImpl<$Res>
    implements $HoraPorHoraChecadorCopyWith<$Res> {
  _$HoraPorHoraChecadorCopyWithImpl(this._self, this._then);

  final HoraPorHoraChecador _self;
  final $Res Function(HoraPorHoraChecador) _then;

/// Create a copy of HoraPorHoraChecador
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuspicious = null,Object? message = null,}) {
  return _then(HoraPorHoraChecador(
isSuspicious: null == isSuspicious ? _self.isSuspicious : isSuspicious // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HoraPorHoraChecador].
extension HoraPorHoraChecadorPatterns on HoraPorHoraChecador {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HoraPorHoraChecador value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HoraPorHoraChecador() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HoraPorHoraChecador value)  $default,){
final _that = this;
switch (_that) {
case _HoraPorHoraChecador():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HoraPorHoraChecador value)?  $default,){
final _that = this;
switch (_that) {
case _HoraPorHoraChecador() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_suspicious')  bool isSuspicious,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HoraPorHoraChecador() when $default != null:
return $default(_that.isSuspicious,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_suspicious')  bool isSuspicious,  String message)  $default,) {final _that = this;
switch (_that) {
case _HoraPorHoraChecador():
return $default(_that.isSuspicious,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_suspicious')  bool isSuspicious,  String message)?  $default,) {final _that = this;
switch (_that) {
case _HoraPorHoraChecador() when $default != null:
return $default(_that.isSuspicious,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HoraPorHoraChecador implements HoraPorHoraChecador {
  const _HoraPorHoraChecador({@JsonKey(name: 'is_suspicious') required this.isSuspicious, required this.message});
  factory _HoraPorHoraChecador.fromJson(Map<String, dynamic> json) => _$HoraPorHoraChecadorFromJson(json);

@override@JsonKey(name: 'is_suspicious') final  bool isSuspicious;
@override final  String message;

/// Create a copy of HoraPorHoraChecador
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HoraPorHoraChecadorCopyWith<_HoraPorHoraChecador> get copyWith => __$HoraPorHoraChecadorCopyWithImpl<_HoraPorHoraChecador>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HoraPorHoraChecadorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HoraPorHoraChecador&&(identical(other.isSuspicious, isSuspicious) || other.isSuspicious == isSuspicious)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuspicious,message);

@override
String toString() {
  return 'HoraPorHoraChecador(isSuspicious: $isSuspicious, message: $message)';
}


}

/// @nodoc
abstract mixin class _$HoraPorHoraChecadorCopyWith<$Res> implements $HoraPorHoraChecadorCopyWith<$Res> {
  factory _$HoraPorHoraChecadorCopyWith(_HoraPorHoraChecador value, $Res Function(_HoraPorHoraChecador) _then) = __$HoraPorHoraChecadorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_suspicious') bool isSuspicious, String message
});




}
/// @nodoc
class __$HoraPorHoraChecadorCopyWithImpl<$Res>
    implements _$HoraPorHoraChecadorCopyWith<$Res> {
  __$HoraPorHoraChecadorCopyWithImpl(this._self, this._then);

  final _HoraPorHoraChecador _self;
  final $Res Function(_HoraPorHoraChecador) _then;

/// Create a copy of HoraPorHoraChecador
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuspicious = null,Object? message = null,}) {
  return _then(_HoraPorHoraChecador(
isSuspicious: null == isSuspicious ? _self.isSuspicious : isSuspicious // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
