import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:ri_rh_v2/ui/core/themes/rh_colores.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/file_preview_viewmodel.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Muestra una vista previa flotante del documento cuando el mouse se queda un
/// momento encima de [child]. Sale a la izquierda (o a la derecha si no cabe).
///
/// En el navegador del celular no hay mouse, así que ahí no hace nada.
class DocumentHoverPreview extends StatefulWidget {
  const DocumentHoverPreview({
    super.key,
    required this.name,
    required this.url,
    required this.viewmodel,
    required this.child,
  });

  final String name;
  final String url;
  final FilePreviewViewmodel viewmodel;
  final Widget child;

  /// Cuánto tiempo hay que dejar el mouse encima antes de mostrarla, para que
  /// no salgan vistas previas al solo pasar por la lista.
  static const hoverDelay = Duration(milliseconds: 450);

  static const _gap = 12.0;
  static const _margin = 16.0;
  static const _maxHeight = 900.0;

  /// Si la hoja se vería más angosta que esto, mejor no se muestra (para eso
  /// está el botón de "Ver documento").
  static const _minPageWidth = 160.0;

  /// Lo que ocupa la tarjeta además de la página: relleno, nombre del
  /// documento y el "1 de N páginas".
  static const _chromeHeight = 76.0;
  static const _chromeWidth = 24.0;

  /// Proporción ancho/alto de una hoja carta.
  static const _letterRatio = 8.5 / 11;

  /// Dónde va la tarjeta, sin encimarse nunca sobre el documento [anchor]
  /// (su nombre y sus botones de ver y descargar).
  ///
  /// Prueba a la izquierda, a la derecha, abajo y arriba del documento, y se
  /// queda con el lugar donde la hoja se ve más grande (a la izquierda si
  /// empatan). En cada lugar usa todo el alto que haya (hasta [_maxHeight]) en
  /// proporción de hoja carta, para que el texto se alcance a leer.
  ///
  /// Regresa `null` si en ningún lado cabe una vista útil.
  @visibleForTesting
  static Rect? previewRect(Size screen, Rect anchor) {
    const m = _margin;
    const g = _gap;

    double clampY(double y, double h) => y.clamp(m, math.max(m, screen.height - m - h));
    double clampX(double x, double w) => x.clamp(m, math.max(m, screen.width - m - w));

    final fullWidth = screen.width - 2 * m;
    final fullHeight = screen.height - 2 * m;

    final candidates = <Rect?>[
      // Izquierda
      _fit(anchor.left - g - m, fullHeight, (s) => Rect.fromLTWH(
        anchor.left - g - s.width, clampY(anchor.center.dy - s.height / 2, s.height), s.width, s.height)),
      // Derecha
      _fit(screen.width - m - anchor.right - g, fullHeight, (s) => Rect.fromLTWH(
        anchor.right + g, clampY(anchor.center.dy - s.height / 2, s.height), s.width, s.height)),
      // Abajo
      _fit(fullWidth, screen.height - m - anchor.bottom - g, (s) => Rect.fromLTWH(
        clampX(anchor.center.dx - s.width / 2, s.width), anchor.bottom + g, s.width, s.height)),
      // Arriba
      _fit(fullWidth, anchor.top - g - m, (s) => Rect.fromLTWH(
        clampX(anchor.center.dx - s.width / 2, s.width), anchor.top - g - s.height, s.width, s.height)),
    ];

    Rect? best;
    for (final rect in candidates) {
      if (rect == null) continue;
      if (best == null || rect.width > best.width) best = rect;
    }
    if (best == null || best.width - _chromeWidth < _minPageWidth) return null;
    return best;
  }

  /// La tarjeta más grande con proporción de hoja carta que cabe en
  /// [maxWidth] × [maxHeight], ya acomodada con [place].
  static Rect? _fit(double maxWidth, double maxHeight, Rect Function(Size) place) {
    var height = math.min(maxHeight, _maxHeight);
    if (maxWidth <= _chromeWidth || height <= _chromeHeight) return null;
    final idealWidth = (height - _chromeHeight) * _letterRatio + _chromeWidth;
    final width = math.min(idealWidth, maxWidth);
    // Si quedó más angosta, tampoco tiene caso que sea tan alta.
    height = math.min(height, (width - _chromeWidth) / _letterRatio + _chromeHeight);
    return place(Size(width, height));
  }

  @override
  State<DocumentHoverPreview> createState() => _DocumentHoverPreviewState();
}

class _DocumentHoverPreviewState extends State<DocumentHoverPreview> {
  final _portal = OverlayPortalController();
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onEnter(PointerEnterEvent _) {
    _timer?.cancel();
    _timer = Timer(DocumentHoverPreview.hoverDelay, () {
      if (mounted) _portal.show();
    });
  }

  void _hide() {
    _timer?.cancel();
    if (_portal.isShowing) _portal.hide();
  }

