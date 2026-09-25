// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reporte_incidencia_nomina.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReporteIncidenciaNomina {

 List<DateTime> get dates; List<ReporteIncidenciaNominaItem> get items;
/// Create a copy of ReporteIncidenciaNomina
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteIncidenciaNominaCopyWith<ReporteIncidenciaNomina> get copyWith => _$ReporteIncidenciaNominaCopyWithImpl<ReporteIncidenciaNomina>(this as ReporteIncidenciaNomina, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteIncidenciaNomina&&const DeepCollectionEquality().equals(other.dates, dates)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(dates),const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ReporteIncidenciaNomina(dates: $dates, items: $items)';
}


}

/// @nodoc
abstract mixin class $ReporteIncidenciaNominaCopyWith<$Res>  {
  factory $ReporteIncidenciaNominaCopyWith(ReporteIncidenciaNomina value, $Res Function(ReporteIncidenciaNomina) _then) = _$ReporteIncidenciaNominaCopyWithImpl;
@useResult
$Res call({
 List<DateTime> dates, List<ReporteIncidenciaNominaItem> items
});




}
/// @nodoc
class _$ReporteIncidenciaNominaCopyWithImpl<$Res>
    implements $ReporteIncidenciaNominaCopyWith<$Res> {
  _$ReporteIncidenciaNominaCopyWithImpl(this._self, this._then);

  final ReporteIncidenciaNomina _self;
  final $Res Function(ReporteIncidenciaNomina) _then;

/// Create a copy of ReporteIncidenciaNomina
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dates = null,Object? items = null,}) {
  return _then(ReporteIncidenciaNomina(
dates: null == dates ? _self.dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateTime>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReporteIncidenciaNominaItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReporteIncidenciaNomina].
extension ReporteIncidenciaNominaPatterns on ReporteIncidenciaNomina {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteIncidenciaNomina value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNomina() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteIncidenciaNomina value)  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNomina():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteIncidenciaNomina value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNomina() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DateTime> dates,  List<ReporteIncidenciaNominaItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNomina() when $default != null:
return $default(_that.dates,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DateTime> dates,  List<ReporteIncidenciaNominaItem> items)  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNomina():
return $default(_that.dates,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DateTime> dates,  List<ReporteIncidenciaNominaItem> items)?  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNomina() when $default != null:
return $default(_that.dates,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _ReporteIncidenciaNomina implements ReporteIncidenciaNomina {
  const _ReporteIncidenciaNomina({required  List<DateTime> dates, required  List<ReporteIncidenciaNominaItem> items}): _dates = dates,_items = items;
  

 final  List<DateTime> _dates;
@override List<DateTime> get dates {
  if (_dates is EqualUnmodifiableListView) return _dates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dates);
}

 final  List<ReporteIncidenciaNominaItem> _items;
@override List<ReporteIncidenciaNominaItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ReporteIncidenciaNomina
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteIncidenciaNominaCopyWith<_ReporteIncidenciaNomina> get copyWith => __$ReporteIncidenciaNominaCopyWithImpl<_ReporteIncidenciaNomina>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteIncidenciaNomina&&const DeepCollectionEquality().equals(other._dates, _dates)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dates),const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ReporteIncidenciaNomina(dates: $dates, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ReporteIncidenciaNominaCopyWith<$Res> implements $ReporteIncidenciaNominaCopyWith<$Res> {
  factory _$ReporteIncidenciaNominaCopyWith(_ReporteIncidenciaNomina value, $Res Function(_ReporteIncidenciaNomina) _then) = __$ReporteIncidenciaNominaCopyWithImpl;
@override @useResult
$Res call({
 List<DateTime> dates, List<ReporteIncidenciaNominaItem> items
});




}
/// @nodoc
class __$ReporteIncidenciaNominaCopyWithImpl<$Res>
    implements _$ReporteIncidenciaNominaCopyWith<$Res> {
  __$ReporteIncidenciaNominaCopyWithImpl(this._self, this._then);

  final _ReporteIncidenciaNomina _self;
  final $Res Function(_ReporteIncidenciaNomina) _then;

/// Create a copy of ReporteIncidenciaNomina
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dates = null,Object? items = null,}) {
  return _then(_ReporteIncidenciaNomina(
dates: null == dates ? _self._dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateTime>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReporteIncidenciaNominaItem>,
  ));
}


}

/// @nodoc
mixin _$ReporteIncidenciaNominaItem {

 int get id; String get username; String get fullName; bool get isPracticante; Departamento? get departamento; Map<String, String> get codigosPorDia; int get minutesLate; double get extraHours;
/// Create a copy of ReporteIncidenciaNominaItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteIncidenciaNominaItemCopyWith<ReporteIncidenciaNominaItem> get copyWith => _$ReporteIncidenciaNominaItemCopyWithImpl<ReporteIncidenciaNominaItem>(this as ReporteIncidenciaNominaItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteIncidenciaNominaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isPracticante, isPracticante) || other.isPracticante == isPracticante)&&(identical(other.departamento, departamento) || other.departamento == departamento)&&const DeepCollectionEquality().equals(other.codigosPorDia, codigosPorDia)&&(identical(other.minutesLate, minutesLate) || other.minutesLate == minutesLate)&&(identical(other.extraHours, extraHours) || other.extraHours == extraHours));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,fullName,isPracticante,departamento,const DeepCollectionEquality().hash(codigosPorDia),minutesLate,extraHours);

@override
String toString() {
  return 'ReporteIncidenciaNominaItem(id: $id, username: $username, fullName: $fullName, isPracticante: $isPracticante, departamento: $departamento, codigosPorDia: $codigosPorDia, minutesLate: $minutesLate, extraHours: $extraHours)';
}


}

/// @nodoc
abstract mixin class $ReporteIncidenciaNominaItemCopyWith<$Res>  {
  factory $ReporteIncidenciaNominaItemCopyWith(ReporteIncidenciaNominaItem value, $Res Function(ReporteIncidenciaNominaItem) _then) = _$ReporteIncidenciaNominaItemCopyWithImpl;
@useResult
$Res call({
 int id, String username, String fullName, bool isPracticante, Departamento? departamento, Map<String, String> codigosPorDia, int minutesLate, double extraHours
});


$DepartamentoCopyWith<$Res>? get departamento;

}
/// @nodoc
class _$ReporteIncidenciaNominaItemCopyWithImpl<$Res>
    implements $ReporteIncidenciaNominaItemCopyWith<$Res> {
  _$ReporteIncidenciaNominaItemCopyWithImpl(this._self, this._then);

  final ReporteIncidenciaNominaItem _self;
  final $Res Function(ReporteIncidenciaNominaItem) _then;

/// Create a copy of ReporteIncidenciaNominaItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? fullName = null,Object? isPracticante = null,Object? departamento = freezed,Object? codigosPorDia = null,Object? minutesLate = null,Object? extraHours = null,}) {
  return _then(ReporteIncidenciaNominaItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,isPracticante: null == isPracticante ? _self.isPracticante : isPracticante // ignore: cast_nullable_to_non_nullable
as bool,departamento: freezed == departamento ? _self.departamento : departamento // ignore: cast_nullable_to_non_nullable
as Departamento?,codigosPorDia: null == codigosPorDia ? _self.codigosPorDia : codigosPorDia // ignore: cast_nullable_to_non_nullable
as Map<String, String>,minutesLate: null == minutesLate ? _self.minutesLate : minutesLate // ignore: cast_nullable_to_non_nullable
as int,extraHours: null == extraHours ? _self.extraHours : extraHours // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of ReporteIncidenciaNominaItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartamentoCopyWith<$Res>? get departamento {
    if (_self.departamento == null) {
    return null;
  }

  return $DepartamentoCopyWith<$Res>(_self.departamento!, (value) {
    return _then(_self.copyWith(departamento: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReporteIncidenciaNominaItem].
extension ReporteIncidenciaNominaItemPatterns on ReporteIncidenciaNominaItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteIncidenciaNominaItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteIncidenciaNominaItem value)  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteIncidenciaNominaItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String fullName,  bool isPracticante,  Departamento? departamento,  Map<String, String> codigosPorDia,  int minutesLate,  double extraHours)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaItem() when $default != null:
return $default(_that.id,_that.username,_that.fullName,_that.isPracticante,_that.departamento,_that.codigosPorDia,_that.minutesLate,_that.extraHours);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String fullName,  bool isPracticante,  Departamento? departamento,  Map<String, String> codigosPorDia,  int minutesLate,  double extraHours)  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaItem():
return $default(_that.id,_that.username,_that.fullName,_that.isPracticante,_that.departamento,_that.codigosPorDia,_that.minutesLate,_that.extraHours);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String fullName,  bool isPracticante,  Departamento? departamento,  Map<String, String> codigosPorDia,  int minutesLate,  double extraHours)?  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaItem() when $default != null:
return $default(_that.id,_that.username,_that.fullName,_that.isPracticante,_that.departamento,_that.codigosPorDia,_that.minutesLate,_that.extraHours);case _:
  return null;

}
}

}

