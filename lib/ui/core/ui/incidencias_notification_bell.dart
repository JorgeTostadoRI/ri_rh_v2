import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Campanita con el contador de incidencias pendientes y avisos del flujo de
/// incidencias (aprobadas/rechazadas).
///
/// Consulta el resumen compartido del backend y se actualiza cada minuto. Se
/// puede colocar en el AppBar o en la barra lateral de cualquier frontend.
class IncidenciasNotificationBell extends StatefulWidget {
  const IncidenciasNotificationBell({
    super.key,
    required this.apiBaseUrl,
    required this.readToken,
    this.rhUrl = '',
    this.includePending = true,
  });

  /// Base de la API, por ejemplo `https://servidor/RNTV`.
  final String apiBaseUrl;

  /// Obtiene el token de sesión del frontend actual.
  final Future<String?> Function() readToken;

  /// URL del sistema de RH para el botón "Abrir RH". Vacía para ocultarlo.
  final String rhUrl;

  /// En RH ya existe el badge de incidencias en el menú; ahí se puede omitir
  /// el conteo de pendientes y dejar solo los avisos.
  final bool includePending;

  @override
  State<IncidenciasNotificationBell> createState() =>
      _IncidenciasNotificationBellState();
}

class _IncidenciasNotificationBellState
    extends State<IncidenciasNotificationBell> {
  Timer? _timer;
  bool _loading = false;
  int _pendientes = 0;
  List<_IncidenciaPendiente> _incidencias = [];
  List<_Notificacion> _notificaciones = [];

  String get _base => widget.apiBaseUrl.replaceFirst(RegExp(r'/+$'), '');

  int get _total {
    if (widget.includePending) {
      final pendientes = _incidencias.isNotEmpty
          ? _incidencias.length
          : _pendientes;
      if (pendientes > 0) return pendientes;
    }
    return _notificaciones.where((item) => !item.leida).length;
  }

  @override
  void initState() {
    super.initState();
    _refresh();
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _refresh(),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _refresh() async {
    if (_loading) return;
    _loading = true;

    Dio? dio;
    try {
      final token = await widget.readToken();
      if (token == null || token.isEmpty) return;

      dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
      final response = await dio.get(
        '$_base/api/rh/notificaciones/resumen/',
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      final data = response.data is Map
          ? Map<String, dynamic>.from(response.data as Map)
          : <String, dynamic>{};
      final items = (data['notificaciones'] as List?) ?? const [];
      final incidencias = (data['incidencias'] as List?) ?? const [];
      if (!mounted) return;

      setState(() {
        _pendientes = (data['incidencias_pendientes'] as num?)?.toInt() ?? 0;
        _incidencias = incidencias
            .whereType<Map>()
            .map((item) => _IncidenciaPendiente.fromJson(
                  Map<String, dynamic>.from(item),
                ))
            .toList();
        _notificaciones = items
            .whereType<Map>()
            .map((item) => _Notificacion.fromJson(
                  Map<String, dynamic>.from(item),
                ))
            .toList();
      });
    } catch (_) {
      // Sin conexión o sin sesión: se conserva el último estado conocido.
    } finally {
      dio?.close();
      _loading = false;
    }
  }

  Future<void> _openCenter() async {
    await _refresh();
    if (!mounted) return;

    await showDialog<void>(
      context: context,
      builder: (context) => _NotificationCenterDialog(
        apiBaseUrl: _base,
        readToken: widget.readToken,
        rhUrl: widget.rhUrl,
        pendientes: widget.includePending ? _pendientes : 0,
        incidencias: widget.includePending ? _incidencias : const [],
        notificaciones: _notificaciones,
      ),
    );

    if (mounted) await _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Incidencias y notificaciones',
      onPressed: _openCenter,
      icon: Badge.count(
        count: _total,
        maxCount: 99,
        isLabelVisible: _total > 0,
        child: const Icon(Icons.notifications_outlined),
      ),
    );
  }
}

class _NotificationCenterDialog extends StatefulWidget {
  const _NotificationCenterDialog({
    required this.apiBaseUrl,
    required this.readToken,
    required this.rhUrl,
    required this.pendientes,
    required this.incidencias,
    required this.notificaciones,
  });

  final String apiBaseUrl;
  final Future<String?> Function() readToken;
  final String rhUrl;
  final int pendientes;
  final List<_IncidenciaPendiente> incidencias;
  final List<_Notificacion> notificaciones;

  @override
  State<_NotificationCenterDialog> createState() =>
      _NotificationCenterDialogState();
}

class _NotificationCenterDialogState extends State<_NotificationCenterDialog> {
  late List<_Notificacion> _items;

  @override
  void initState() {
    super.initState();
    _items = List.of(widget.notificaciones);
  }

  String get _base => widget.apiBaseUrl.replaceFirst(RegExp(r'/+$'), '');

  Future<void> _marcarLeida(_Notificacion item) async {
    final token = await widget.readToken();
    if (token == null || token.isEmpty) return;

    Dio? dio;
    try {
      dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
      await dio.patch(
        '$_base/api/messages/${item.id}/',
        data: {'leido': true},
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      if (!mounted) return;
      setState(() => _items.removeWhere((n) => n.id == item.id));
    } catch (_) {
      // Si falla, el aviso se conserva para reintentar.
    } finally {
      dio?.close();
    }
  }

  String get _rhPendingUrl {
    final base = widget.rhUrl.replaceFirst(RegExp(r'/+$'), '');
    if (base.isEmpty) return '';
    return '$base/#/incidencias-pending';
  }

  Future<void> _abrirRh() async {
    final uri = Uri.tryParse(_rhPendingUrl);
    if (uri == null) return;
    try {
      if (kIsWeb) {
        await launchUrl(uri, webOnlyWindowName: '_blank');
      } else {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      // Sin navegador disponible.
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.notifications_outlined, color: scheme.primary),
          const SizedBox(width: 8),
          const Expanded(child: Text('Incidencias y notificaciones')),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width < 620 ? MediaQuery.sizeOf(context).width * 0.82 : 520,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.incidencias.isNotEmpty) ...[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Incidencias por aprobar (${widget.incidencias.length})',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    if (widget.rhUrl.isNotEmpty)
                      TextButton(
                        onPressed: _abrirRh,
                        child: const Text('Abrir RH'),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                for (final incidencia in widget.incidencias)
                  _IncidenciaPendienteTile(
                    item: incidencia,
                    onVer: widget.rhUrl.isEmpty ? null : _abrirRh,
                  ),
                const SizedBox(height: 14),
              ] else if (widget.pendientes > 0) ...[
                Card(
                  margin: EdgeInsets.zero,
                  color: scheme.errorContainer.withValues(alpha: 0.55),
                  child: ListTile(
                    leading: Icon(
                      Icons.pending_actions,
                      color: scheme.onErrorContainer,
                    ),
                    title: Text(
                      '${widget.pendientes} incidencia(s) pendiente(s) de aprobar',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: const Text(
                      'Revísalas en Recursos Humanos para no dejarlas pasar.',
                    ),
                    trailing: widget.rhUrl.isEmpty
                        ? null
                        : TextButton(
                            onPressed: _abrirRh,
                            child: const Text('Abrir RH'),
                          ),
                  ),
                ),
                const SizedBox(height: 14),
              ],
              if (_items.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 40,
                        color: scheme.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sin notificaciones nuevas',
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                )
              else ...[
                Text(
                  'Notificaciones',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 6),
                for (final item in _items)
                  _NotificacionTile(
                    item: item,
                    onTap: () => _marcarLeida(item),
                  ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}

class _IncidenciaPendienteTile extends StatelessWidget {
  const _IncidenciaPendienteTile({required this.item, this.onVer});

  final _IncidenciaPendiente item;
  final VoidCallback? onVer;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final icon = switch (item.categoria) {
      'permiso' => Icons.event_busy_outlined,
      'vacaciones' => Icons.beach_access_outlined,
      'horasextra' => Icons.more_time_outlined,
      'horaporhora' => Icons.schedule_outlined,
      'incapacidad' => Icons.medical_services_outlined,
      'retardo' => Icons.timer_outlined,
      'falta' => Icons.event_busy_outlined,
      'requerimientojudicial' => Icons.gavel_outlined,
      _ => Icons.description_outlined,
    };

    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(icon, color: scheme.primary),
        title: Text(
          '${item.tipo} · ${item.solicitante}',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          '${item.rango}\n${item.etapa} · ${item.estado}'
          '${item.motivo.isNotEmpty ? '\nMotivo: ${item.motivo}' : ''}',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: onVer == null
            ? null
            : TextButton(
                onPressed: onVer,
                child: const Text('Ver'),
              ),
        onTap: onVer,
      ),
    );
  }
}

class _NotificacionTile extends StatelessWidget {
  const _NotificacionTile({required this.item, required this.onTap});

  final _Notificacion item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final icon = switch (item.tipo) {
      'incidencia_aprobada' => Icons.check_circle_outline,
      'incidencia_rechazada' => Icons.cancel_outlined,
      _ => Icons.pending_actions,
    };
    final color = switch (item.tipo) {
      'incidencia_aprobada' => Colors.green,
      'incidencia_rechazada' => scheme.error,
      _ => Colors.orange,
    };

    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(icon, color: color),
        title: Text(
          item.titulo,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          item.mensaje,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              item.fechaCorta,
              style: TextStyle(fontSize: 11, color: scheme.onSurfaceVariant),
            ),
            const SizedBox(height: 2),
            Text(
              item.leida ? 'Leída' : 'Marcar leída',
              style: TextStyle(fontSize: 10, color: scheme.primary),
            ),
          ],
        ),
        onTap: item.leida ? null : onTap,
      ),
    );
  }
}

