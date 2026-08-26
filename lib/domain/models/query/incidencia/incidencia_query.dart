import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

part 'incidencia_query.freezed.dart';

@freezed
abstract class IncidenciaQuery with _$IncidenciaQuery {
  const factory IncidenciaQuery({
    /// List of states to filter
    @Default([])
    List<IncidenciaState> state,
    DateTimeRange? startRange,
    @Default([])
    List<IncidenciaCategory> categories,
    @Default([])
    List<int> solicitores,
  }) = _IncidenciaQuery;
}

extension IncidenciaQueryExtension on IncidenciaQuery {
  Map<String, dynamic>? toMap() {
    final mapped = {
      if (state.isNotEmpty)
        'state': state.map((stateValue) => stateValue.jsonValue).toList(),
      if (startRange != null)
        'start_from': startRange!.start.toShortIsoString(),
      if (startRange != null)
        'start_to': startRange!.end.toShortIsoString(),
      if (categories.isNotEmpty)
        'category': categories.map((category) => category.id).toList(),
      if (solicitores.isNotEmpty)
        'solicitor': solicitores,
    };
    if (mapped.isEmpty) return null;
    return mapped;
  }
}