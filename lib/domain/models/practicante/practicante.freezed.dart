// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practicante.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Practicante implements DiagnosticableTreeMixin {

 BaseEmpleado get base; TypePracticante get type; Universidad get university; AltaPracticante get alta; StatusPracticante? get status; User? get user;
/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PracticanteCopyWith<Practicante> get copyWith => _$PracticanteCopyWithImpl<Practicante>(this as Practicante, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Practicante'))
    ..add(DiagnosticsProperty('base', base))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('university', university))..add(DiagnosticsProperty('alta', alta))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Practicante&&(identical(other.base, base) || other.base == base)&&(identical(other.type, type) || other.type == type)&&(identical(other.university, university) || other.university == university)&&(identical(other.alta, alta) || other.alta == alta)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,base,type,university,alta,status,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Practicante(base: $base, type: $type, university: $university, alta: $alta, status: $status, user: $user)';
}


}

/// @nodoc
abstract mixin class $PracticanteCopyWith<$Res>  {
  factory $PracticanteCopyWith(Practicante value, $Res Function(Practicante) _then) = _$PracticanteCopyWithImpl;
@useResult
$Res call({
 BaseEmpleado base, TypePracticante type, Universidad university, AltaPracticante alta, StatusPracticante? status, User? user
});


$BaseEmpleadoCopyWith<$Res> get base;$UniversidadCopyWith<$Res> get university;$AltaPracticanteCopyWith<$Res> get alta;$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$PracticanteCopyWithImpl<$Res>
    implements $PracticanteCopyWith<$Res> {
  _$PracticanteCopyWithImpl(this._self, this._then);

  final Practicante _self;
  final $Res Function(Practicante) _then;

/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? base = null,Object? type = null,Object? university = null,Object? alta = null,Object? status = freezed,Object? user = freezed,}) {
  return _then(Practicante(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as BaseEmpleado,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypePracticante,university: null == university ? _self.university : university // ignore: cast_nullable_to_non_nullable
as Universidad,alta: null == alta ? _self.alta : alta // ignore: cast_nullable_to_non_nullable
as AltaPracticante,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusPracticante?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}
/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseEmpleadoCopyWith<$Res> get base {
  
  return $BaseEmpleadoCopyWith<$Res>(_self.base, (value) {
    return _then(_self.copyWith(base: value));
  });
}/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UniversidadCopyWith<$Res> get university {
  
  return $UniversidadCopyWith<$Res>(_self.university, (value) {
    return _then(_self.copyWith(university: value));
  });
}/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AltaPracticanteCopyWith<$Res> get alta {
  
  return $AltaPracticanteCopyWith<$Res>(_self.alta, (value) {
    return _then(_self.copyWith(alta: value));
  });
}/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [Practicante].
extension PracticantePatterns on Practicante {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Practicante value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Practicante() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Practicante value)  $default,){
final _that = this;
switch (_that) {
case _Practicante():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Practicante value)?  $default,){
final _that = this;
switch (_that) {
case _Practicante() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BaseEmpleado base,  TypePracticante type,  Universidad university,  AltaPracticante alta,  StatusPracticante? status,  User? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Practicante() when $default != null:
return $default(_that.base,_that.type,_that.university,_that.alta,_that.status,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BaseEmpleado base,  TypePracticante type,  Universidad university,  AltaPracticante alta,  StatusPracticante? status,  User? user)  $default,) {final _that = this;
switch (_that) {
case _Practicante():
return $default(_that.base,_that.type,_that.university,_that.alta,_that.status,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BaseEmpleado base,  TypePracticante type,  Universidad university,  AltaPracticante alta,  StatusPracticante? status,  User? user)?  $default,) {final _that = this;
switch (_that) {
case _Practicante() when $default != null:
return $default(_that.base,_that.type,_that.university,_that.alta,_that.status,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _Practicante with DiagnosticableTreeMixin implements Practicante {
  const _Practicante({required this.base, required this.type, required this.university, required this.alta, this.status, this.user});
  

@override final  BaseEmpleado base;
@override final  TypePracticante type;
@override final  Universidad university;
@override final  AltaPracticante alta;
@override final  StatusPracticante? status;
@override final  User? user;

/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PracticanteCopyWith<_Practicante> get copyWith => __$PracticanteCopyWithImpl<_Practicante>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Practicante'))
    ..add(DiagnosticsProperty('base', base))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('university', university))..add(DiagnosticsProperty('alta', alta))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Practicante&&(identical(other.base, base) || other.base == base)&&(identical(other.type, type) || other.type == type)&&(identical(other.university, university) || other.university == university)&&(identical(other.alta, alta) || other.alta == alta)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,base,type,university,alta,status,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Practicante(base: $base, type: $type, university: $university, alta: $alta, status: $status, user: $user)';
}


}

/// @nodoc
abstract mixin class _$PracticanteCopyWith<$Res> implements $PracticanteCopyWith<$Res> {
  factory _$PracticanteCopyWith(_Practicante value, $Res Function(_Practicante) _then) = __$PracticanteCopyWithImpl;
@override @useResult
$Res call({
 BaseEmpleado base, TypePracticante type, Universidad university, AltaPracticante alta, StatusPracticante? status, User? user
});


@override $BaseEmpleadoCopyWith<$Res> get base;@override $UniversidadCopyWith<$Res> get university;@override $AltaPracticanteCopyWith<$Res> get alta;@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$PracticanteCopyWithImpl<$Res>
    implements _$PracticanteCopyWith<$Res> {
  __$PracticanteCopyWithImpl(this._self, this._then);

  final _Practicante _self;
  final $Res Function(_Practicante) _then;

/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? base = null,Object? type = null,Object? university = null,Object? alta = null,Object? status = freezed,Object? user = freezed,}) {
  return _then(_Practicante(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as BaseEmpleado,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypePracticante,university: null == university ? _self.university : university // ignore: cast_nullable_to_non_nullable
as Universidad,alta: null == alta ? _self.alta : alta // ignore: cast_nullable_to_non_nullable
as AltaPracticante,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusPracticante?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseEmpleadoCopyWith<$Res> get base {
  
  return $BaseEmpleadoCopyWith<$Res>(_self.base, (value) {
    return _then(_self.copyWith(base: value));
  });
}/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UniversidadCopyWith<$Res> get university {
  
  return $UniversidadCopyWith<$Res>(_self.university, (value) {
    return _then(_self.copyWith(university: value));
  });
}/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AltaPracticanteCopyWith<$Res> get alta {
  
  return $AltaPracticanteCopyWith<$Res>(_self.alta, (value) {
    return _then(_self.copyWith(alta: value));
  });
}/// Create a copy of Practicante
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc
mixin _$AltaPracticante implements DiagnosticableTreeMixin {

 String? get rfcUrl; String? get cartaPresentacionUrl;
/// Create a copy of AltaPracticante
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AltaPracticanteCopyWith<AltaPracticante> get copyWith => _$AltaPracticanteCopyWithImpl<AltaPracticante>(this as AltaPracticante, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AltaPracticante'))
    ..add(DiagnosticsProperty('rfcUrl', rfcUrl))..add(DiagnosticsProperty('cartaPresentacionUrl', cartaPresentacionUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AltaPracticante&&(identical(other.rfcUrl, rfcUrl) || other.rfcUrl == rfcUrl)&&(identical(other.cartaPresentacionUrl, cartaPresentacionUrl) || other.cartaPresentacionUrl == cartaPresentacionUrl));
}


@override
int get hashCode => Object.hash(runtimeType,rfcUrl,cartaPresentacionUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AltaPracticante(rfcUrl: $rfcUrl, cartaPresentacionUrl: $cartaPresentacionUrl)';
}


}

/// @nodoc
abstract mixin class $AltaPracticanteCopyWith<$Res>  {
  factory $AltaPracticanteCopyWith(AltaPracticante value, $Res Function(AltaPracticante) _then) = _$AltaPracticanteCopyWithImpl;
@useResult
$Res call({
 String? rfcUrl, String? cartaPresentacionUrl
});




}
/// @nodoc
class _$AltaPracticanteCopyWithImpl<$Res>
    implements $AltaPracticanteCopyWith<$Res> {
  _$AltaPracticanteCopyWithImpl(this._self, this._then);

  final AltaPracticante _self;
  final $Res Function(AltaPracticante) _then;

/// Create a copy of AltaPracticante
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rfcUrl = freezed,Object? cartaPresentacionUrl = freezed,}) {
  return _then(AltaPracticante(
rfcUrl: freezed == rfcUrl ? _self.rfcUrl : rfcUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaPresentacionUrl: freezed == cartaPresentacionUrl ? _self.cartaPresentacionUrl : cartaPresentacionUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AltaPracticante].
extension AltaPracticantePatterns on AltaPracticante {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AltaPracticante value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AltaPracticante() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AltaPracticante value)  $default,){
final _that = this;
switch (_that) {
case _AltaPracticante():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AltaPracticante value)?  $default,){
final _that = this;
switch (_that) {
case _AltaPracticante() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? rfcUrl,  String? cartaPresentacionUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AltaPracticante() when $default != null:
return $default(_that.rfcUrl,_that.cartaPresentacionUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? rfcUrl,  String? cartaPresentacionUrl)  $default,) {final _that = this;
switch (_that) {
case _AltaPracticante():
return $default(_that.rfcUrl,_that.cartaPresentacionUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? rfcUrl,  String? cartaPresentacionUrl)?  $default,) {final _that = this;
switch (_that) {
case _AltaPracticante() when $default != null:
return $default(_that.rfcUrl,_that.cartaPresentacionUrl);case _:
  return null;

}
}

}

/// @nodoc


class _AltaPracticante with DiagnosticableTreeMixin implements AltaPracticante {
  const _AltaPracticante({this.rfcUrl, this.cartaPresentacionUrl});
  

@override final  String? rfcUrl;
@override final  String? cartaPresentacionUrl;

/// Create a copy of AltaPracticante
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AltaPracticanteCopyWith<_AltaPracticante> get copyWith => __$AltaPracticanteCopyWithImpl<_AltaPracticante>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AltaPracticante'))
    ..add(DiagnosticsProperty('rfcUrl', rfcUrl))..add(DiagnosticsProperty('cartaPresentacionUrl', cartaPresentacionUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AltaPracticante&&(identical(other.rfcUrl, rfcUrl) || other.rfcUrl == rfcUrl)&&(identical(other.cartaPresentacionUrl, cartaPresentacionUrl) || other.cartaPresentacionUrl == cartaPresentacionUrl));
}


@override
int get hashCode => Object.hash(runtimeType,rfcUrl,cartaPresentacionUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AltaPracticante(rfcUrl: $rfcUrl, cartaPresentacionUrl: $cartaPresentacionUrl)';
}


}

/// @nodoc
abstract mixin class _$AltaPracticanteCopyWith<$Res> implements $AltaPracticanteCopyWith<$Res> {
  factory _$AltaPracticanteCopyWith(_AltaPracticante value, $Res Function(_AltaPracticante) _then) = __$AltaPracticanteCopyWithImpl;
@override @useResult
$Res call({
 String? rfcUrl, String? cartaPresentacionUrl
});




}
/// @nodoc
class __$AltaPracticanteCopyWithImpl<$Res>
    implements _$AltaPracticanteCopyWith<$Res> {
  __$AltaPracticanteCopyWithImpl(this._self, this._then);

  final _AltaPracticante _self;
  final $Res Function(_AltaPracticante) _then;

/// Create a copy of AltaPracticante
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rfcUrl = freezed,Object? cartaPresentacionUrl = freezed,}) {
  return _then(_AltaPracticante(
rfcUrl: freezed == rfcUrl ? _self.rfcUrl : rfcUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaPresentacionUrl: freezed == cartaPresentacionUrl ? _self.cartaPresentacionUrl : cartaPresentacionUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