class _Notificacion {
  _Notificacion({
    required this.id,
    required this.tipo,
    required this.titulo,
    required this.mensaje,
    required this.leida,
    required this.createdAt,
  });

  factory _Notificacion.fromJson(Map<String, dynamic> json) {
    return _Notificacion(
      id: (json['id'] as num?)?.toInt() ?? 0,
      tipo: json['tipo']?.toString() ?? '',
      titulo: json['titulo']?.toString() ?? '',
      mensaje: json['mensaje']?.toString() ?? '',
      leida: json['leida'] == true,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
    );
  }

  final int id;
  final String tipo;
  final String titulo;
  final String mensaje;
  final bool leida;
  final DateTime? createdAt;

  String get fechaCorta {
    final date = createdAt?.toLocal();
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }
}

class _IncidenciaPendiente {
  _IncidenciaPendiente({
    required this.id,
    required this.categoria,
    required this.tipo,
    required this.solicitante,
    required this.inicio,
    required this.fin,
    required this.motivo,
    required this.estado,
    required this.etapa,
  });

  factory _IncidenciaPendiente.fromJson(Map<String, dynamic> json) {
    return _IncidenciaPendiente(
      id: (json['id'] as num?)?.toInt() ?? 0,
      categoria: json['categoria']?.toString() ?? '',
      tipo: json['tipo']?.toString() ?? 'Incidencia',
      solicitante: json['solicitante']?.toString() ?? 'Sin solicitante',
      inicio: DateTime.tryParse(json['inicio']?.toString() ?? ''),
      fin: DateTime.tryParse(json['fin']?.toString() ?? ''),
      motivo: json['motivo']?.toString() ?? '',
      estado: json['estado']?.toString() ?? '',
      etapa: json['etapa']?.toString() ?? '',
    );
  }

  final int id;
  final String categoria;
  final String tipo;
  final String solicitante;
  final DateTime? inicio;
  final DateTime? fin;
  final String motivo;
  final String estado;
  final String etapa;

  String get rango {
    final desde = inicio?.toLocal();
    final hasta = fin?.toLocal();
    if (desde == null || hasta == null) return 'Sin fecha';

    final dia = '${_dos(desde.day)}/${_dos(desde.month)}/${desde.year}';
    final hora = '${_dos(desde.hour)}:${_dos(desde.minute)}';
    final horaFin = '${_dos(hasta.hour)}:${_dos(hasta.minute)}';

    if (desde.year == hasta.year &&
        desde.month == hasta.month &&
        desde.day == hasta.day) {
      return '$dia $hora a $horaFin';
    }
    return '$dia $hora a '
        '${_dos(hasta.day)}/${_dos(hasta.month)}/${hasta.year} $horaFin';
  }
}

String _dos(int value) => value.toString().padLeft(2, '0');
