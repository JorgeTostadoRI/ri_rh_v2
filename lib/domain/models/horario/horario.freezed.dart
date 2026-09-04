// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'horario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Horario implements DiagnosticableTreeMixin {

 int get id; DateTime? get createdAt; DateTime? get updatedAt; String get name; HorarioScheduleType get scheduleType;@TimeConverter() Time? get firstStartTime;@TimeConverter() Time? get firstEndTime;@TimeConverter() Time? get secondStartTime;@TimeConverter() Time? get secondEndTime; bool get mon; bool get tue; bool get wed; bool get thu; bool get fri; bool get sat; bool get sun; List<HorarioDia> get dias;
/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HorarioCopyWith<Horario> get copyWith => _$HorarioCopyWithImpl<Horario>(this as Horario, _$identity);

  /// Serializes this Horario to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Horario'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('scheduleType', scheduleType))..add(DiagnosticsProperty('firstStartTime', firstStartTime))..add(DiagnosticsProperty('firstEndTime', firstEndTime))..add(DiagnosticsProperty('secondStartTime', secondStartTime))..add(DiagnosticsProperty('secondEndTime', secondEndTime))..add(DiagnosticsProperty('mon', mon))..add(DiagnosticsProperty('tue', tue))..add(DiagnosticsProperty('wed', wed))..add(DiagnosticsProperty('thu', thu))..add(DiagnosticsProperty('fri', fri))..add(DiagnosticsProperty('sat', sat))..add(DiagnosticsProperty('sun', sun))..add(DiagnosticsProperty('dias', dias));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Horario&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.scheduleType, scheduleType) || other.scheduleType == scheduleType)&&(identical(other.firstStartTime, firstStartTime) || other.firstStartTime == firstStartTime)&&(identical(other.firstEndTime, firstEndTime) || other.firstEndTime == firstEndTime)&&(identical(other.secondStartTime, secondStartTime) || other.secondStartTime == secondStartTime)&&(identical(other.secondEndTime, secondEndTime) || other.secondEndTime == secondEndTime)&&(identical(other.mon, mon) || other.mon == mon)&&(identical(other.tue, tue) || other.tue == tue)&&(identical(other.wed, wed) || other.wed == wed)&&(identical(other.thu, thu) || other.thu == thu)&&(identical(other.fri, fri) || other.fri == fri)&&(identical(other.sat, sat) || other.sat == sat)&&(identical(other.sun, sun) || other.sun == sun)&&const DeepCollectionEquality().equals(other.dias, dias));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,scheduleType,firstStartTime,firstEndTime,secondStartTime,secondEndTime,mon,tue,wed,thu,fri,sat,sun,const DeepCollectionEquality().hash(dias));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Horario(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, scheduleType: $scheduleType, firstStartTime: $firstStartTime, firstEndTime: $firstEndTime, secondStartTime: $secondStartTime, secondEndTime: $secondEndTime, mon: $mon, tue: $tue, wed: $wed, thu: $thu, fri: $fri, sat: $sat, sun: $sun, dias: $dias)';
}


}

