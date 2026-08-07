import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';

class ExpedienteFiles extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return IconCard(
      icon: LucideIcons.fileText,
      title: 'Documentación',
      children: [
        _FileDisplay(name: 'INE/Identificación', url: files.ineUrl),
        _FileDisplay(name: 'Acta de nacimiento', url: files.actaNacimientoUrl),
        _FileDisplay(name: 'CURP', url: files.curpUrl),
        _FileDisplay(name: 'NSS', url: files.nssUrl),
        _FileDisplay(name: 'Curriculum Vitae', url: files.cvUrl),
        _FileDisplay(name: 'Comprobante de domicilio', url: files.domicilioUrl),
        _FileDisplay(name: 'Cuenta Bancaria', url: files.estadoCuentaUrl),
        if (altaEmpleo != null)
          ...[
            _FileDisplay(name: 'RFC', url: altaEmpleo!.constanciaSituacionFiscalUrl),
            _FileDisplay(name: 'Alta IMSS', url: altaEmpleo!.altaImssUrl),
            _FileDisplay(name: 'Aviso de Retención Infonavit', url: altaEmpleo!.avisoInfonavitUrl),
            _FileDisplay(name: 'Constancia de estudio', url: altaEmpleo!.constanciaEstudioUrl),
            _FileDisplay(name: 'Constancia de antecedentes penales', url: altaEmpleo!.cartaNoAntecedentesPenalesUrl),
            _FileDisplay(name: 'Contrato Laboral', url: altaEmpleo!.contratoLaboralUrl),
            _FileDisplay(name: 'Carta Oferta', url: altaEmpleo!.cartaOfertaUrl),
            _FileDisplay(name: 'Examen Médico', url: altaEmpleo!.examenMedicoUrl),
            _FileDisplay(name: 'Carta de Recomendación (1)', url: altaEmpleo!.cartaRecomendacion1Url),
            _FileDisplay(name: 'Carta de Recomendación (2)', url: altaEmpleo!.cartaRecomendacion2Url),
            _FileDisplay(name: 'Carta de Recomendación (3)', url: altaEmpleo!.cartaRecomendacion3Url),
          ],
        if (altaPracticante != null)
          ...[
            _FileDisplay(name: 'RFC', url: altaPracticante!.rfcUrl),
            _FileDisplay(name: 'Carta Presentación', url: altaPracticante!.cartaPresentacionUrl),
          ],
      ],
    );
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
              onPressed: () => context.read<AppLogger>().info('Download $url'),
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