import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato_detalle.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/credenciales_dialog.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/download_viewmodel.dart';
import 'package:ri_rh_v2/ui/vacantes/viewmodels/candidato_revision_viewmodel.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/completar_alta_card.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/detalles_contratacion_card.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:url_launcher/url_launcher.dart';

/// Traduce el value crudo de un choice (ej. 'masculino', 'soltero') a su
/// etiqueta para mostrar (ej. 'Masculino', 'Soltero(a)') -- mismas listas
/// que ya alimentan los dropdowns de "Detalles de contratación".
String _etiquetaChoice(List<(String, String)> choices, String valor) {
  for (final (v, etiqueta) in choices) {
    if (v == valor) return etiqueta;
  }
  return valor;
}

/// Mismo agrupamiento y etiquetas que DOCUMENTO_SECCIONES en
/// ri_rh/views/portal_candidato.py -- para mostrar los documentos que el
/// candidato ya subió, en el mismo orden que él los vio.
const _documentoSecciones = <(String, List<(String, String)>)>[
  ('Identificación y datos personales', [
    ('identificacion_oficial', 'Identificación oficial'),
    ('acta_nacimiento', 'Acta de nacimiento'),
    ('pdf_curp', 'CURP (PDF)'),
    ('constancia_estudio', 'Constancia de estudios'),
  ]),
  ('Seguro social y fiscal', [
    ('comprobante_nss', 'Comprobante NSS'),
    ('constancia_situacion_fiscal', 'Constancia de situación fiscal'),
    ('comprobante_domicilio', 'Comprobante de domicilio'),
    ('estado_cuenta', 'Estado de cuenta'),
    ('aviso_retencion_infonavit', 'Aviso de retención Infonavit'),
  ]),
  ('Documentos laborales', [
    ('curriculum_vitae', 'Curriculum vitae'),
    ('examen_medico', 'Examen médico'),
    ('carta_no_antecedentes_penales', 'Carta de no antecedentes penales'),
    ('carta_recomendacion_1', 'Carta de recomendación 1'),
    ('carta_recomendacion_2', 'Carta de recomendación 2'),
    ('carta_recomendacion_3', 'Carta de recomendación 3'),
  ]),
];

class CandidatoRevisionScreen extends StatefulWidget {
  const CandidatoRevisionScreen({super.key, required this.viewmodel});

  final CandidatoRevisionViewmodel viewmodel;

  @override
  State<CandidatoRevisionScreen> createState() => _CandidatoRevisionScreenState();
}

