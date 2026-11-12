/// Aviso de requisición u orden de compra que llega a la campanita compartida.
class AvisoCompra {
  const AvisoCompra({
    required this.id,
    required this.tipo,
    required this.titulo,
    required this.mensaje,
    required this.leida,
    required this.referenciaTipo,
    required this.referenciaId,
    required this.accion,
    this.de,
    this.createdAt,
  });

  factory AvisoCompra.fromJson(Map<String, dynamic> json) {
    return AvisoCompra(
      id: (json['id'] as num?)?.toInt() ?? 0,
      tipo: json['tipo']?.toString() ?? '',
      titulo: json['titulo']?.toString() ?? '',
      mensaje: json['mensaje']?.toString() ?? '',
      leida: json['leida'] == true,
      referenciaTipo: json['referencia_tipo']?.toString() ?? '',
      referenciaId: (json['referencia_id'] as num?)?.toInt(),
      accion: json['accion']?.toString() ?? 'ver',
      de: json['de']?.toString(),
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
    );
  }

  final int id;
  final String tipo;
  final String titulo;
  final String mensaje;
  final bool leida;
  final String referenciaTipo;
  final int? referenciaId;
  final String accion;
  final String? de;
  final DateTime? createdAt;

  bool get tieneRequisicion =>
      referenciaTipo == 'requisicion' && referenciaId != null;

  String get etiqueta => switch (accion) {
        'aprobar_requisicion' => 'Aprobar',
        'crear_orden' => 'Crear orden',
        'ver_requisicion' => 'Ver requisición',
        'ver_orden' => 'Abrir Compras',
        'ver_actividad' => 'Abrir Compras',
        _ => 'Ver',
      };

  String get fechaCorta {
    final date = createdAt?.toLocal();
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }
}

/// Resultado del resumen compartido para la sección de Compras.
class ResumenCompras {
  const ResumenCompras({
    required this.noLeidas,
    required this.avisos,
  });

  factory ResumenCompras.fromJson(Map<String, dynamic> json) {
    final items = (json['avisos_compras'] as List?) ?? const [];
    return ResumenCompras(
      noLeidas: (json['compras_no_leidas'] as num?)?.toInt() ?? 0,
      avisos: items
          .whereType<Map>()
          .map((item) => AvisoCompra.fromJson(
                Map<String, dynamic>.from(item),
              ))
          .toList(),
    );
  }

  final int noLeidas;
  final List<AvisoCompra> avisos;
}
