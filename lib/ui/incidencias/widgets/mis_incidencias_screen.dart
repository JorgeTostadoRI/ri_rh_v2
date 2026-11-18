import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/color_icon.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/step_timeline.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/mis_incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_overview_dialog.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/verify_identity_dialog.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

class MisIncidenciasScreen extends StatefulWidget {
  const MisIncidenciasScreen({
    super.key,
    required this.viewmodel,
  });

  final MisIncidenciasViewmodel viewmodel;

  @override
  State<MisIncidenciasScreen> createState() => _MisIncidenciasScreenState();
}

class _MisIncidenciasScreenState extends State<MisIncidenciasScreen> {
  bool _checkingAuth = true;
  bool _ownsSession = false;

  // Capturado una sola vez: el router puede reconstruir esta ruta a medio
  // flujo (ej. refreshListenable de GoRouter al completarse el login por
  // huella), lo que nos pasaría una instancia nueva de MisIncidenciasViewmodel
  // en widget.viewmodel. Seguimos usando siempre esta misma instancia para no
  // perder lo que ya se cargó/está en curso.
  late final MisIncidenciasViewmodel _viewmodel;

  @override
  void initState() {
    super.initState();
    _viewmodel = widget.viewmodel;
    WidgetsBinding.instance.addPostFrameCallback((_) => _authenticate());
  }