/// @nodoc


class _ReporteIncidenciaNominaItem implements ReporteIncidenciaNominaItem {
  const _ReporteIncidenciaNominaItem({required this.id, required this.username, required this.fullName, required this.isPracticante, this.departamento, required  Map<String, String> codigosPorDia, required this.minutesLate, required this.extraHours}): _codigosPorDia = codigosPorDia;
  

@override final  int id;
@override final  String username;
@override final  String fullName;
@override final  bool isPracticante;
@override final  Departamento? departamento;
 final  Map<String, String> _codigosPorDia;
@override Map<String, String> get codigosPorDia {
  if (_codigosPorDia is EqualUnmodifiableMapView) return _codigosPorDia;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_codigosPorDia);
}

@override final  int minutesLate;
@override final  double extraHours;

/// Create a copy of ReporteIncidenciaNominaItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteIncidenciaNominaItemCopyWith<_ReporteIncidenciaNominaItem> get copyWith => __$ReporteIncidenciaNominaItemCopyWithImpl<_ReporteIncidenciaNominaItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteIncidenciaNominaItem&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isPracticante, isPracticante) || other.isPracticante == isPracticante)&&(identical(other.departamento, departamento) || other.departamento == departamento)&&const DeepCollectionEquality().equals(other._codigosPorDia, _codigosPorDia)&&(identical(other.minutesLate, minutesLate) || other.minutesLate == minutesLate)&&(identical(other.extraHours, extraHours) || other.extraHours == extraHours));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,fullName,isPracticante,departamento,const DeepCollectionEquality().hash(_codigosPorDia),minutesLate,extraHours);

