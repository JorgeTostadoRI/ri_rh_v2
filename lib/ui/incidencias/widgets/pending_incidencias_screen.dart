import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/color_icon.dart';
import 'package:ri_rh_v2/ui/core/ui/custom_tab_bar.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/pending_incidencias_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_filters.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_approve_dialog.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_overview_dialog.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

class PendingIncidenciasScreen extends StatefulWidget {
  const PendingIncidenciasScreen({
    super.key,
    required this.viewmodel,
  });

  final PendingIncidenciasViewmodel viewmodel;

  @override
  State<PendingIncidenciasScreen> createState() => _PendingIncidenciasScreenState();
}

class _PendingIncidenciasScreenState extends State<PendingIncidenciasScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final yMd = DateFormat.yMd();
  int viewSelectIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
    widget.viewmodel.approve.addListener(_onApproved);
    widget.viewmodel.reject.addListener(_onRejected);
  }

  @override
  void didUpdateWidget(covariant PendingIncidenciasScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.removeListener(_onTabChanged);
    _tabController.addListener(_onTabChanged);
    widget.viewmodel.approve.removeListener(_onApproved);
    widget.viewmodel.approve.addListener(_onApproved);
    widget.viewmodel.reject.removeListener(_onRejected);
    widget.viewmodel.reject.addListener(_onRejected);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                spacing: 32,
                crossAxisAlignment: .start,
                children: [
                  PageHeader(
                    title: 'Solicitudes de Incidencias',
                    subtitle: 'Revisa tus solicitudes pendientes de revisión.',
                    showBackButton: true,
                  ),
                  CustomTabBar(
                    controller: _tabController,
                    options: [
                      'Pendientes',
                      'Historial',
                    ],
                  ),
                  IncidenciaFilters(viewmodel: widget.viewmodel),
                ],
              ),
            ),
          ];
        }),
        body: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: TabBarView(
            controller: _tabController,
            children: [
              _IncidenciasReviewList(viewmodel: widget.viewmodel, onResult: _handleDialogStateResult),
              _IncidenciasHistory(viewmodel: widget.viewmodel, onResult: _handleDialogStateResult),
            ],
          ),
        ),
      ),
    );
  }

  void _handleDialogStateResult(Incidencia incidencia, IncidenciaApproveDialogResult result) {
    switch (result.state) {
      case IncidenciaState.approved:
        widget.viewmodel.approve.execute(incidencia);
      case IncidenciaState.rejected:
        widget.viewmodel.reject.execute((incidencia: incidencia, rejectionReason: result.rejectionReason));
      default:
        throw ArgumentError('Invalid state option');
    }
  }

  void _onApproved() {
    if (widget.viewmodel.approve.completed) {
      widget.viewmodel.approve.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se aprobó la incidencia')),
      );
    }
    else if (widget.viewmodel.approve.error) {
      widget.viewmodel.approve.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo aprobar la incidencia')),
      );
    }
  }

  void _onRejected() {
    if (widget.viewmodel.reject.completed) {
      widget.viewmodel.reject.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se rechazó la incidencia')),
      );
    }
    else if (widget.viewmodel.reject.error) {
      widget.viewmodel.reject.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo rechazar la incidencia')),
      );
    }
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      widget.viewmodel.selection = _tabController.index;
      widget.viewmodel.load.execute();
    }
  }
}

class _IncidenciaListTile extends StatelessWidget {
  const _IncidenciaListTile({
    required this.incidencia,
    required this.onResult,
    required this.canApprove,
    required this.onDownload,
  });

