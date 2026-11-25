import 'dart:async';

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
  static const _minWidth = 320.0;

  /// Lo que ocupa la tarjeta además de la página: relleno, nombre del
  /// documento y el "1 de N páginas".
  static const _chromeHeight = 76.0;
  static const _chromeWidth = 24.0;

  /// Proporción ancho/alto de una hoja carta.
  static const _letterRatio = 8.5 / 11;

  /// Tamaño de la tarjeta: casi todo el alto de la ventana (hasta
  /// [_maxHeight]) y el ancho de una hoja carta de ese alto, para que el texto
  /// del documento se alcance a leer. Si a los lados no cabe tan ancha, se
  /// angosta hasta lo que haya (sin bajar de [_minWidth]).
  @visibleForTesting
  static Size previewSize(Size screen, {required double availableWidth}) {
    final height = (screen.height - 2 * _margin).clamp(0.0, _maxHeight);
    final idealWidth = (height - _chromeHeight) * _letterRatio + _chromeWidth;
    final maxWidth = availableWidth < _minWidth ? screen.width - 2 * _margin : availableWidth;
    return Size(idealWidth.clamp(0.0, maxWidth.clamp(0.0, double.infinity)), height);
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

  void _onExit(PointerExitEvent _) {
    _timer?.cancel();
    if (_portal.isShowing) _portal.hide();
  }

  @override
  Widget build(BuildContext context) {
    if (esNavegadorMovil) return widget.child;

    return OverlayPortal(
      controller: _portal,
      overlayChildBuilder: _buildOverlay,
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        child: widget.child,
      ),
    );
  }

  Widget _buildOverlay(BuildContext overlayContext) {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.attached) return const SizedBox.shrink();

    final screen = MediaQuery.sizeOf(overlayContext);
    final rect = box.localToGlobal(Offset.zero) & box.size;
    const gap = DocumentHoverPreview._gap;
    const margin = DocumentHoverPreview._margin;

    final spaceLeft = rect.left - gap - margin;
    final spaceRight = screen.width - margin - rect.right - gap;
    final size = DocumentHoverPreview.previewSize(
      screen,
      availableWidth: spaceLeft > spaceRight ? spaceLeft : spaceRight,
    );
    final w = size.width;
    final h = size.height;

    // A la izquierda del documento; si no cabe, a la derecha; si tampoco,
    // pegada a la orilla de la pantalla.
    double left = rect.left - gap - w;
    if (left < margin) {
      left = rect.right + gap;
      if (left + w > screen.width - margin) {
        left = (screen.width - w - margin).clamp(margin, double.infinity);
      }
    }
    final maxTop = (screen.height - h - margin).clamp(margin, double.infinity);
    final top = (rect.center.dy - h / 2).clamp(margin, maxTop);

    return Positioned(
      left: left,
      top: top,
      width: w,
      height: h,
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
                    Error<FilePreview>() => const _PreviewMessage(
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

  static const _error = _PreviewMessage(
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
        return const _PreviewMessage(
          icon: LucideIcons.fileQuestionMark,
          text: 'No hay vista previa para este tipo de archivo',
        );
    }
  }
}

class _PreviewMessage extends StatelessWidget {
  const _PreviewMessage({required this.icon, required this.text});

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
