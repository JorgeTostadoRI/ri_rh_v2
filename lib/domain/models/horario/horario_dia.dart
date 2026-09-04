import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/utils/time/time.dart';

part 'horario_dia.freezed.dart';
part 'horario_dia.g.dart';

@freezed
abstract class HorarioDia with _$HorarioDia {
  const factory HorarioDia({
    required int day,
    @TimeConverter()
    required Time startTime,
    @TimeConverter()
    required Time endTime,
    @TimeConverter()
    Time? lunchStartTime,
    @TimeConverter()
    Time? lunchEndTime,
  }) = _HorarioDia;

  factory HorarioDia.fromJson(Map<String, Object?> json) => _$HorarioDiaFromJson(json);
}
