// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checador_discrepancy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecadorDiscrepancy _$ChecadorDiscrepancyFromJson(Map<String, dynamic> json) =>
    _ChecadorDiscrepancy(
      checked: json['checked'] as bool,
      isSuspicious: json['is_suspicious'] as bool,
      overlapsNormalSchedule: json['overlaps_normal_schedule'] as bool,
      hasChecadorEvidence: json['has_checador_evidence'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ChecadorDiscrepancyToJson(
  _ChecadorDiscrepancy instance,
) => <String, dynamic>{
  'checked': instance.checked,
  'is_suspicious': instance.isSuspicious,
  'overlaps_normal_schedule': instance.overlapsNormalSchedule,
  'has_checador_evidence': instance.hasChecadorEvidence,
  'message': instance.message,
};
