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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _authenticate());
  }

  @override
  void dispose() {
    if (_ownsSession) {
      widget.viewmodel.endSession();
    }
    super.dispose();
  }

  Future<void> _authenticate() async {
    // Captured once so this flow keeps talking to the same viewmodel instance
    // even if the parent route gets rebuilt (e.g. GoRouter's refreshListenable
    // firing as soon as the challenge login succeeds) while the dialog is open.
    final viewmodel = widget.viewmodel;

    final isAuthenticated = await viewmodel.isAuthenticated;
    if (!mounted) return;

    if (!isAuthenticated) {
      final authenticated = await showDialog<Result<bool>>(
        context: context,
        barrierDismissible: false,
        builder: (context) => VerifyIdentityDialog(
          viewmodel: viewmodel,
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
    viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingAuth) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
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
              listenable: Listenable.merge([widget.viewmodel.load, widget.viewmodel.download]),
              builder: (context, _) {
                if (widget.viewmodel.load.running) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (widget.viewmodel.load.error) {
                  return Center(
                    child: Column(
                      spacing: 32,
                      mainAxisSize: .min,
                      children: [
                        const Text('No se pudieron cargar tus incidencias'),
                        ElevatedButton.icon(
                          onPressed: () => widget.viewmodel.load.execute(),
                          icon: Icon(LucideIcons.rotateCcw),
                          label: const Text('Reintentar'),
                        ),
                      ],
                    ),
                  );
                }

                if (widget.viewmodel.incidencias?.isEmpty ?? true) {
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
                  itemCount: widget.viewmodel.incidencias!.length,
                  itemBuilder: (context, index) {
                    final incidencia = widget.viewmodel.incidencias![index];
                    return _MiIncidenciaTile(
                      incidencia: incidencia,
                      onDownload: (force) => widget.viewmodel.download.execute((incidencia: incidencia, force: force)),
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

    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      leading: switch (incidencia.state!) {
        IncidenciaState.pending => ColorIcon(
          icon: LucideIcons.clock,
          backgroundColor: statusWarningBgColor,
        ),
        IncidenciaState.rejected => ColorIcon(
          icon: LucideIcons.x,
          backgroundColor: statusFailureBgColor,
          iconColor: statusFailureColor,
        ),
        IncidenciaState.approved => ColorIcon(
          icon: LucideIcons.circleCheckBig,
          backgroundColor: statusSuccessBgColor,
          iconColor: statusSuccessColor,
        ),
      },
      trailing: StepTimeline(
        length: IncidenciaApprovalStage.values.length,
        currentStep: incidencia.approvalStage.index,
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
      onTap: () => showDialog(
        context: context,
        builder: (context) => IncidenciaOverviewDialog(
          incidencia: incidencia,
          onDownload: onDownload,
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
