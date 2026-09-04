import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/horario/horario_dia.dart';
import 'package:ri_rh_v2/utils/time/time.dart';

part 'horario.freezed.dart';
part 'horario.g.dart';

enum HorarioScheduleType {
  @JsonValue('uniform')
  uniform,
  @JsonValue('custom')
  custom,
}

@freezed
abstract class Horario with _$Horario {
  const factory Horario({
    @Default(0)
    int id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String name,
    @Default(HorarioScheduleType.uniform)
    HorarioScheduleType scheduleType,
    @TimeConverter()
    Time? firstStartTime,
    @TimeConverter()
    Time? firstEndTime,
    @TimeConverter()
    Time? secondStartTime,
    @TimeConverter()
    Time? secondEndTime,
    @Default(false) bool mon,
    @Default(false) bool tue,
    @Default(false) bool wed,
    @Default(false) bool thu,
    @Default(false) bool fri,
    @Default(false) bool sat,
    @Default(false) bool sun,
    @Default(<HorarioDia>[])
    List<HorarioDia> dias,
  }) = _Horario;

  factory Horario.fromJson(Map<String, Object?> json) => _$HorarioFromJson(json);
}
