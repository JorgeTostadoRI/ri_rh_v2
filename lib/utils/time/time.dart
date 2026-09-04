import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';

@freezed
abstract class Time with _$Time {
  const factory Time(
    int hour,
    [
      @Default(0)
      int minute,
      @Default(0)
      int second,
    ]
  ) = _Time;

  @override
  String toString() {
    final hh = hour.toString().padLeft(2, '0');
    final mm = minute.toString().padLeft(2, '0');
    final ss = second.toString().padLeft(2, '0');
    return '$hh:$mm:$ss';
  }
}

class TimeConverter implements JsonConverter<Time, String> {
  const TimeConverter();

  @override
  Time fromJson(String json) {
    final parts = json.split(':');
    if (parts.length != 3) {
      throw ArgumentError.value(json, 'json', 'Time string must be composed in the format "hh:mm:ss"');
    }
    final hh = int.parse(parts[0]);
    final mm = int.parse(parts[1]);
    final ss = int.parse(parts[2]);
    return Time(hh, mm, ss);
  }

  @override
  String toJson(Time object) {
    // Time overrides toString() above, but freezed generates `_Time
    // implements Time` (not `extends`), so that override is never actually
    // inherited by instances — build the string directly instead.
    final hh = object.hour.toString().padLeft(2, '0');
    final mm = object.minute.toString().padLeft(2, '0');
    final ss = object.second.toString().padLeft(2, '0');
    return '$hh:$mm:$ss';
  }
}