/// @nodoc
abstract mixin class $HorarioCopyWith<$Res>  {
  factory $HorarioCopyWith(Horario value, $Res Function(Horario) _then) = _$HorarioCopyWithImpl;
@useResult
$Res call({
 int id, DateTime? createdAt, DateTime? updatedAt, String name, HorarioScheduleType scheduleType,@TimeConverter() Time? firstStartTime,@TimeConverter() Time? firstEndTime,@TimeConverter() Time? secondStartTime,@TimeConverter() Time? secondEndTime, bool mon, bool tue, bool wed, bool thu, bool fri, bool sat, bool sun, List<HorarioDia> dias
});


$TimeCopyWith<$Res>? get firstStartTime;$TimeCopyWith<$Res>? get firstEndTime;$TimeCopyWith<$Res>? get secondStartTime;$TimeCopyWith<$Res>? get secondEndTime;

}
/// @nodoc
class _$HorarioCopyWithImpl<$Res>
    implements $HorarioCopyWith<$Res> {
  _$HorarioCopyWithImpl(this._self, this._then);

  final Horario _self;
  final $Res Function(Horario) _then;

/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? name = null,Object? scheduleType = null,Object? firstStartTime = freezed,Object? firstEndTime = freezed,Object? secondStartTime = freezed,Object? secondEndTime = freezed,Object? mon = null,Object? tue = null,Object? wed = null,Object? thu = null,Object? fri = null,Object? sat = null,Object? sun = null,Object? dias = null,}) {
  return _then(Horario(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,scheduleType: null == scheduleType ? _self.scheduleType : scheduleType // ignore: cast_nullable_to_non_nullable
as HorarioScheduleType,firstStartTime: freezed == firstStartTime ? _self.firstStartTime : firstStartTime // ignore: cast_nullable_to_non_nullable
as Time?,firstEndTime: freezed == firstEndTime ? _self.firstEndTime : firstEndTime // ignore: cast_nullable_to_non_nullable
as Time?,secondStartTime: freezed == secondStartTime ? _self.secondStartTime : secondStartTime // ignore: cast_nullable_to_non_nullable
as Time?,secondEndTime: freezed == secondEndTime ? _self.secondEndTime : secondEndTime // ignore: cast_nullable_to_non_nullable
as Time?,mon: null == mon ? _self.mon : mon // ignore: cast_nullable_to_non_nullable
as bool,tue: null == tue ? _self.tue : tue // ignore: cast_nullable_to_non_nullable
as bool,wed: null == wed ? _self.wed : wed // ignore: cast_nullable_to_non_nullable
as bool,thu: null == thu ? _self.thu : thu // ignore: cast_nullable_to_non_nullable
as bool,fri: null == fri ? _self.fri : fri // ignore: cast_nullable_to_non_nullable
as bool,sat: null == sat ? _self.sat : sat // ignore: cast_nullable_to_non_nullable
as bool,sun: null == sun ? _self.sun : sun // ignore: cast_nullable_to_non_nullable
as bool,dias: null == dias ? _self.dias : dias // ignore: cast_nullable_to_non_nullable
as List<HorarioDia>,
  ));
}
/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get firstStartTime {
    if (_self.firstStartTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.firstStartTime!, (value) {
    return _then(_self.copyWith(firstStartTime: value));
  });
}/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get firstEndTime {
    if (_self.firstEndTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.firstEndTime!, (value) {
    return _then(_self.copyWith(firstEndTime: value));
  });
}/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get secondStartTime {
    if (_self.secondStartTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.secondStartTime!, (value) {
    return _then(_self.copyWith(secondStartTime: value));
  });
}/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get secondEndTime {
    if (_self.secondEndTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.secondEndTime!, (value) {
    return _then(_self.copyWith(secondEndTime: value));
  });
}
}