class _CandidatoRevisionScreenState extends State<CandidatoRevisionScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewmodel.guardarDetalles.addListener(_onGuardarDetalles);
    widget.viewmodel.solicitarContrato.addListener(_onSolicitarContrato);
    widget.viewmodel.rechazarDocumentacion.addListener(_onRechazarDocumentacion);
    widget.viewmodel.vistaPreviaDocumentos.addListener(_onVistaPreviaDocumentos);
    widget.viewmodel.completarAlta.addListener(_onCompletarAlta);
  }

  @override
  void dispose() {
    widget.viewmodel.guardarDetalles.removeListener(_onGuardarDetalles);
    widget.viewmodel.solicitarContrato.removeListener(_onSolicitarContrato);
    widget.viewmodel.rechazarDocumentacion.removeListener(_onRechazarDocumentacion);
    widget.viewmodel.vistaPreviaDocumentos.removeListener(_onVistaPreviaDocumentos);
    widget.viewmodel.completarAlta.removeListener(_onCompletarAlta);
    super.dispose();
  }

  void _onGuardarDetalles() {
    if (widget.viewmodel.guardarDetalles.completed) {
      widget.viewmodel.guardarDetalles.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Detalles de contratación guardados')));
      return;
    }
    if (widget.viewmodel.guardarDetalles.error) {
      final error = widget.viewmodel.guardarDetalles.result;
      widget.viewmodel.guardarDetalles.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudieron guardar los detalles', error: error),
      );
    }
  }

  void _onSolicitarContrato() {
    if (widget.viewmodel.solicitarContrato.completed) {
      widget.viewmodel.solicitarContrato.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contrato solicitado, se envió la información a los abogados')),
      );
      return;
    }
    if (widget.viewmodel.solicitarContrato.error) {
      final error = widget.viewmodel.solicitarContrato.result;
      widget.viewmodel.solicitarContrato.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo solicitar el contrato', error: error),
      );
    }
  }

  void _onRechazarDocumentacion() {
    if (widget.viewmodel.rechazarDocumentacion.completed) {
      widget.viewmodel.rechazarDocumentacion.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Documentación rechazada, el candidato ya puede corregirla en su link')),
      );
      return;
    }
    if (widget.viewmodel.rechazarDocumentacion.error) {
      final error = widget.viewmodel.rechazarDocumentacion.result;
      widget.viewmodel.rechazarDocumentacion.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo rechazar la documentación', error: error),
      );
    }
  }

  void _onVistaPreviaDocumentos() {
    if (widget.viewmodel.vistaPreviaDocumentos.completed) {
      final vistaPrevia = (widget.viewmodel.vistaPreviaDocumentos.result as Ok<VistaPreviaDocumentos>).value;
      widget.viewmodel.vistaPreviaDocumentos.clearResult();
      context.read<DownloadViewmodel>().downloadFile.execute(
        DownloadFileParams(filename: vistaPrevia.nombreArchivo, url: vistaPrevia.url),
      );
      return;
    }
    if (widget.viewmodel.vistaPreviaDocumentos.error) {
      final error = widget.viewmodel.vistaPreviaDocumentos.result;
      widget.viewmodel.vistaPreviaDocumentos.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudieron generar los documentos', error: error),
      );
    }
  }

  void _onCompletarAlta() {
    if (widget.viewmodel.completarAlta.completed) {
      final alta = (widget.viewmodel.completarAlta.result as Ok<AltaCompletada>).value;
      widget.viewmodel.completarAlta.clearResult();
      if (alta.credenciales != null) {
        CredencialesDialog.show(context, nombre: alta.nombreCompleto, credenciales: alta.credenciales!);
      }
      return;
    }
    if (widget.viewmodel.completarAlta.error) {
      final error = widget.viewmodel.completarAlta.result;
      widget.viewmodel.completarAlta.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo completar el alta', error: error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: ListenableBuilder(
            listenable: Listenable.merge([widget.viewmodel, widget.viewmodel.load]),
            builder: (context, _) {
              if (widget.viewmodel.load.running && widget.viewmodel.candidato == null) {
                return const Center(child: CircularProgressIndicator());
              }
              if (widget.viewmodel.load.error && widget.viewmodel.candidato == null) {
                return Column(
                  crossAxisAlignment: .start,
                  spacing: 16,
                  children: [
                    const PageHeader(title: 'Candidato', showBackButton: true),
                    const Text('No se pudo cargar al candidato'),
                    ElevatedButton.icon(
                      onPressed: () => widget.viewmodel.load.execute(widget.viewmodel.candidatoId),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reintentar'),
                    ),
                  ],
                );
              }

              final candidato = widget.viewmodel.candidato!;
              return Column(
                crossAxisAlignment: .start,
                spacing: 32,
                children: [
                  PageHeader(
                    title: '${candidato.nombres} ${candidato.apellidoPaterno} ${candidato.apellidoMaterno}'.trim(),
                    subtitle: candidato.puestoNombre,
                    showBackButton: true,
                  ),
                  if (!candidato.verificadoPorIa) const _AvisoSinVerificacionIA(),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final ancho = constraints.maxWidth;
                      final datosYDocumentos = [
                        Expanded(flex: 3, child: _DatosPersonalesSection(candidato: candidato)),
                        Expanded(flex: 2, child: _DocumentosSection(candidato: candidato)),
                      ];
                      if (ancho < 900) {
                        return Column(spacing: 24, children: datosYDocumentos.map((e) => e.child).toList());
                      }
                      return Row(
                        crossAxisAlignment: .start,
                        spacing: 24,
                        children: datosYDocumentos,
                      );
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DetallesContratacionCard(
                      key: ValueKey(candidato.contratoSolicitadoEn),
                      candidato: candidato,
                      guardarDetalles: widget.viewmodel.guardarDetalles,
                      solicitarContrato: widget.viewmodel.solicitarContrato,
                      rechazarDocumentacion: widget.viewmodel.rechazarDocumentacion,
                      vistaPreviaDocumentos: widget.viewmodel.vistaPreviaDocumentos,
                    ),
                  ),
                  if (candidato.contratoSolicitadoEn != null)
                    SizedBox(
                      width: double.infinity,
                      child: CompletarAltaCard(
                        key: ValueKey(candidato.empleado),
                        candidato: candidato,
                        completarAlta: widget.viewmodel.completarAlta,
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
}

class _DatosPersonalesSection extends StatelessWidget {
  const _DatosPersonalesSection({required this.candidato});

  final CandidatoDetalle candidato;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        IconCard(
          icon: Icons.person_outline,
          title: 'Datos personales',
          children: [
            _campo('Nombre completo', '${candidato.nombres} ${candidato.apellidoPaterno} ${candidato.apellidoMaterno}'),
            _campo('Correo', candidato.correo),
            _campo('Teléfono', candidato.telefono),
            _campo('CURP', candidato.curp),
            _campo('RFC', candidato.rfc),
            _campo('Número de Seguro Social', candidato.numeroSeguroSocial),
            _campo('CLABE interbancaria', candidato.clabeInterbancaria),
            _campo('Escolaridad', candidato.escolaridad),
            _campo(
              'Fecha de nacimiento',
              candidato.fechaNacimiento != null ? candidato.fechaNacimiento!.toShortIsoString() : '',
            ),
            _campo('Nacionalidad', candidato.nacionalidad),
            _campo('Sexo', _etiquetaChoice(CandidatoChoices.sexo, candidato.sexo)),
            _campo('Estado civil', _etiquetaChoice(CandidatoChoices.estadoCivil, candidato.estadoCivil)),
            _campo(
              'Contacto de emergencia',
              '${candidato.contactoEmergenciaNombre} (${candidato.contactoEmergenciaTelefono})',
            ),
          ],
        ),
        IconCard(
          icon: Icons.home_outlined,
          title: 'Domicilio',
          children: [
            _campo(
              'Domicilio',
              '${candidato.direccionCalle} ${candidato.direccionNumero}, ${candidato.direccionFraccionamiento}, '
              'C.P. ${candidato.direccionCodigoPostal}, ${candidato.direccionMunicipio}, '
              '${candidato.direccionEstado}, ${candidato.direccionPais}',
            ),
          ],
        ),
        IconCard(
          icon: Icons.people_outline,
          title: 'Beneficiarios',
          children: candidato.beneficiarios.isEmpty
              ? [const Text('No se designaron beneficiarios.')]
              : candidato.beneficiarios
                  .map((b) => _campo('${b.nombreCompleto} (${b.parentesco})', '${b.direccion} — ${b.porcentaje}%'))
                  .toList(),
        ),
      ],
    );
  }

  Widget _campo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: .w700, color: Color(0xFF9A7B5A))),
          Text(value.isEmpty ? '—' : value),
        ],
      ),
    );
  }
}