  @override
  void didUpdateWidget(covariant MisIncidenciasScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewmodel != _viewmodel) {
      // Instancia huérfana creada por la reconstrucción de la ruta: se
      // descarta de inmediato para que no se quede escuchando el sensor de
      // huella para siempre.
      widget.viewmodel.dispose();
    }
  }

  @override
  void dispose() {
    if (_ownsSession) {
      _viewmodel.endSession();
    }
    // Sin esto, el listener al escaner de huellas de _viewmodel (ver
    // MisIncidenciasViewmodel._capturesSub) se queda vivo para siempre cada
    // vez que se sale normalmente de esta pantalla -- didUpdateWidget de
    // arriba solo cubre el caso de una instancia huerfana por
    // reconstruccion del router, no el de salir de la pantalla.
    _viewmodel.dispose();
    super.dispose();
  }

  Future<void> _authenticate() async {
    // Si el equipo tiene lector se pide siempre la huella, aunque ya haya una
    // sesion abierta: se deben mostrar las incidencias de quien puso el
    // dedo, nunca las del dueño de una sesion que alguien dejo iniciada. Sin
    // lector (PC de oficina, web) basta con la sesion iniciada -- solo aplica
    // para consultar; registrar una incidencia siempre exige huella (o video
    // si es remoto), ver IncidenciaForm.
    final isAuthenticated = await _viewmodel.isAuthenticated;
    final requiresFingerprint = !isAuthenticated || _viewmodel.scannerAvailable;
    if (!mounted) return;

    if (requiresFingerprint) {
      final authenticated = await showDialog<Result<bool>>(
        context: context,
        barrierDismissible: false,
        builder: (context) => VerifyIdentityDialog(
          viewmodel: _viewmodel,
        ),
      );

      if (authenticated is Error<bool>) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ha ocurrido un error con la autenticación')),
          );
          context.pop();
        }
        return;
      }

      final success = authenticated is Ok<bool> && authenticated.value;
      if (!success) {
        if (mounted) context.pop();
        return;
      }
      _ownsSession = true;
    }

    if (!mounted) return;
    setState(() => _checkingAuth = false);
    _viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingAuth) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(esNavegadorMovil ? 16 : 40),
        child: Column(
          spacing: 32,
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            PageHeader(
              title: 'Mis Incidencias',
              subtitle: 'Consulta el estatus de tus solicitudes.',
              showBackButton: true,
            ),
            ListenableBuilder(
              listenable: Listenable.merge([_viewmodel.load, _viewmodel.download]),
              builder: (context, _) {
                // Sin lista todavia (aun no arranca la carga) se muestra
                // cargando, nunca "No has registrado incidencias".
                if (_viewmodel.load.running || (_viewmodel.incidencias == null && !_viewmodel.load.error)) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (_viewmodel.load.error) {
                  return Center(
                    child: Column(
                      spacing: 32,
                      mainAxisSize: .min,
                      children: [
                        const Text('No se pudieron cargar tus incidencias'),
                        ElevatedButton.icon(
                          onPressed: () => _viewmodel.load.execute(),
                          icon: Icon(LucideIcons.rotateCcw),
                          label: const Text('Reintentar'),
                        ),
                      ],
                    ),
                  );
                }

                if (_viewmodel.incidencias!.isEmpty) {
                  return Center(
                    child: Column(
                      spacing: 24,
                      children: [
                        Icon(
                          LucideIcons.tentTree,
                          size: 60,
                          color: primaryColor,
                        ),
                        Text(
                          'No has registrado incidencias',
                          style: TextTheme.of(context).headlineSmall,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _viewmodel.incidencias!.length,
                  itemBuilder: (context, index) {
                    final incidencia = _viewmodel.incidencias![index];
                    return _MiIncidenciaTile(
                      incidencia: incidencia,
                      onDownload: (force) => _viewmodel.download.execute((incidencia: incidencia, force: force)),
                    );
                  },
                  separatorBuilder: (context, _) => const SizedBox(height: 12),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MiIncidenciaTile extends StatelessWidget {
  const _MiIncidenciaTile({
    required this.incidencia,
    required this.onDownload,
  });

  final Incidencia incidencia;
  final void Function(bool force) onDownload;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    if (esNavegadorMovil) return _buildMovil(context);

    return ListTile(
      tileColor: context.rh.superficie,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      leading: _iconoEstado(context.rh),
      trailing: StepTimeline(
        length: incidencia.totalApprovalSteps,
        currentStep: incidencia.approvalStepIndex,
      ),
      title: Text(
        '${incidencia.categoryName} en ${_formatStartEndDates(incidencia)}',
        style: textTheme.headlineSmall,
      ),
      subtitle: Text(
        incidencia.reason,
        style: textTheme.labelLarge?.copyWith(fontSize: 16),
        overflow: .ellipsis,
        maxLines: 2,
      ),
      onTap: () => _abrirDetalle(context),
    );
  }

  Widget _iconoEstado(RhColores c) => switch (incidencia.state!) {
    IncidenciaState.pending => ColorIcon(
      icon: LucideIcons.clock,
      backgroundColor: c.avisoFondo,
    ),
    IncidenciaState.rejected => ColorIcon(
      icon: LucideIcons.x,
      backgroundColor: c.falloFondo,
      iconColor: c.falloTexto,
    ),
    IncidenciaState.approved => ColorIcon(
      icon: LucideIcons.circleCheckBig,
      backgroundColor: c.exitoFondo,
      iconColor: c.exitoTexto,
    ),
  };

  void _abrirDetalle(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => IncidenciaOverviewDialog(
        incidencia: incidencia,
        onDownload: onDownload,
      ),
    );
  }

  /// Navegador de celular: en la fila de computadora el título queda
  /// apretado entre el ícono y la línea de pasos. Aquí es una tarjeta: ícono
  /// y título arriba, motivo en medio y la línea de pasos abajo.
  Widget _buildMovil(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Material(
      color: context.rh.superficie,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _abrirDetalle(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 8,
            children: [
              Row(
                spacing: 12,
                children: [
                  _iconoEstado(context.rh),
                  Expanded(
                    child: Text(
                      '${incidencia.categoryName} en ${_formatStartEndDates(incidencia)}',
                      style: textTheme.titleMedium?.copyWith(fontWeight: .w700),
                    ),
                  ),
                ],
              ),
              Text(
                incidencia.reason,
                style: textTheme.labelLarge,
                overflow: .ellipsis,
                maxLines: 2,
              ),
              StepTimeline(
                length: incidencia.totalApprovalSteps,
                currentStep: incidencia.approvalStepIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatStartEndDates(Incidencia incidencia) {
    final yMd = DateFormat.yMd();

    if (incidencia.start.isSameDay(incidencia.end)) {
      return yMd.format(incidencia.start.toLocal());
    } else {
      final localStart = incidencia.start.toLocal();
      final localEnd = incidencia.end.toLocal();
      return '${yMd.format(localStart)} hasta ${yMd.format(localEnd)}';
    }
  }
}
