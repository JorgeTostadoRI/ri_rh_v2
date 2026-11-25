import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/rh_colores.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/download_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/file_preview_viewmodel.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/document_preview.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/document_viewer_dialog.dart';

class ExpedienteFiles extends StatefulWidget {
  const ExpedienteFiles({
    super.key,
    required this.files,
    this.altaEmpleo,
    this.altaPracticante,
  });

  final BaseEmpleadoFiles files;
  final AltaEmpleo? altaEmpleo;
  final AltaPracticante? altaPracticante;

  @override
  State<ExpedienteFiles> createState() => _ExpedienteFilesState();
}

class _ExpedienteFilesState extends State<ExpedienteFiles> {
  late final DownloadViewmodel _downloadViewmodel;
  // Vive lo mismo que el expediente: cada archivo se baja una vez para la
  // vista previa y se reutiliza al volver a pasar el mouse.
  late final FilePreviewViewmodel _previewViewmodel;

  @override
  void initState() {
    super.initState();
    _downloadViewmodel = context.read<DownloadViewmodel>();
    _previewViewmodel = FilePreviewViewmodel(
      log: context.read(),
      fileDownloadService: context.read(),
    );
    _downloadViewmodel.downloadFile.addListener(_onDownload);
  }

  @override
  void didUpdateWidget(covariant ExpedienteFiles oldWidget) {
    _downloadViewmodel.downloadFile.removeListener(_onDownload);
    _downloadViewmodel.downloadFile.addListener(_onDownload);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _downloadViewmodel.downloadFile.removeListener(_onDownload);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconCard(
      icon: LucideIcons.fileText,
      title: 'Documentación',
      children: [
        _FileDisplay(name: 'INE/Identificación', url: widget.files.ineUrl, preview: _previewViewmodel),
        _FileDisplay(name: 'Acta de nacimiento', url: widget.files.actaNacimientoUrl, preview: _previewViewmodel),
        _FileDisplay(name: 'CURP', url: widget.files.curpUrl, preview: _previewViewmodel),
        _FileDisplay(name: 'NSS', url: widget.files.nssUrl, preview: _previewViewmodel),
        _FileDisplay(name: 'Curriculum Vitae', url: widget.files.cvUrl, preview: _previewViewmodel),
        _FileDisplay(name: 'Comprobante de domicilio', url: widget.files.domicilioUrl, preview: _previewViewmodel),
        _FileDisplay(name: 'Cuenta Bancaria', url: widget.files.estadoCuentaUrl, preview: _previewViewmodel),
        if (widget.altaEmpleo != null)
          ...[
            _FileDisplay(name: 'RFC', url: widget.altaEmpleo!.constanciaSituacionFiscalUrl, preview: _previewViewmodel),
            _FileDisplay(name: 'Alta IMSS', url: widget.altaEmpleo!.altaImssUrl, preview: _previewViewmodel),
            _FileDisplay(name: 'Aviso de Retención Infonavit', url: widget.altaEmpleo!.avisoInfonavitUrl, preview: _previewViewmodel),
            _FileDisplay(name: 'Constancia de estudio', url: widget.altaEmpleo!.constanciaEstudioUrl, preview: _previewViewmodel),
            _FileDisplay(name: 'Constancia de antecedentes penales', url: widget.altaEmpleo!.cartaNoAntecedentesPenalesUrl, preview: _previewViewmodel),
            _FileDisplay(name: 'Contrato Laboral', url: widget.altaEmpleo!.contratoLaboralUrl, preview: _previewViewmodel),
            _FileDisplay(name: 'Carta Oferta', url: widget.altaEmpleo!.cartaOfertaUrl, preview: _previewViewmodel),
            _FileDisplay(name: 'Examen Médico', url: widget.altaEmpleo!.examenMedicoUrl, preview: _previewViewmodel),
            _FileDisplay(name: 'Carta de Recomendación (1)', url: widget.altaEmpleo!.cartaRecomendacion1Url, preview: _previewViewmodel),
            _FileDisplay(name: 'Carta de Recomendación (2)', url: widget.altaEmpleo!.cartaRecomendacion2Url, preview: _previewViewmodel),
            _FileDisplay(name: 'Carta de Recomendación (3)', url: widget.altaEmpleo!.cartaRecomendacion3Url, preview: _previewViewmodel),
          ],
        if (widget.altaPracticante != null)
          ...[
            _FileDisplay(name: 'RFC', url: widget.altaPracticante!.rfcUrl, preview: _previewViewmodel),
            _FileDisplay(name: 'Carta Presentación', url: widget.altaPracticante!.cartaPresentacionUrl, preview: _previewViewmodel),
          ],
      ],
    );
  }

  void _onDownload() {
    if (_downloadViewmodel.downloadFile.completed) {
      _downloadViewmodel.downloadFile.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se ha descargado el archivo'),
        )
      );
    }
    else if (_downloadViewmodel.downloadFile.error) {
      final errorMessage = _downloadViewmodel.downloadFile.result.toString();
      _downloadViewmodel.downloadFile.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo descargar el archivo'),
          action: SnackBarAction(
            label: 'Detalles',
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Detalle de error'),
                content: Text(errorMessage),
              ),
            ),
          ),
          persist: false,
        )
      );
    }
  }
}

class _FileDisplay extends StatelessWidget {
  const _FileDisplay({
    required this.name,
    required this.url,
    required this.preview,
  });

  final String name;
  final String? url;
  final FilePreviewViewmodel preview;

  static BoxDecoration uploadedDecoration(RhColores c) => BoxDecoration(
    color: c.exitoSuave,
    border: Border.fromBorderSide(BorderSide(
      color: c.exitoFondo,
      width: 0.8,
    )),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );

  static BoxDecoration notUploadedDecoration(RhColores c) => BoxDecoration(
    color: c.superficieTenue,
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );

  TextStyle getLabelStyle(RhColores c, bool uploaded) {
    return TextStyle(
      fontSize: 11,
      fontWeight: .w700,
      color: uploaded ? c.exitoFuerte : c.etiqueta,
      height: 1.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    final downloadViewmodel = context.read<DownloadViewmodel>();
    final uploaded = url != null;

    void download() {
      final filename = url!.split('/').last;
      final params = DownloadFileParams(filename: filename, url: url!);
      downloadViewmodel.downloadFile.execute(params);
    }

    void openViewer() => showDocumentViewer(
      context,
      name: name,
      url: url!,
      viewmodel: preview,
      onDownload: download,
    );

    final tile = Container(
      decoration: uploaded ? uploadedDecoration(context.rh) : notUploadedDecoration(context.rh),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Flexible(
            child: Text(
              name,
              style: getLabelStyle(context.rh, uploaded),
              overflow: .ellipsis,
            ),
          ),
          if (uploaded)
            Row(
              mainAxisSize: .min,
              children: [
                IconButton(
                  tooltip: 'Ver documento',
                  onPressed: openViewer,
                  icon: Icon(
                    LucideIcons.eye,
                    color: context.rh.exitoFuerte,
                    size: 14,
                  ),
                ),
                IconButton(
                  tooltip: 'Descargar',
                  onPressed: download,
                  icon: Icon(
                    LucideIcons.download,
                    color: context.rh.exitoFuerte,
                    size: 14,
                  ),
                ),
              ],
            ),
        ],
      ),
    );

    if (!uploaded) return tile;
    return DocumentHoverPreview(
      name: name,
      url: url!,
      viewmodel: preview,
      // Además del botón del ojo, clic en el documento (o toque en el
      // celular) también lo abre en grande.
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: openViewer,
          child: tile,
        ),
      ),
    );
  }
}
