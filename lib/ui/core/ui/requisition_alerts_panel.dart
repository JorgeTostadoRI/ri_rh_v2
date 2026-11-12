import 'dart:async';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

/// Botón y panel de "Avisos de requisiciones y órdenes".
///
/// Mismo diseño y comportamiento que el panel del frontend de Compras, pero
/// autocontenido: consulta `/api/messages/`, permite marcar como leído,
/// eliminar y abrir la requisición, orden de compra o solicitud de almacén
/// correspondiente en el frontend de Compras.
class RequisitionAlertsButton extends StatefulWidget {
  const RequisitionAlertsButton({
    super.key,
    required this.apiBaseUrl,
    required this.readToken,
    required this.comprasUrl,
    this.tooltip = 'Avisos de requisiciones y órdenes',
  });

  final String apiBaseUrl;
  final Future<String?> Function() readToken;

  /// Base del frontend de Compras, por ejemplo `https://host/RNTV/compras`.
  final String comprasUrl;

  final String tooltip;

  @override
  State<RequisitionAlertsButton> createState() =>
      _RequisitionAlertsButtonState();
}

class _RequisitionAlertsButtonState extends State<RequisitionAlertsButton> {
  Timer? _timer;
  bool _loading = false;
  int _unread = 0;

  String get _base => widget.apiBaseUrl.replaceFirst(RegExp(r'/+$'), '');

  @override
  void initState() {
    super.initState();
    _refreshUnread();
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _refreshUnread(),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _refreshUnread() async {
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
        '$_base/api/messages/no-leidos/',
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      if (!mounted) return;
      final data = response.data is Map
          ? Map<String, dynamic>.from(response.data as Map)
          : <String, dynamic>{};
      setState(() {
        _unread = (data['count'] as num?)?.toInt() ?? 0;
      });
    } catch (_) {
      // Sin conexión o sin sesión: se conserva el último valor.
    } finally {
      dio?.close();
      _loading = false;
    }
  }

  Future<void> _openPanel() async {
    await _refreshUnread();
    if (!mounted) return;

    await showRequisitionAlertsPanel(
      context,
      apiBaseUrl: _base,
      readToken: widget.readToken,
      comprasUrl: widget.comprasUrl,
    );

    if (mounted) await _refreshUnread();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: widget.tooltip,
      onPressed: _openPanel,
      icon: Badge.count(
        count: _unread,
        maxCount: 99,
        isLabelVisible: _unread > 0,
        child: const Icon(Icons.move_to_inbox_outlined),
      ),
    );
  }
}

Future<void> showRequisitionAlertsPanel(
  BuildContext context, {
  required String apiBaseUrl,
  required Future<String?> Function() readToken,
  required String comprasUrl,
}) {
  final width = math.min(MediaQuery.sizeOf(context).width * 0.92, 440.0);
  final height = math.min(MediaQuery.sizeOf(context).height * 0.7, 460.0);

  return showDialog<void>(
    context: context,
    builder: (_) => Dialog(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: width,
        height: height,
        child: RequisitionAlertsPanel(
          apiBaseUrl: apiBaseUrl,
          readToken: readToken,
          comprasUrl: comprasUrl,
        ),
      ),
    ),
  );
}

class RequisitionAlertsPanel extends StatefulWidget {
  const RequisitionAlertsPanel({
    super.key,
    required this.apiBaseUrl,
    required this.readToken,
    required this.comprasUrl,
  });

  final String apiBaseUrl;
  final Future<String?> Function() readToken;
  final String comprasUrl;

  @override
  State<RequisitionAlertsPanel> createState() => _RequisitionAlertsPanelState();
}

class _RequisitionAlertsPanelState extends State<RequisitionAlertsPanel> {
  bool _isLoading = true;
  bool _hasError = false;
  List<_Alerta> _alertas = [];

  String get _base => widget.apiBaseUrl.replaceFirst(RegExp(r'/+$'), '');

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<String?> _token() => widget.readToken();