@override
String toString() {
  return 'ReporteIncidenciaNominaItem(id: $id, username: $username, fullName: $fullName, isPracticante: $isPracticante, departamento: $departamento, codigosPorDia: $codigosPorDia, minutesLate: $minutesLate, extraHours: $extraHours)';
}


}

/// @nodoc
abstract mixin class _$ReporteIncidenciaNominaItemCopyWith<$Res> implements $ReporteIncidenciaNominaItemCopyWith<$Res> {
  factory _$ReporteIncidenciaNominaItemCopyWith(_ReporteIncidenciaNominaItem value, $Res Function(_ReporteIncidenciaNominaItem) _then) = __$ReporteIncidenciaNominaItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String fullName, bool isPracticante, Departamento? departamento, Map<String, String> codigosPorDia, int minutesLate, double extraHours
});


@override $DepartamentoCopyWith<$Res>? get departamento;

}
/// @nodoc
class __$ReporteIncidenciaNominaItemCopyWithImpl<$Res>
    implements _$ReporteIncidenciaNominaItemCopyWith<$Res> {
  __$ReporteIncidenciaNominaItemCopyWithImpl(this._self, this._then);

  final _ReporteIncidenciaNominaItem _self;
  final $Res Function(_ReporteIncidenciaNominaItem) _then;

/// Create a copy of ReporteIncidenciaNominaItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? fullName = null,Object? isPracticante = null,Object? departamento = freezed,Object? codigosPorDia = null,Object? minutesLate = null,Object? extraHours = null,}) {
  return _then(_ReporteIncidenciaNominaItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,isPracticante: null == isPracticante ? _self.isPracticante : isPracticante // ignore: cast_nullable_to_non_nullable
as bool,departamento: freezed == departamento ? _self.departamento : departamento // ignore: cast_nullable_to_non_nullable
as Departamento?,codigosPorDia: null == codigosPorDia ? _self._codigosPorDia : codigosPorDia // ignore: cast_nullable_to_non_nullable
as Map<String, String>,minutesLate: null == minutesLate ? _self.minutesLate : minutesLate // ignore: cast_nullable_to_non_nullable
as int,extraHours: null == extraHours ? _self.extraHours : extraHours // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of ReporteIncidenciaNominaItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartamentoCopyWith<$Res>? get departamento {
    if (_self.departamento == null) {
    return null;
  }

  return $DepartamentoCopyWith<$Res>(_self.departamento!, (value) {
    return _then(_self.copyWith(departamento: value));
  });
}
}

// dart format on