  final Incidencia incidencia;
  final Function(Incidencia, IncidenciaApproveDialogResult) onResult;
  final bool canApprove;
  final void Function() onDownload;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      leading: switch(incidencia.state!) {
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
      title: Text(
        '${incidencia.categoryName} para ${incidencia.solicitor!.nombre} en ${_formatStartEndDates(incidencia)}',
        style: textTheme.headlineSmall,
      ),
      subtitle: Text(
        incidencia.reason,
        style: textTheme.labelLarge?.copyWith(
          fontSize: 16,
        ),
        overflow: .ellipsis,
      ),
      onTap: () async {
        if (!canApprove) {
          showDialog(
            context: context,
            builder: (context) => IncidenciaOverviewDialog(
              incidencia: incidencia,
              onDownload: onDownload,
            ),
          );
          return;
        }

        final IncidenciaApproveDialogResult? result = await showDialog<IncidenciaApproveDialogResult>(
          context: context,
          builder: (context) {
            return IncidenciaApproveDialog(
              incidencia: incidencia,
            );
          }
        );

        if (result == null) return;

        onResult(incidencia, result);
      }
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

class _IncidenciasReviewList extends StatelessWidget {
  const _IncidenciasReviewList({
    required this.viewmodel,
    required this.onResult,
  });

  final PendingIncidenciasViewmodel viewmodel;
  final Function(Incidencia, IncidenciaApproveDialogResult) onResult;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ListenableBuilder(
      listenable: Listenable.merge([
        viewmodel.load,
        viewmodel.approve,
        viewmodel.reject,
      ]),
      builder: (context, _) {
        if (viewmodel.load.running) {
          return Center(child: CircularProgressIndicator());
        }
    
        if (viewmodel.load.error) {
          return Center(
            child: Column(
              children: [
                Text('No se pudieron cargar las incidencias.'),
                Text(
                  viewmodel.load.result.toString(),
                  style: TextStyle(color: errorColor),
                ),
                ElevatedButton.icon(
                  onPressed: () => viewmodel.load.execute(),
                  icon: Icon(LucideIcons.rotateCcw),
                  label: Text('Reintentar'),
                ),
              ],
            ),
          );
        }
    
        if (viewmodel.pendingToReview?.isEmpty ?? true) {
          return Center(
            child: Column(
              spacing: 24,
              children: [
                Icon(
                  LucideIcons.partyPopper,
                  size: 60,
                  color: statusSuccessColor,
                ),
                Text('No tienes incidencias por revisar', style: textTheme.headlineSmall),
              ],
            ),
          );
        }
    
        return ListView.separated(
          shrinkWrap: true,
          itemCount: viewmodel.pendingToReview!.length,
          itemBuilder: (context, index) {
            final incidencia = viewmodel.pendingToReview![index];
            return _IncidenciaListTile(
              incidencia: incidencia,
              onResult: onResult,
              canApprove: true,
              onDownload: () => viewmodel.download.execute(incidencia),
            );
          },
          separatorBuilder: (context, _) => SizedBox(height: 12),
        );
      },
    );
  }
}

class _IncidenciasHistory extends StatelessWidget {
  const _IncidenciasHistory({
    required this.viewmodel,
    required this.onResult,
  });

  final PendingIncidenciasViewmodel viewmodel;
  final Function(Incidencia, IncidenciaApproveDialogResult) onResult;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ListenableBuilder(
      listenable: Listenable.merge([
        viewmodel.load,
        viewmodel.approve,
        viewmodel.reject,
      ]),
      builder: (context, _) {
        if (viewmodel.load.running) {
          return Center(child: CircularProgressIndicator());
        }

        if (viewmodel.load.error) {
          return Center(
            child: Column(
              children: [
                Text('No se pudieron cargar las incidencias.'),
                Text(
                  viewmodel.load.result.toString(),
                  style: TextStyle(color: errorColor),
                ),
                ElevatedButton.icon(
                  onPressed: () => viewmodel.load.execute(),
                  icon: Icon(LucideIcons.rotateCcw),
                  label: Text('Reintentar'),
                ),
              ],
            ),
          );
        }

        if (viewmodel.historial?.isEmpty ?? true) {
          return Center(
            child: Column(
              spacing: 24,
              children: [
                Icon(
                  LucideIcons.tentTree,
                  size: 60,
                  color: primaryColor,
                ),
                Text('No hay incidencias previas', style: textTheme.headlineSmall),
              ],
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          itemCount: viewmodel.historial!.length,
          itemBuilder: (context, index) {
            final incidencia = viewmodel.historial![index];
            return _IncidenciaListTile(
              incidencia: incidencia,
              onResult: onResult,
              canApprove: false,
              onDownload: () => viewmodel.download.execute(incidencia),
            );
          },
          separatorBuilder: (context, _) => SizedBox(height: 12),
        );
      },
    );
  }
}