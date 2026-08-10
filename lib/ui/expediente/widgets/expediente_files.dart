import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/download_viewmodel.dart';

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

  @override
  void initState() {
    super.initState();
    _downloadViewmodel = context.read<DownloadViewmodel>();
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
        _FileDisplay(name: 'INE/Identificación', url: widget.files.ineUrl),
        _FileDisplay(name: 'Acta de nacimiento', url: widget.files.actaNacimientoUrl),
        _FileDisplay(name: 'CURP', url: widget.files.curpUrl),
        _FileDisplay(name: 'NSS', url: widget.files.nssUrl),
        _FileDisplay(name: 'Curriculum Vitae', url: widget.files.cvUrl),
        _FileDisplay(name: 'Comprobante de domicilio', url: widget.files.domicilioUrl),
        _FileDisplay(name: 'Cuenta Bancaria', url: widget.files.estadoCuentaUrl),
        if (widget.altaEmpleo != null)
          ...[
            _FileDisplay(name: 'RFC', url: widget.altaEmpleo!.constanciaSituacionFiscalUrl),
            _FileDisplay(name: 'Alta IMSS', url: widget.altaEmpleo!.altaImssUrl),
            _FileDisplay(name: 'Aviso de Retención Infonavit', url: widget.altaEmpleo!.avisoInfonavitUrl),
            _FileDisplay(name: 'Constancia de estudio', url: widget.altaEmpleo!.constanciaEstudioUrl),
            _FileDisplay(name: 'Constancia de antecedentes penales', url: widget.altaEmpleo!.cartaNoAntecedentesPenalesUrl),
            _FileDisplay(name: 'Contrato Laboral', url: widget.altaEmpleo!.contratoLaboralUrl),
            _FileDisplay(name: 'Carta Oferta', url: widget.altaEmpleo!.cartaOfertaUrl),
            _FileDisplay(name: 'Examen Médico', url: widget.altaEmpleo!.examenMedicoUrl),
            _FileDisplay(name: 'Carta de Recomendación (1)', url: widget.altaEmpleo!.cartaRecomendacion1Url),
            _FileDisplay(name: 'Carta de Recomendación (2)', url: widget.altaEmpleo!.cartaRecomendacion2Url),
            _FileDisplay(name: 'Carta de Recomendación (3)', url: widget.altaEmpleo!.cartaRecomendacion3Url),
          ],
        if (widget.altaPracticante != null)
          ...[
            _FileDisplay(name: 'RFC', url: widget.altaPracticante!.rfcUrl),
            _FileDisplay(name: 'Carta Presentación', url: widget.altaPracticante!.cartaPresentacionUrl),
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
  });

  final String name;
  final String? url;

  static const uploadedDecoration = BoxDecoration(
    color: Color(0xFFF0FDF4),
    border: Border.fromBorderSide(BorderSide(
      color: Color(0xFFDCFCE7),
      width: 0.8,
    )),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  static const notUploadedDecoration = BoxDecoration(
    color: Color(0xFFFDF6EE),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  TextStyle getLabelStyle(bool uploaded) {
    if (uploaded) {
      return const TextStyle(
        fontSize: 11,
        fontWeight: .w700,
        color: Color(0xFF008236),
        height: 1.5,
      );
    }

    return const TextStyle(
      fontSize: 11,
      fontWeight: .w700,
      color: Color(0xFF9A7B5A),
      height: 1.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    final downloadViewmodel = context.read<DownloadViewmodel>();
    final uploaded = url != null;

    return Container(
      decoration: uploaded ? uploadedDecoration : notUploadedDecoration,
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Flexible(
            child: Text(
              name,
              style: getLabelStyle(uploaded),
              overflow: .ellipsis,
            ),
          ),
          if (uploaded)
            IconButton(
              onPressed: () {
                final filename = url!.split('/').last;
                final params = DownloadFileParams(filename: filename, url: url!);
                downloadViewmodel.downloadFile.execute(params);
              },
              icon: Icon(
                LucideIcons.download,
                color: Color(0xFF008236),
                size: 14,
              ),
            ),
        ],
      ),
    );
  }
}