/// Adds pattern-matching-related methods to [Horario].
extension HorarioPatterns on Horario {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Horario value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Horario() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Horario value)  $default,){
final _that = this;
switch (_that) {
case _Horario():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Horario value)?  $default,){
final _that = this;
switch (_that) {
case _Horario() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime? createdAt,  DateTime? updatedAt,  String name,  HorarioScheduleType scheduleType, @TimeConverter()  Time? firstStartTime, @TimeConverter()  Time? firstEndTime, @TimeConverter()  Time? secondStartTime, @TimeConverter()  Time? secondEndTime,  bool mon,  bool tue,  bool wed,  bool thu,  bool fri,  bool sat,  bool sun,  List<HorarioDia> dias)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Horario() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.scheduleType,_that.firstStartTime,_that.firstEndTime,_that.secondStartTime,_that.secondEndTime,_that.mon,_that.tue,_that.wed,_that.thu,_that.fri,_that.sat,_that.sun,_that.dias);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime? createdAt,  DateTime? updatedAt,  String name,  HorarioScheduleType scheduleType, @TimeConverter()  Time? firstStartTime, @TimeConverter()  Time? firstEndTime, @TimeConverter()  Time? secondStartTime, @TimeConverter()  Time? secondEndTime,  bool mon,  bool tue,  bool wed,  bool thu,  bool fri,  bool sat,  bool sun,  List<HorarioDia> dias)  $default,) {final _that = this;
switch (_that) {
case _Horario():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.scheduleType,_that.firstStartTime,_that.firstEndTime,_that.secondStartTime,_that.secondEndTime,_that.mon,_that.tue,_that.wed,_that.thu,_that.fri,_that.sat,_that.sun,_that.dias);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime? createdAt,  DateTime? updatedAt,  String name,  HorarioScheduleType scheduleType, @TimeConverter()  Time? firstStartTime, @TimeConverter()  Time? firstEndTime, @TimeConverter()  Time? secondStartTime, @TimeConverter()  Time? secondEndTime,  bool mon,  bool tue,  bool wed,  bool thu,  bool fri,  bool sat,  bool sun,  List<HorarioDia> dias)?  $default,) {final _that = this;
switch (_that) {
case _Horario() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.scheduleType,_that.firstStartTime,_that.firstEndTime,_that.secondStartTime,_that.secondEndTime,_that.mon,_that.tue,_that.wed,_that.thu,_that.fri,_that.sat,_that.sun,_that.dias);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Horario with DiagnosticableTreeMixin implements Horario {
  const _Horario({this.id = 0, this.createdAt, this.updatedAt, required this.name, this.scheduleType = HorarioScheduleType.uniform, @TimeConverter() this.firstStartTime, @TimeConverter() this.firstEndTime, @TimeConverter() this.secondStartTime, @TimeConverter() this.secondEndTime, this.mon = false, this.tue = false, this.wed = false, this.thu = false, this.fri = false, this.sat = false, this.sun = false,  List<HorarioDia> dias = const <HorarioDia>[]}): _dias = dias;
  factory _Horario.fromJson(Map<String, dynamic> json) => _$HorarioFromJson(json);

@override@JsonKey() final  int id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  String name;
@override@JsonKey() final  HorarioScheduleType scheduleType;
@override@TimeConverter() final  Time? firstStartTime;
@override@TimeConverter() final  Time? firstEndTime;
@override@TimeConverter() final  Time? secondStartTime;
@override@TimeConverter() final  Time? secondEndTime;
@override@JsonKey() final  bool mon;
@override@JsonKey() final  bool tue;
@override@JsonKey() final  bool wed;
@override@JsonKey() final  bool thu;
@override@JsonKey() final  bool fri;
@override@JsonKey() final  bool sat;
@override@JsonKey() final  bool sun;
 final  List<HorarioDia> _dias;
@override@JsonKey() List<HorarioDia> get dias {
  if (_dias is EqualUnmodifiableListView) return _dias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dias);
}


/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HorarioCopyWith<_Horario> get copyWith => __$HorarioCopyWithImpl<_Horario>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HorarioToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Horario'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('scheduleType', scheduleType))..add(DiagnosticsProperty('firstStartTime', firstStartTime))..add(DiagnosticsProperty('firstEndTime', firstEndTime))..add(DiagnosticsProperty('secondStartTime', secondStartTime))..add(DiagnosticsProperty('secondEndTime', secondEndTime))..add(DiagnosticsProperty('mon', mon))..add(DiagnosticsProperty('tue', tue))..add(DiagnosticsProperty('wed', wed))..add(DiagnosticsProperty('thu', thu))..add(DiagnosticsProperty('fri', fri))..add(DiagnosticsProperty('sat', sat))..add(DiagnosticsProperty('sun', sun))..add(DiagnosticsProperty('dias', dias));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Horario&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.scheduleType, scheduleType) || other.scheduleType == scheduleType)&&(identical(other.firstStartTime, firstStartTime) || other.firstStartTime == firstStartTime)&&(identical(other.firstEndTime, firstEndTime) || other.firstEndTime == firstEndTime)&&(identical(other.secondStartTime, secondStartTime) || other.secondStartTime == secondStartTime)&&(identical(other.secondEndTime, secondEndTime) || other.secondEndTime == secondEndTime)&&(identical(other.mon, mon) || other.mon == mon)&&(identical(other.tue, tue) || other.tue == tue)&&(identical(other.wed, wed) || other.wed == wed)&&(identical(other.thu, thu) || other.thu == thu)&&(identical(other.fri, fri) || other.fri == fri)&&(identical(other.sat, sat) || other.sat == sat)&&(identical(other.sun, sun) || other.sun == sun)&&const DeepCollectionEquality().equals(other._dias, _dias));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,scheduleType,firstStartTime,firstEndTime,secondStartTime,secondEndTime,mon,tue,wed,thu,fri,sat,sun,const DeepCollectionEquality().hash(_dias));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Horario(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, scheduleType: $scheduleType, firstStartTime: $firstStartTime, firstEndTime: $firstEndTime, secondStartTime: $secondStartTime, secondEndTime: $secondEndTime, mon: $mon, tue: $tue, wed: $wed, thu: $thu, fri: $fri, sat: $sat, sun: $sun, dias: $dias)';
}


}

