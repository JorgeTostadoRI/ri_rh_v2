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
///
/// El aviso se abre en una pestaña nueva (web) o en el navegador externo
/// (escritorio/móvil). Si el navegador bloquea la pestaña y se recibió
/// [RequisitionAlertsButton.onOpen], se navega dentro de la app como respaldo.
class RequisitionAlertsButton extends StatefulWidget {
  const RequisitionAlertsButton({
    super.key,
    required this.apiBaseUrl,
    required this.readToken,
    required this.comprasUrl,
    this.tooltip = 'Avisos de requisiciones y órdenes',
    this.onOpen,
  });

  final String apiBaseUrl;
  final Future<String?> Function() readToken;

  /// Base del frontend de Compras, por ejemplo `https://host/RNTV/compras`.
  final String comprasUrl;

  final String tooltip;
  final Future<void> Function(String tipo, int id)? onOpen;

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
      onOpen: widget.onOpen,
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
  Future<void> Function(String tipo, int id)? onOpen,
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
          onOpen: onOpen,
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
    this.onOpen,
  });

  final String apiBaseUrl;
  final Future<String?> Function() readToken;
  final String comprasUrl;

  /// Navegación interna opcional. Se usa como respaldo cuando el navegador
  /// bloquea la pestaña nueva o cuando no hay URL del frontend de Compras
  /// (por ejemplo en escritorio/móvil o en desarrollo local).
  final Future<void> Function(String tipo, int id)? onOpen;

  @override
  State<RequisitionAlertsPanel> createState() => _RequisitionAlertsPanelState();
}