  Future<void> _load() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    Dio? dio;
    try {
      final token = await _token();
      if (token == null || token.isEmpty) {
        throw Exception('Sin sesión');
      }

      dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
      final response = await dio.get(
        '$_base/api/messages/?tipo=mensaje',
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      final items = response.data is List ? response.data as List : const [];
      if (!mounted) return;
      setState(() {
        _alertas = items
            .whereType<Map>()
            .map((item) => _Alerta.fromJson(Map<String, dynamic>.from(item)))
            .toList();
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    } finally {
      dio?.close();
    }
  }

  Future<bool> _marcarLeido(_Alerta alerta) async {
    final token = await _token();
    if (token == null || token.isEmpty) return false;

    Dio? dio;
    try {
      dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
      await dio.patch(
        '$_base/api/messages/${alerta.id}/',
        data: {'leido': true},
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      return true;
    } catch (_) {
      return false;
    } finally {
      dio?.close();
    }
  }

  Future<void> _eliminar(_Alerta alerta) async {
    final token = await _token();
    if (token == null || token.isEmpty) return;

    Dio? dio;
    try {
      dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
      await dio.delete(
        '$_base/api/messages/${alerta.id}/',
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      if (!mounted) return;
      setState(() {
        _alertas = _alertas.where((item) => item.id != alerta.id).toList();
      });
    } catch (_) {
      // Se conserva para reintentar.
    } finally {
      dio?.close();
    }
  }

  Future<void> _confirmarEliminarTodos() async {
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (builder) => AlertDialog(
        title: const Text('Eliminar avisos'),
        content: const Text('¿Estás seguro de eliminar todos los avisos?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(builder, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(builder, true),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
    if (confirmado != true || !mounted) return;

    final token = await _token();
    if (token == null || token.isEmpty) return;

    Dio? dio;
    try {
      dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
      for (final alerta in List.of(_alertas)) {
        await dio.delete(
          '$_base/api/messages/${alerta.id}/',
          options: Options(headers: {'Authorization': 'Token $token'}),
        );
      }
      if (!mounted) return;
      setState(() => _alertas = []);
    } catch (_) {
      if (mounted) await _load();
    } finally {
      dio?.close();
    }
  }

  String _etiquetaAbrir(_Alerta alerta) {
    return switch (alerta.referenciaTipo) {
      'requisicion' => 'Abrir requisición',
      'orden_compra' => 'Abrir orden',
      'solicitud_almacen' => 'Abrir solicitud',
      _ => 'Abrir',
    };
  }

  bool get _puedeAbrir => widget.comprasUrl.trim().isNotEmpty;

  String _urlAbrir(_Alerta alerta) {
    final base = widget.comprasUrl.replaceFirst(RegExp(r'/+$'), '');
    if (base.isEmpty || alerta.referenciaId == null) return '';
    return switch (alerta.referenciaTipo) {
      'requisicion' => '$base/requisiciones/${alerta.referenciaId}',
      'orden_compra' => '$base/ordenes/${alerta.referenciaId}',
      'solicitud_almacen' => '$base/solicitudes/${alerta.referenciaId}',
      _ => '',
    };
  }

  Future<void> _abrir(_Alerta alerta) async {
    await _marcarLeido(alerta);
    if (!mounted) return;
    setState(() {
      final index = _alertas.indexWhere((item) => item.id == alerta.id);
      if (index != -1) _alertas[index].leido = true;
    });

    final url = _urlAbrir(alerta);
    if (url.isEmpty) return;

    final uri = Uri.tryParse(url);
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

  Future<void> _openMessage(_Alerta alerta) async {
    final leido = await _marcarLeido(alerta);
    if (leido && mounted) {
      setState(() {
        final index = _alertas.indexWhere((item) => item.id == alerta.id);
        if (index != -1) _alertas[index].leido = true;
      });
    }
    if (!mounted) return;

    final title = alerta.titulo.trim().isEmpty ? 'Aviso' : alerta.titulo;
    final scheme = Theme.of(context).colorScheme;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (alerta.de != null) ...[
                Text(
                  'De: ${alerta.de}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              Text(alerta.mensaje),
              const SizedBox(height: 12),
              Text(
                DateFormat('dd/MM/yyyy HH:mm').format(alerta.createdAt),
                style: TextStyle(fontSize: 11, color: scheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
        actions: [
          if (_puedeAbrir && _urlAbrir(alerta).isNotEmpty)
            FilledButton.icon(
              onPressed: () {
                Navigator.pop(dialogContext);
                _abrir(alerta);
              },
              icon: const Icon(Icons.open_in_new, size: 16),
              label: Text(_etiquetaAbrir(alerta)),
            ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cerrar'),
          ),
          FilledButton(
            onPressed: () async {
              await _eliminar(alerta);
              if (dialogContext.mounted) Navigator.pop(dialogContext);
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final unread = _alertas.where((item) => !item.leido).length;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Avisos de requisiciones y órdenes',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    if (unread > 0 && !_hasError)
                      Text(
                        '$unread sin leer',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: scheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Actualizar avisos',
                visualDensity: VisualDensity.compact,
                onPressed: _isLoading ? null : _load,
                icon: const Icon(Icons.refresh, size: 18),
              ),
              IconButton(
                tooltip: 'Eliminar todos los avisos',
                visualDensity: VisualDensity.compact,
                onPressed: _alertas.isEmpty ? null : _confirmarEliminarTodos,
                icon: const Icon(Icons.delete_outline, size: 18),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Flexible(child: _buildBody(theme)),
      ],
    );
  }

  Widget _buildBody(ThemeData theme) {
    if (_isLoading && _alertas.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(strokeWidth: 2.4),
          ),
        ),
      );
    }

    if (_hasError) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 40),
            const SizedBox(height: 12),
            const Text('No se pudieron cargar los avisos.'),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _load,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (_alertas.isEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        child: Text(
          'No tienes avisos por ahora.',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
      );
    }

    final scheme = theme.colorScheme;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 4),
      shrinkWrap: true,
      itemCount: _alertas.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        indent: 16,
        endIndent: 16,
        color: scheme.outlineVariant.withValues(alpha: 0.5),
      ),
      itemBuilder: (context, index) {
        final alerta = _alertas[index];
        final title = alerta.titulo.trim().isNotEmpty ? alerta.titulo : 'Aviso';

        return InkWell(
          onTap: () => _openMessage(alerta),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        alerta.leido ? scheme.outlineVariant : scheme.primary,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight:
                              alerta.leido ? FontWeight.w500 : FontWeight.w700,
                        ),
                      ),
                      if (alerta.mensaje.trim().isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          alerta.mensaje,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                      if (alerta.de != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          'De: ${alerta.de}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  DateFormat('dd/MM HH:mm').format(alerta.createdAt),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Alerta {
  _Alerta({
    required this.id,
    required this.titulo,
    required this.mensaje,
    required this.leido,
    required this.referenciaTipo,
    required this.referenciaId,
    required this.createdAt,
    this.de,
  });

  factory _Alerta.fromJson(Map<String, dynamic> json) {
    final rawReferenciaId = json['referencia_id'] is num
        ? (json['referencia_id'] as num).toInt()
        : int.tryParse('${json['referencia_id'] ?? ''}');

    var referenciaTipo = (json['referencia_tipo'] ?? '').toString();
    var referenciaId = rawReferenciaId;

    if (referenciaTipo.isEmpty || referenciaId == null) {
      final text = '${json['title'] ?? ''} ${json['message'] ?? ''}';
      final rc = RegExp(r'RC[_\s#-]*(\d+)', caseSensitive: false)
          .firstMatch(text);
      final oc = RegExp(r'OC[_\s#-]*(\d+)', caseSensitive: false)
          .firstMatch(text);
      final sol = RegExp(r'SOL[_\s#-]*(\d+)', caseSensitive: false)
          .firstMatch(text);
      if (sol != null) {
        referenciaTipo = 'solicitud_almacen';
        referenciaId = int.tryParse(sol.group(1)!);
      } else if (rc != null) {
        referenciaTipo = 'requisicion';
        referenciaId = int.tryParse(rc.group(1)!);
      } else if (oc != null) {
        referenciaTipo = 'orden_compra';
        referenciaId = int.tryParse(oc.group(1)!);
      }
    }

    final fromUser = json['from_user'];
    String? de;
    if (fromUser is Map) {
      de = (fromUser['nombre'] ?? fromUser['username'])?.toString();
    }

    return _Alerta(
      id: (json['id'] as num?)?.toInt() ?? 0,
      titulo: json['title']?.toString() ?? '',
      mensaje: json['message']?.toString() ?? '',
      leido: json['leido'] == true,
      referenciaTipo: referenciaTipo,
      referenciaId: referenciaId,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ??
          DateTime.now(),
      de: de,
    );
  }

  final int id;
  final String titulo;
  final String mensaje;
  bool leido;
  final String referenciaTipo;
  final int? referenciaId;
  final DateTime createdAt;
  final String? de;
}