  @override
  Widget build(BuildContext context) {
    if (esNavegadorMovil) return widget.child;

    return OverlayPortal(
      controller: _portal,
      overlayChildBuilder: _buildOverlay,
      // Al hacer clic (abrir el visor o descargar) se quita la vista previa.
      child: Listener(
        onPointerDown: (_) => _hide(),
        child: MouseRegion(
          onEnter: _onEnter,
          onExit: (_) => _hide(),
          child: widget.child,
        ),
      ),
    );
  }

  Widget _buildOverlay(BuildContext overlayContext) {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.attached) return const SizedBox.shrink();

    final screen = MediaQuery.sizeOf(overlayContext);
    final anchor = box.localToGlobal(Offset.zero) & box.size;
    final rect = DocumentHoverPreview.previewRect(screen, anchor);
    if (rect == null) return const SizedBox.shrink();

    return Positioned.fromRect(
      rect: rect,
      // Solo se ve; no estorba al mouse.
      child: IgnorePointer(
        child: DocumentPreviewCard(
          name: widget.name,
          url: widget.url,
          viewmodel: widget.viewmodel,
        ),
      ),
    );
  }
}

/// Tarjeta con el nombre del documento y su vista previa (imagen o primera
/// página del PDF).
class DocumentPreviewCard extends StatefulWidget {
  const DocumentPreviewCard({
    super.key,
    required this.name,
    required this.url,
    required this.viewmodel,
  });

  final String name;
  final String url;
  final FilePreviewViewmodel viewmodel;

  @override
  State<DocumentPreviewCard> createState() => _DocumentPreviewCardState();
}

class _DocumentPreviewCardState extends State<DocumentPreviewCard> {
  late Future<Result<FilePreview>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.viewmodel.load(widget.url);
  }

  @override
  void didUpdateWidget(covariant DocumentPreviewCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _future = widget.viewmodel.load(widget.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rh;

    return Material(
      color: c.superficie,
      elevation: 8,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 8,
          children: [
            Text(
              widget.name,
              style: TextStyle(fontSize: 12, fontWeight: .w700, color: c.titulo),
              overflow: .ellipsis,
            ),
            Expanded(
              child: FutureBuilder<Result<FilePreview>>(
                future: _future,
                builder: (context, snapshot) {
                  final result = snapshot.data;
                  if (result == null) {
                    return const Center(
                      child: SizedBox.square(
                        dimension: 28,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      ),
                    );
                  }
                  return switch (result) {
                    Error<FilePreview>() => const DocumentPreviewMessage(
                        icon: LucideIcons.fileX,
                        text: 'No se pudo cargar la vista previa',
                      ),
                    Ok<FilePreview>(:final value) => _PreviewContent(
                        preview: value,
                        sourceName: widget.url,
                      ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewContent extends StatelessWidget {
  const _PreviewContent({required this.preview, required this.sourceName});

  final FilePreview preview;
  final String sourceName;

  static const _error = DocumentPreviewMessage(
    icon: LucideIcons.fileX,
    text: 'No se pudo mostrar el archivo',
  );

  @override
  Widget build(BuildContext context) {
    switch (preview.type) {
      case FilePreviewType.image:
        return Image.memory(
          preview.bytes,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) => _error,
        );
      case FilePreviewType.pdf:
        return PdfDocumentViewBuilder(
          documentRef: PdfDocumentRefData(preview.bytes, sourceName: sourceName),
          loadingBuilder: (_) => const Center(
            child: SizedBox.square(
              dimension: 28,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ),
          errorBuilder: (_, _, _) => _error,
          builder: (context, document) {
            if (document == null || document.pages.isEmpty) {
              return const SizedBox.shrink();
            }
            final total = document.pages.length;
            return Column(
              spacing: 6,
              children: [
                Expanded(
                  child: PdfPageView(
                    document: document,
                    pageNumber: 1,
                    // Suficiente para que las letras se vean nítidas al
                    // tamaño de la tarjeta, también en pantallas con zoom.
                    maximumDpi: 200,
                  ),
                ),
                Text(
                  total == 1 ? '1 página' : '1 de $total páginas',
                  style: TextStyle(fontSize: 11, color: context.rh.etiqueta),
                ),
              ],
            );
          },
        );
      case FilePreviewType.unsupported:
        return const DocumentPreviewMessage(
          icon: LucideIcons.fileQuestionMark,
          text: 'No hay vista previa para este tipo de archivo',
        );
    }
  }
}

class DocumentPreviewMessage extends StatelessWidget {
  const DocumentPreviewMessage({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final c = context.rh;
    return Center(
      child: Column(
        mainAxisSize: .min,
        spacing: 8,
        children: [
          Icon(icon, color: c.etiqueta, size: 28),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: c.etiqueta),
          ),
        ],
      ),
    );
  }
}
