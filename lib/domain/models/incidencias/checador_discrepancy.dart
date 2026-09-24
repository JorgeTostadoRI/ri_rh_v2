import 'package:freezed_annotation/freezed_annotation.dart';

part 'checador_discrepancy.freezed.dart';
part 'checador_discrepancy.g.dart';

@freezed
abstract class ChecadorDiscrepancy with _$ChecadorDiscrepancy {
    const factory ChecadorDiscrepancy({
        required bool checked,
        @JsonKey(name: 'is_suspicious')
        required bool isSuspicious,
        @JsonKey(name: 'overlaps_normal_schedule')
        required bool overlapsNormalSchedule,
        @JsonKey(name: 'has_checador_evidence')
        required bool hasChecadorEvidence,
        required String message,
    }) = _ChecadorDiscrepancy;

    factory ChecadorDiscrepancy.fromJson(Map<String, Object?> json) => _$ChecadorDiscrepancyFromJson(json);
}
