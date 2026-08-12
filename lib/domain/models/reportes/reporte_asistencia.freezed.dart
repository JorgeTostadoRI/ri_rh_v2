// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reporte_asistencia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReporteAsistencia implements DiagnosticableTreeMixin {

 List<ReporteAsistenciaItem> get items; List<DateTime> get dates;
/// Create a copy of ReporteAsistencia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteAsistenciaCopyWith<ReporteAsistencia> get copyWith => _$ReporteAsistenciaCopyWithImpl<ReporteAsistencia>(this as ReporteAsistencia, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistencia'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('dates', dates));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteAsistencia&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.dates, dates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(dates));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistencia(items: $items, dates: $dates)';
}


}

/// @nodoc
abstract mixin class $ReporteAsistenciaCopyWith<$Res>  {
  factory $ReporteAsistenciaCopyWith(ReporteAsistencia value, $Res Function(ReporteAsistencia) _then) = _$ReporteAsistenciaCopyWithImpl;
@useResult
$Res call({
 List<ReporteAsistenciaItem> items, List<DateTime> dates
});




}
/// @nodoc
class _$ReporteAsistenciaCopyWithImpl<$Res>
    implements $ReporteAsistenciaCopyWith<$Res> {
  _$ReporteAsistenciaCopyWithImpl(this._self, this._then);

  final ReporteAsistencia _self;
  final $Res Function(ReporteAsistencia) _then;

/// Create a copy of ReporteAsistencia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? dates = null,}) {
  return _then(ReporteAsistencia(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReporteAsistenciaItem>,dates: null == dates ? _self.dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateTime>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReporteAsistencia].
extension ReporteAsistenciaPatterns on ReporteAsistencia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteAsistencia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteAsistencia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteAsistencia value)  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistencia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteAsistencia value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistencia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ReporteAsistenciaItem> items,  List<DateTime> dates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteAsistencia() when $default != null:
return $default(_that.items,_that.dates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ReporteAsistenciaItem> items,  List<DateTime> dates)  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistencia():
return $default(_that.items,_that.dates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ReporteAsistenciaItem> items,  List<DateTime> dates)?  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistencia() when $default != null:
return $default(_that.items,_that.dates);case _:
  return null;

}
}

}

/// @nodoc


class _ReporteAsistencia with DiagnosticableTreeMixin implements ReporteAsistencia {
  const _ReporteAsistencia({required  List<ReporteAsistenciaItem> items, required  List<DateTime> dates}): _items = items,_dates = dates;
  

 final  List<ReporteAsistenciaItem> _items;
@override List<ReporteAsistenciaItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<DateTime> _dates;
@override List<DateTime> get dates {
  if (_dates is EqualUnmodifiableListView) return _dates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dates);
}


/// Create a copy of ReporteAsistencia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteAsistenciaCopyWith<_ReporteAsistencia> get copyWith => __$ReporteAsistenciaCopyWithImpl<_ReporteAsistencia>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistencia'))
    ..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('dates', dates));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteAsistencia&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._dates, _dates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_dates));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistencia(items: $items, dates: $dates)';
}


}

/// @nodoc
abstract mixin class _$ReporteAsistenciaCopyWith<$Res> implements $ReporteAsistenciaCopyWith<$Res> {
  factory _$ReporteAsistenciaCopyWith(_ReporteAsistencia value, $Res Function(_ReporteAsistencia) _then) = __$ReporteAsistenciaCopyWithImpl;
@override @useResult
$Res call({
 List<ReporteAsistenciaItem> items, List<DateTime> dates
});




}
/// @nodoc
class __$ReporteAsistenciaCopyWithImpl<$Res>
    implements _$ReporteAsistenciaCopyWith<$Res> {
  __$ReporteAsistenciaCopyWithImpl(this._self, this._then);

  final _ReporteAsistencia _self;
  final $Res Function(_ReporteAsistencia) _then;

/// Create a copy of ReporteAsistencia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? dates = null,}) {
  return _then(_ReporteAsistencia(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReporteAsistenciaItem>,dates: null == dates ? _self._dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateTime>,
  ));
}


}

/// @nodoc
mixin _$ReporteAsistenciaItem implements DiagnosticableTreeMixin {

 User get user; Map<String, AsistenciaDaily> get asistencia; int get totalMinutesLate;
/// Create a copy of ReporteAsistenciaItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteAsistenciaItemCopyWith<ReporteAsistenciaItem> get copyWith => _$ReporteAsistenciaItemCopyWithImpl<ReporteAsistenciaItem>(this as ReporteAsistenciaItem, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaItem'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('asistencia', asistencia))..add(DiagnosticsProperty('totalMinutesLate', totalMinutesLate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteAsistenciaItem&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.asistencia, asistencia)&&(identical(other.totalMinutesLate, totalMinutesLate) || other.totalMinutesLate == totalMinutesLate));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(asistencia),totalMinutesLate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaItem(user: $user, asistencia: $asistencia, totalMinutesLate: $totalMinutesLate)';
}


}

