import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';

class IncidenciaQuery {
  /// List of states to filter
  final List<IncidenciaState>? state;

  IncidenciaQuery({
    this.state,
  });

  Map<String, dynamic>? toMap() {
    final mapped = {
      if (state != null)
        'state': state!.map((stateValue) => stateValue.jsonValue).toList(),
    };
    if (mapped.isEmpty) return null;
    return mapped;
  }
}