class _RequisitionAlertsPanelState extends State<RequisitionAlertsPanel>
    with SingleTickerProviderStateMixin {
  static const int _limitePorTab = 200;

  bool _isLoading = true;
  bool _hasError = false;
  List<_Alerta> _noLeidas = [];
  List<_Alerta> _leidas = [];
  int _unread = 0;
  bool _hayMasNoLeidas = false;
  bool _hayMasLeidas = false;
  late final TabController _tabController;

  String get _base => widget.apiBaseUrl.replaceFirst(RegExp(r'/+$'), '');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
      final headers = {'Authorization': 'Token $token'};
      final respuestas = await Future.wait([
        dio.get(
          '$_base/api/messages/?tipo=mensaje&leido=false&limit=$_limitePorTab',
          options: Options(headers: headers),
        ),
        dio.get(
          '$_base/api/messages/?tipo=mensaje&leido=true&limit=$_limitePorTab',
          options: Options(headers: headers),
        ),
        dio.get(
          '$_base/api/messages/no-leidos/',
          options: Options(headers: headers),
        ),
      ]);
      final noLeidasRaw =
          respuestas[0].data is List ? respuestas[0].data as List : const [];
      final leidasRaw =
          respuestas[1].data is List ? respuestas[1].data as List : const [];
      final contador = respuestas[2].data is Map
          ? Map<String, dynamic>.from(respuestas[2].data as Map)
          : <String, dynamic>{};
      if (!mounted) return;
      setState(() {
        _noLeidas = _parseAlertas(noLeidasRaw);
        _leidas = _parseAlertas(leidasRaw);
        _hayMasNoLeidas = noLeidasRaw.length >= _limitePorTab;
        _hayMasLeidas = leidasRaw.length >= _limitePorTab;
        _unread = (contador['count'] as num?)?.toInt() ?? _noLeidas.length;
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

  List<_Alerta> _parseAlertas(List items) {
    return items
        .whereType<Map>()
        .map((item) => _Alerta.fromJson(Map<String, dynamic>.from(item)))
        .toList();
  }

  void _moverALeidas(_Alerta alerta) {
    if (!mounted) return;
    final estabaSinLeer = _noLeidas.any((item) => item.id == alerta.id);
    setState(() {
      _noLeidas = _noLeidas.where((item) => item.id != alerta.id).toList();
      alerta.leido = true;
      if (!_leidas.any((item) => item.id == alerta.id)) {
        _leidas.insert(0, alerta);
        if (_leidas.length > _limitePorTab) _leidas.removeLast();
      }
      if (estabaSinLeer && _unread > 0) _unread -= 1;
    });
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
        final estabaSinLeer = _noLeidas.any((item) => item.id == alerta.id);
        _noLeidas = _noLeidas.where((item) => item.id != alerta.id).toList();
        _leidas = _leidas.where((item) => item.id != alerta.id).toList();
        if (estabaSinLeer && _unread > 0) _unread -= 1;
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
        content: const Text(
          '¿Eliminar todos los avisos de requisiciones y órdenes? '
          'Esta acción no se puede deshacer.',
        ),
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
      await dio.delete(
        '$_base/api/messages/eliminar-todos/',
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      if (!mounted) return;
      setState(() {
        _noLeidas = [];
        _leidas = [];
        _unread = 0;
        _hayMasNoLeidas = false;
        _hayMasLeidas = false;
      });
    } catch (_) {
      if (mounted) await _load();
    } finally {
      dio?.close();
    }
  }

  Future<void> _marcarTodosLeidos() async {
    if (_unread == 0) return;

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
      await dio.post(
        '$_base/api/messages/marcar-todos-leidos/',
        options: Options(headers: {'Authorization': 'Token $token'}),
      );
      if (!mounted) return;
      setState(() {
        final ahoraLeidas = _noLeidas.map((alerta) {
          alerta.leido = true;
          return alerta;
        }).toList();
        _leidas = [...ahoraLeidas, ..._leidas];
        if (_leidas.length > _limitePorTab) {
          _leidas = _leidas.take(_limitePorTab).toList();
        }
        _noLeidas = [];
        _unread = 0;
        _hayMasNoLeidas = false;
      });
      _tabController.animateTo(1);
      if (mounted) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          const SnackBar(content: Text('Avisos marcados como leídos.')),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          const SnackBar(
            content: Text('No se pudieron marcar los avisos como leídos.'),
          ),
        );
      }
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

  bool get _puedeAbrir =>
      widget.comprasUrl.trim().isNotEmpty || widget.onOpen != null;

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

  Future<void> _navegarInterno(String tipo, int id) async {
    try {
      await widget.onOpen!(tipo, id);
    } catch (_) {
      // Si la navegación interna falla, se conserva el aviso y se ignora.
    }
  }

  /// Marca el aviso como leído en la lista y sincroniza con el backend sin
  /// bloquear al usuario (se usa cuando ya se abrió la pestaña nueva).
  void _marcarLeidaLocal(_Alerta alerta) {
    _moverALeidas(alerta);
    unawaited(_marcarLeido(alerta));
  }

  /// Abre el destino del aviso en una pestaña nueva (web) o en el navegador
  /// externo. Debe invocarse desde el gesto del usuario: si se espera una
  /// petición antes, el navegador bloquea la pestaña emergente.
  Future<bool> _abrirEnPestana(_Alerta alerta) async {
    final url = _urlAbrir(alerta);
    if (url.isEmpty) return false;

    final uri = Uri.tryParse(url);
    if (uri == null) return false;

    try {
      return kIsWeb
          ? await launchUrl(uri, webOnlyWindowName: '_blank')
          : await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // Sin navegador disponible: se intenta la navegación interna.
      return false;
    }
  }

  void _avisarBloqueo() {
    if (!mounted) return;
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      const SnackBar(
        content: Text(
          'No se pudo abrir la pestaña. Permite las ventanas emergentes '
          'para este sitio.',
        ),
      ),
    );
  }

  Future<void> _abrir(_Alerta alerta) async {
    // Web: la pestaña se abre dentro del gesto del usuario, antes de cualquier
    // espera, para que el navegador no la bloquee.
    if (kIsWeb && await _abrirEnPestana(alerta)) {
      _marcarLeidaLocal(alerta);
      return;
    }

    await _marcarLeido(alerta);
    if (!mounted) return;
    _moverALeidas(alerta);

    final referenciaId = alerta.referenciaId;
    if (referenciaId == null) return;

    if (widget.onOpen != null) {
      await _navegarInterno(alerta.referenciaTipo, referenciaId);
      return;
    }

    // En web un segundo intento después de la espera ya no tiene el gesto del
    // usuario, así que el navegador lo bloquearía de nuevo.
    if (kIsWeb || !await _abrirEnPestana(alerta)) {
      _avisarBloqueo();
    }
  }

  Future<void> _openMessage(_Alerta alerta) async {
    final leido = await _marcarLeido(alerta);
    if (leido && mounted) {
      _moverALeidas(alerta);
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
          if (_puedeAbrir && alerta.referenciaId != null)
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

    return Column(
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
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_unread > 0 && !_hasError)
                      Text(
                        '$_unread sin leer',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: scheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Marcar todos como leídos',
                visualDensity: VisualDensity.compact,
                onPressed:
                    _isLoading || _unread == 0 ? null : _marcarTodosLeidos,
                icon: const Icon(Icons.done_all, size: 18),
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
                onPressed: _noLeidas.isEmpty && _leidas.isEmpty
                    ? null
                    : _confirmarEliminarTodos,
                icon: const Icon(Icons.delete_outline, size: 18),
              ),
            ],
          ),
        ),
        TabBar(
          controller: _tabController,
          labelStyle: theme.textTheme.labelMedium,
          tabs: [
            Tab(text: _unread > 0 ? 'Sin leer ($_unread)' : 'Sin leer'),
            const Tab(text: 'Leídas'),
          ],
        ),
        const Divider(height: 1),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildLista(
                theme,
                _noLeidas,
                vacio: 'No tienes avisos sin leer.',
                hayMas: _hayMasNoLeidas,
              ),
              _buildLista(
                theme,
                _leidas,
                vacio: 'Todavía no hay avisos leídos.',
                hayMas: _hayMasLeidas,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLista(
    ThemeData theme,
    List<_Alerta> alertas, {
    required String vacio,
    required bool hayMas,
  }) {
    if (_isLoading && _noLeidas.isEmpty && _leidas.isEmpty) {
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

    if (alertas.isEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        child: Text(
          vacio,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    final scheme = theme.colorScheme;

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: alertas.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              indent: 16,
              endIndent: 16,
              color: scheme.outlineVariant.withValues(alpha: 0.5),
            ),
            itemBuilder: (context, index) {
              final alerta = alertas[index];
              final title =
                  alerta.titulo.trim().isNotEmpty ? alerta.titulo : 'Aviso';

              return InkWell(
                onTap: () => _openMessage(alerta),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: alerta.leido
                              ? scheme.outlineVariant
                              : scheme.primary,
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
                                fontWeight: alerta.leido
                                    ? FontWeight.w500
                                    : FontWeight.w700,
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
          ),
        ),
        if (hayMas)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Text(
              'Mostrando los $_limitePorTab más recientes.',
              style: theme.textTheme.labelSmall?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
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
      final rc = RegExp(
        r'RC[_\s#-]*(\d+)',
        caseSensitive: false,
      ).firstMatch(text);
      final oc = RegExp(
        r'OC[_\s#-]*(\d+)',
        caseSensitive: false,
      ).firstMatch(text);
      final sol = RegExp(
        r'SOL[_\s#-]*(\d+)',
        caseSensitive: false,
      ).firstMatch(text);
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