/// @nodoc
abstract mixin class $ReporteAsistenciaItemCopyWith<$Res>  {
  factory $ReporteAsistenciaItemCopyWith(ReporteAsistenciaItem value, $Res Function(ReporteAsistenciaItem) _then) = _$ReporteAsistenciaItemCopyWithImpl;
@useResult
$Res call({
 User user, Map<String, AsistenciaDaily> asistencia, int totalMinutesLate
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$ReporteAsistenciaItemCopyWithImpl<$Res>
    implements $ReporteAsistenciaItemCopyWith<$Res> {
  _$ReporteAsistenciaItemCopyWithImpl(this._self, this._then);

  final ReporteAsistenciaItem _self;
  final $Res Function(ReporteAsistenciaItem) _then;

/// Create a copy of ReporteAsistenciaItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? asistencia = null,Object? totalMinutesLate = null,}) {
  return _then(ReporteAsistenciaItem(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,asistencia: null == asistencia ? _self.asistencia : asistencia // ignore: cast_nullable_to_non_nullable
as Map<String, AsistenciaDaily>,totalMinutesLate: null == totalMinutesLate ? _self.totalMinutesLate : totalMinutesLate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ReporteAsistenciaItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReporteAsistenciaItem].
extension ReporteAsistenciaItemPatterns on ReporteAsistenciaItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteAsistenciaItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteAsistenciaItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteAsistenciaItem value)  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteAsistenciaItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User user,  Map<String, AsistenciaDaily> asistencia,  int totalMinutesLate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteAsistenciaItem() when $default != null:
return $default(_that.user,_that.asistencia,_that.totalMinutesLate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User user,  Map<String, AsistenciaDaily> asistencia,  int totalMinutesLate)  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaItem():
return $default(_that.user,_that.asistencia,_that.totalMinutesLate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User user,  Map<String, AsistenciaDaily> asistencia,  int totalMinutesLate)?  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaItem() when $default != null:
return $default(_that.user,_that.asistencia,_that.totalMinutesLate);case _:
  return null;

}
}

}

/// @nodoc


class _ReporteAsistenciaItem with DiagnosticableTreeMixin implements ReporteAsistenciaItem {
  const _ReporteAsistenciaItem({required this.user, required  Map<String, AsistenciaDaily> asistencia, required this.totalMinutesLate}): _asistencia = asistencia;
  

@override final  User user;
 final  Map<String, AsistenciaDaily> _asistencia;
@override Map<String, AsistenciaDaily> get asistencia {
  if (_asistencia is EqualUnmodifiableMapView) return _asistencia;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_asistencia);
}

@override final  int totalMinutesLate;

/// Create a copy of ReporteAsistenciaItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteAsistenciaItemCopyWith<_ReporteAsistenciaItem> get copyWith => __$ReporteAsistenciaItemCopyWithImpl<_ReporteAsistenciaItem>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaItem'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('asistencia', asistencia))..add(DiagnosticsProperty('totalMinutesLate', totalMinutesLate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteAsistenciaItem&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._asistencia, _asistencia)&&(identical(other.totalMinutesLate, totalMinutesLate) || other.totalMinutesLate == totalMinutesLate));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_asistencia),totalMinutesLate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaItem(user: $user, asistencia: $asistencia, totalMinutesLate: $totalMinutesLate)';
}


}

/// @nodoc
abstract mixin class _$ReporteAsistenciaItemCopyWith<$Res> implements $ReporteAsistenciaItemCopyWith<$Res> {
  factory _$ReporteAsistenciaItemCopyWith(_ReporteAsistenciaItem value, $Res Function(_ReporteAsistenciaItem) _then) = __$ReporteAsistenciaItemCopyWithImpl;
@override @useResult
$Res call({
 User user, Map<String, AsistenciaDaily> asistencia, int totalMinutesLate
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$ReporteAsistenciaItemCopyWithImpl<$Res>
    implements _$ReporteAsistenciaItemCopyWith<$Res> {
  __$ReporteAsistenciaItemCopyWithImpl(this._self, this._then);

  final _ReporteAsistenciaItem _self;
  final $Res Function(_ReporteAsistenciaItem) _then;

/// Create a copy of ReporteAsistenciaItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? asistencia = null,Object? totalMinutesLate = null,}) {
  return _then(_ReporteAsistenciaItem(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,asistencia: null == asistencia ? _self._asistencia : asistencia // ignore: cast_nullable_to_non_nullable
as Map<String, AsistenciaDaily>,totalMinutesLate: null == totalMinutesLate ? _self.totalMinutesLate : totalMinutesLate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ReporteAsistenciaItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