/// @nodoc
abstract mixin class _$HorarioCopyWith<$Res> implements $HorarioCopyWith<$Res> {
  factory _$HorarioCopyWith(_Horario value, $Res Function(_Horario) _then) = __$HorarioCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime? createdAt, DateTime? updatedAt, String name, HorarioScheduleType scheduleType,@TimeConverter() Time? firstStartTime,@TimeConverter() Time? firstEndTime,@TimeConverter() Time? secondStartTime,@TimeConverter() Time? secondEndTime, bool mon, bool tue, bool wed, bool thu, bool fri, bool sat, bool sun, List<HorarioDia> dias
});


@override $TimeCopyWith<$Res>? get firstStartTime;@override $TimeCopyWith<$Res>? get firstEndTime;@override $TimeCopyWith<$Res>? get secondStartTime;@override $TimeCopyWith<$Res>? get secondEndTime;

}
/// @nodoc
class __$HorarioCopyWithImpl<$Res>
    implements _$HorarioCopyWith<$Res> {
  __$HorarioCopyWithImpl(this._self, this._then);

  final _Horario _self;
  final $Res Function(_Horario) _then;

/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? name = null,Object? scheduleType = null,Object? firstStartTime = freezed,Object? firstEndTime = freezed,Object? secondStartTime = freezed,Object? secondEndTime = freezed,Object? mon = null,Object? tue = null,Object? wed = null,Object? thu = null,Object? fri = null,Object? sat = null,Object? sun = null,Object? dias = null,}) {
  return _then(_Horario(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,scheduleType: null == scheduleType ? _self.scheduleType : scheduleType // ignore: cast_nullable_to_non_nullable
as HorarioScheduleType,firstStartTime: freezed == firstStartTime ? _self.firstStartTime : firstStartTime // ignore: cast_nullable_to_non_nullable
as Time?,firstEndTime: freezed == firstEndTime ? _self.firstEndTime : firstEndTime // ignore: cast_nullable_to_non_nullable
as Time?,secondStartTime: freezed == secondStartTime ? _self.secondStartTime : secondStartTime // ignore: cast_nullable_to_non_nullable
as Time?,secondEndTime: freezed == secondEndTime ? _self.secondEndTime : secondEndTime // ignore: cast_nullable_to_non_nullable
as Time?,mon: null == mon ? _self.mon : mon // ignore: cast_nullable_to_non_nullable
as bool,tue: null == tue ? _self.tue : tue // ignore: cast_nullable_to_non_nullable
as bool,wed: null == wed ? _self.wed : wed // ignore: cast_nullable_to_non_nullable
as bool,thu: null == thu ? _self.thu : thu // ignore: cast_nullable_to_non_nullable
as bool,fri: null == fri ? _self.fri : fri // ignore: cast_nullable_to_non_nullable
as bool,sat: null == sat ? _self.sat : sat // ignore: cast_nullable_to_non_nullable
as bool,sun: null == sun ? _self.sun : sun // ignore: cast_nullable_to_non_nullable
as bool,dias: null == dias ? _self._dias : dias // ignore: cast_nullable_to_non_nullable
as List<HorarioDia>,
  ));
}

/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get firstStartTime {
    if (_self.firstStartTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.firstStartTime!, (value) {
    return _then(_self.copyWith(firstStartTime: value));
  });
}/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get firstEndTime {
    if (_self.firstEndTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.firstEndTime!, (value) {
    return _then(_self.copyWith(firstEndTime: value));
  });
}/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get secondStartTime {
    if (_self.secondStartTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.secondStartTime!, (value) {
    return _then(_self.copyWith(secondStartTime: value));
  });
}/// Create a copy of Horario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get secondEndTime {
    if (_self.secondEndTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.secondEndTime!, (value) {
    return _then(_self.copyWith(secondEndTime: value));
  });
}
}

// dart format on
