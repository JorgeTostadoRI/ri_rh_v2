// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'horario_dia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HorarioDia {

 int get day;@TimeConverter() Time get startTime;@TimeConverter() Time get endTime;@TimeConverter() Time? get lunchStartTime;@TimeConverter() Time? get lunchEndTime;
/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HorarioDiaCopyWith<HorarioDia> get copyWith => _$HorarioDiaCopyWithImpl<HorarioDia>(this as HorarioDia, _$identity);

  /// Serializes this HorarioDia to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HorarioDia&&(identical(other.day, day) || other.day == day)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.lunchStartTime, lunchStartTime) || other.lunchStartTime == lunchStartTime)&&(identical(other.lunchEndTime, lunchEndTime) || other.lunchEndTime == lunchEndTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,startTime,endTime,lunchStartTime,lunchEndTime);

@override
String toString() {
  return 'HorarioDia(day: $day, startTime: $startTime, endTime: $endTime, lunchStartTime: $lunchStartTime, lunchEndTime: $lunchEndTime)';
}


}

/// @nodoc
abstract mixin class $HorarioDiaCopyWith<$Res>  {
  factory $HorarioDiaCopyWith(HorarioDia value, $Res Function(HorarioDia) _then) = _$HorarioDiaCopyWithImpl;
@useResult
$Res call({
 int day,@TimeConverter() Time startTime,@TimeConverter() Time endTime,@TimeConverter() Time? lunchStartTime,@TimeConverter() Time? lunchEndTime
});


$TimeCopyWith<$Res> get startTime;$TimeCopyWith<$Res> get endTime;$TimeCopyWith<$Res>? get lunchStartTime;$TimeCopyWith<$Res>? get lunchEndTime;

}
/// @nodoc
class _$HorarioDiaCopyWithImpl<$Res>
    implements $HorarioDiaCopyWith<$Res> {
  _$HorarioDiaCopyWithImpl(this._self, this._then);

  final HorarioDia _self;
  final $Res Function(HorarioDia) _then;

/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? startTime = null,Object? endTime = null,Object? lunchStartTime = freezed,Object? lunchEndTime = freezed,}) {
  return _then(HorarioDia(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Time,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Time,lunchStartTime: freezed == lunchStartTime ? _self.lunchStartTime : lunchStartTime // ignore: cast_nullable_to_non_nullable
as Time?,lunchEndTime: freezed == lunchEndTime ? _self.lunchEndTime : lunchEndTime // ignore: cast_nullable_to_non_nullable
as Time?,
  ));
}
/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res> get startTime {
  
  return $TimeCopyWith<$Res>(_self.startTime, (value) {
    return _then(_self.copyWith(startTime: value));
  });
}/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res> get endTime {
  
  return $TimeCopyWith<$Res>(_self.endTime, (value) {
    return _then(_self.copyWith(endTime: value));
  });
}/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get lunchStartTime {
    if (_self.lunchStartTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.lunchStartTime!, (value) {
    return _then(_self.copyWith(lunchStartTime: value));
  });
}/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get lunchEndTime {
    if (_self.lunchEndTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.lunchEndTime!, (value) {
    return _then(_self.copyWith(lunchEndTime: value));
  });
}
}