class _DocumentosSection extends StatelessWidget {
  const _DocumentosSection({required this.candidato});

  final CandidatoDetalle candidato;

  Future<void> _abrir(BuildContext context, String url) async {
    final logger = context.read<AppLogger>();
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e, stackTrace) {
      logger.error('Failed to open candidato document', error: e, stackTrace: stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconCard(
      icon: Icons.folder_outlined,
      title: 'Documentos',
      children: [
        for (final (titulo, campos) in _documentoSecciones) ...[
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Text(
              titulo.toUpperCase(),
              style: const TextStyle(fontSize: 11, fontWeight: .w700, color: primaryColor, letterSpacing: 0.3),
            ),
          ),
          for (final (campo, etiqueta) in campos) _fila(context, etiqueta, candidato.documentos[campo]),
        ],
      ],
    );
  }

  Widget _fila(BuildContext context, String etiqueta, String? url) {
    final subido = url != null;
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: subido ? const Color(0xFFF0FDF4) : const Color(0xFFFDF6EE),
        border: subido ? Border.fromBorderSide(BorderSide(color: const Color(0xFFDCFCE7), width: 0.8)) : null,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Flexible(
            child: Text(
              etiqueta,
              style: TextStyle(
                fontSize: 12,
                fontWeight: .w700,
                color: subido ? const Color(0xFF008236) : const Color(0xFF9A7B5A),
              ),
            ),
          ),
          if (subido)
            IconButton(
              onPressed: () => _abrir(context, url),
              icon: const Icon(Icons.open_in_new, size: 16, color: Color(0xFF008236)),
              tooltip: 'Ver documento',
            ),
        ],
      ),
    );
  }
}

/// Se muestra cuando el candidato llegó a "completado" sin que la IA haya
/// podido confirmar sus documentos de verdad (falla técnica, o nunca se
/// corrió) -- para que RH sepa que aquí sí tiene que revisar la
/// documentación a mano, con más cuidado de lo normal.
class _AvisoSinVerificacionIA extends StatelessWidget {
  const _AvisoSinVerificacionIA();

  @override
  Widget build(BuildContext context) {
    const boldStyle = TextStyle(fontWeight: .w800, color: Color(0xFF92400E));
    const normalStyle = TextStyle(color: Color(0xFF92400E));
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7),
        border: Border.all(color: const Color(0xFFFCD34D)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: .start,
        spacing: 12,
        children: [
          const Icon(Icons.warning_amber_rounded, color: Color(0xFF92400E)),
          Expanded(
            child: RichText(
              text: const TextSpan(
                style: normalStyle,
                children: [
                  TextSpan(text: 'AVISO', style: boldStyle),
                  TextSpan(text: ': Sin verificación de '),
                  TextSpan(text: 'IA', style: boldStyle),
                  TextSpan(text: ', favor de revisar la documentación '),
                  TextSpan(text: 'cuidadosamente', style: boldStyle),
                  TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
