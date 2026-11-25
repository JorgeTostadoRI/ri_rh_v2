import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:ri_rh_v2/ui/core/themes/rh_colores.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/file_preview_viewmodel.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/document_preview.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Abre el documento en grande: todas las páginas del PDF (o la imagen) con
/// zoom. Usa el mismo archivo que ya se bajó para la vista previa.
Future<void> showDocumentViewer(
  BuildContext context, {
  required String name,
  required String url,
  required FilePreviewViewmodel viewmodel,
  required VoidCallback onDownload,
}) {
  return showDialog<void>(
    context: context,
    builder: (_) => DocumentViewerDialog(
      name: name,
      url: url,
      viewmodel: viewmodel,
      onDownload: onDownload,
    ),
  );
}

class DocumentViewerDialog extends StatefulWidget {
  const DocumentViewerDialog({
    super.key,
    required this.name,
    required this.url,
    required this.viewmodel,
    required this.onDownload,
  });

  final String name;
  final String url;
  final FilePreviewViewmodel viewmodel;
  final VoidCallback onDownload;

  /// Ancho máximo: en monitores grandes no tiene caso que la hoja sea más
  /// ancha que esto.
  static const maxWidth = 1100.0;

  @override
  State<DocumentViewerDialog> createState() => _DocumentViewerDialogState();
}

class _DocumentViewerDialogState extends State<DocumentViewerDialog> {
  late final Future<Result<FilePreview>> _future;

  final _pdfController = PdfViewerController();
  int? _page;
  int? _pageCount;

  final _imageController = TransformationController();
  Size _imageViewport = Size.zero;
  static const _imageMinScale = 0.5;
  static const _imageMaxScale = 8.0;

  @override
  void initState() {
    super.initState();
    _future = widget.viewmodel.load(widget.url);
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  /// El visor de PDF avisa cambios de página a veces en medio de un dibujo;
  /// ahí no se puede llamar setState directo.
  void _safeSetState(VoidCallback fn) {
    if (!mounted) return;
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(fn);
      });
    } else {
      setState(fn);
    }
  }

  // ---- Zoom de PDF ----

  void _pdfZoomIn() {
    if (_pdfController.isReady) _pdfController.zoomUp();
  }

  void _pdfZoomOut() {
    if (_pdfController.isReady) _pdfController.zoomDown();
  }

  void _pdfFit() {
    if (!_pdfController.isReady) return;
    _pdfController.setZoom(_pdfController.visibleRect.center, _pdfController.coverScale);
  }

  // ---- Zoom de imagen ----

  void _imageZoom(double factor) {
    final m = _imageController.value;
    final current = m.getMaxScaleOnAxis();
    final target = (current * factor).clamp(_imageMinScale, _imageMaxScale);
    final f = target / current;
    final center = _imageViewport.center(Offset.zero);
    final aroundCenter = Matrix4.identity()
      ..translateByDouble(center.dx, center.dy, 0, 1)
      ..scaleByDouble(f, f, 1, 1)
      ..translateByDouble(-center.dx, -center.dy, 0, 1);
    _imageController.value = aroundCenter * m;
  }

  void _imageFit() => _imageController.value = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    final c = context.rh;
    return Dialog(
      backgroundColor: c.superficie,
      insetPadding: EdgeInsets.all(esNavegadorMovil ? 8 : 24),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: DocumentViewerDialog.maxWidth),
        child: SizedBox.expand(
          child: FutureBuilder<Result<FilePreview>>(
            future: _future,
            builder: (context, snapshot) {
              final preview = switch (snapshot.data) {
                Ok<FilePreview>(:final value) => value,
                _ => null,
              };
              return Column(
                crossAxisAlignment: .stretch,
                children: [
                  _buildHeader(context, preview?.type),
                  Divider(height: 1, color: c.borde),
                  Expanded(
                    child: ColoredBox(
                      color: c.fondo,
                      child: _buildBody(snapshot.data, preview),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, FilePreviewType? type) {
    final c = context.rh;
    final isPdf = type == FilePreviewType.pdf;
    final isImage = type == FilePreviewType.image;
    final pageText = isPdf && _pageCount != null ? '${_page ?? 1} de $_pageCount' : null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      child: Row(
        spacing: 4,
        children: [
          Icon(LucideIcons.fileText, size: 18, color: c.etiqueta),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 15, fontWeight: .w700, color: c.titulo),
              overflow: .ellipsis,
            ),
          ),
          if (pageText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(pageText, style: TextStyle(fontSize: 13, color: c.etiqueta)),
            ),
          if (isPdf || isImage) ...[
            IconButton(
              tooltip: 'Alejar',
              icon: const Icon(LucideIcons.zoomOut, size: 18),
              onPressed: isPdf ? _pdfZoomOut : () => _imageZoom(1 / 1.25),
            ),
            IconButton(
              tooltip: 'Acercar',
              icon: const Icon(LucideIcons.zoomIn, size: 18),
              onPressed: isPdf ? _pdfZoomIn : () => _imageZoom(1.25),
            ),
            IconButton(
              tooltip: 'Ajustar a la ventana',
              icon: const Icon(LucideIcons.shrink, size: 18),
              onPressed: isPdf ? _pdfFit : _imageFit,
            ),
          ],
          IconButton(
            tooltip: 'Descargar',
            icon: Icon(LucideIcons.download, size: 18, color: c.exitoFuerte),
            onPressed: widget.onDownload,
          ),
          IconButton(
            tooltip: 'Cerrar',
            icon: const Icon(LucideIcons.x, size: 18),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(Result<FilePreview>? result, FilePreview? preview) {
    if (result == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (preview == null) {
      return const DocumentPreviewMessage(
        icon: LucideIcons.fileX,
        text: 'No se pudo cargar el documento',
      );
    }

    switch (preview.type) {
      case FilePreviewType.pdf:
        return PdfViewer.data(
          preview.bytes,
          sourceName: widget.url,
          controller: _pdfController,
          params: PdfViewerParams(
            backgroundColor: context.rh.fondo,
            margin: 16,
            onViewerReady: (document, controller) => _safeSetState(() {
              _pageCount = document.pages.length;
              _page = controller.pageNumber ?? 1;
            }),
            onPageChanged: (page) => _safeSetState(() => _page = page),
            loadingBannerBuilder: (_, _, _) => const Center(child: CircularProgressIndicator()),
            errorBannerBuilder: (_, _, _, _) => const DocumentPreviewMessage(
              icon: LucideIcons.fileX,
              text: 'No se pudo mostrar el archivo',
            ),
          ),
        );
      case FilePreviewType.image:
        return LayoutBuilder(
          builder: (context, constraints) {
            _imageViewport = constraints.biggest;
            return InteractiveViewer(
              transformationController: _imageController,
              minScale: _imageMinScale,
              maxScale: _imageMaxScale,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Image.memory(
                    preview.bytes,
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) => const DocumentPreviewMessage(
                      icon: LucideIcons.fileX,
                      text: 'No se pudo mostrar el archivo',
                    ),
                  ),
                ),
              ),
            );
          },
        );
      case FilePreviewType.unsupported:
        return const DocumentPreviewMessage(
          icon: LucideIcons.fileQuestionMark,
          text: 'No hay vista previa para este tipo de archivo.\nDescárgalo para verlo.',
        );
    }
  }
}