/// Adds pattern-matching-related methods to [HorarioDia].
extension HorarioDiaPatterns on HorarioDia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HorarioDia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HorarioDia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HorarioDia value)  $default,){
final _that = this;
switch (_that) {
case _HorarioDia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HorarioDia value)?  $default,){
final _that = this;
switch (_that) {
case _HorarioDia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int day, @TimeConverter()  Time startTime, @TimeConverter()  Time endTime, @TimeConverter()  Time? lunchStartTime, @TimeConverter()  Time? lunchEndTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HorarioDia() when $default != null:
return $default(_that.day,_that.startTime,_that.endTime,_that.lunchStartTime,_that.lunchEndTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int day, @TimeConverter()  Time startTime, @TimeConverter()  Time endTime, @TimeConverter()  Time? lunchStartTime, @TimeConverter()  Time? lunchEndTime)  $default,) {final _that = this;
switch (_that) {
case _HorarioDia():
return $default(_that.day,_that.startTime,_that.endTime,_that.lunchStartTime,_that.lunchEndTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int day, @TimeConverter()  Time startTime, @TimeConverter()  Time endTime, @TimeConverter()  Time? lunchStartTime, @TimeConverter()  Time? lunchEndTime)?  $default,) {final _that = this;
switch (_that) {
case _HorarioDia() when $default != null:
return $default(_that.day,_that.startTime,_that.endTime,_that.lunchStartTime,_that.lunchEndTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HorarioDia implements HorarioDia {
  const _HorarioDia({required this.day, @TimeConverter() required this.startTime, @TimeConverter() required this.endTime, @TimeConverter() this.lunchStartTime, @TimeConverter() this.lunchEndTime});
  factory _HorarioDia.fromJson(Map<String, dynamic> json) => _$HorarioDiaFromJson(json);

@override final  int day;
@override@TimeConverter() final  Time startTime;
@override@TimeConverter() final  Time endTime;
@override@TimeConverter() final  Time? lunchStartTime;
@override@TimeConverter() final  Time? lunchEndTime;

/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HorarioDiaCopyWith<_HorarioDia> get copyWith => __$HorarioDiaCopyWithImpl<_HorarioDia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HorarioDiaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HorarioDia&&(identical(other.day, day) || other.day == day)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.lunchStartTime, lunchStartTime) || other.lunchStartTime == lunchStartTime)&&(identical(other.lunchEndTime, lunchEndTime) || other.lunchEndTime == lunchEndTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,startTime,endTime,lunchStartTime,lunchEndTime);

@override
String toString() {
  return 'HorarioDia(day: $day, startTime: $startTime, endTime: $endTime, lunchStartTime: $lunchStartTime, lunchEndTime: $lunchEndTime)';
}


}

/// @nodoc
abstract mixin class _$HorarioDiaCopyWith<$Res> implements $HorarioDiaCopyWith<$Res> {
  factory _$HorarioDiaCopyWith(_HorarioDia value, $Res Function(_HorarioDia) _then) = __$HorarioDiaCopyWithImpl;
@override @useResult
$Res call({
 int day,@TimeConverter() Time startTime,@TimeConverter() Time endTime,@TimeConverter() Time? lunchStartTime,@TimeConverter() Time? lunchEndTime
});


@override $TimeCopyWith<$Res> get startTime;@override $TimeCopyWith<$Res> get endTime;@override $TimeCopyWith<$Res>? get lunchStartTime;@override $TimeCopyWith<$Res>? get lunchEndTime;

}
/// @nodoc
class __$HorarioDiaCopyWithImpl<$Res>
    implements _$HorarioDiaCopyWith<$Res> {
  __$HorarioDiaCopyWithImpl(this._self, this._then);

  final _HorarioDia _self;
  final $Res Function(_HorarioDia) _then;

/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? startTime = null,Object? endTime = null,Object? lunchStartTime = freezed,Object? lunchEndTime = freezed,}) {
  return _then(_HorarioDia(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Time,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as Time,lunchStartTime: freezed == lunchStartTime ? _self.lunchStartTime : lunchStartTime // ignore: cast_nullable_to_non_nullable
as Time?,lunchEndTime: freezed == lunchEndTime ? _self.lunchEndTime : lunchEndTime // ignore: cast_nullable_to_non_nullable
as Time?,
  ));
}

/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res> get startTime {
  
  return $TimeCopyWith<$Res>(_self.startTime, (value) {
    return _then(_self.copyWith(startTime: value));
  });
}/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res> get endTime {
  
  return $TimeCopyWith<$Res>(_self.endTime, (value) {
    return _then(_self.copyWith(endTime: value));
  });
}/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get lunchStartTime {
    if (_self.lunchStartTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.lunchStartTime!, (value) {
    return _then(_self.copyWith(lunchStartTime: value));
  });
}/// Create a copy of HorarioDia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeCopyWith<$Res>? get lunchEndTime {
    if (_self.lunchEndTime == null) {
    return null;
  }

  return $TimeCopyWith<$Res>(_self.lunchEndTime!, (value) {
    return _then(_self.copyWith(lunchEndTime: value));
  });
}
}

// dart format on
