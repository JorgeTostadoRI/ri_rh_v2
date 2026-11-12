import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/domain/models/notificaciones/aviso_compra.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/compras_notificaciones_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

/// Campanita de avisos de requisiciones y órdenes de compra para RH v2.
///
/// RH ya muestra sus propios badges de incidencias en el sidebar, así que esta
/// campanita solo cubre los avisos que llegan desde Compras y enlaza al
/// frontend de Compras para revisar/aprobar/crear la orden.
class ComprasNotificationsBell extends StatelessWidget {
  const ComprasNotificationsBell({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<ComprasNotificacionesViewmodel>();
    final count = viewmodel.noLeidas;

    return IconButton(
      tooltip: 'Requisiciones y órdenes de compra',
      onPressed: () => _openCenter(context, viewmodel),
      icon: Badge.count(
        count: count,
        maxCount: 99,
        isLabelVisible: count > 0,
        backgroundColor: primaryColor,
        child: Icon(
          Icons.receipt_long_outlined,
          color: primaryColor,
        ),
      ),
    );
  }

  Future<void> _openCenter(
    BuildContext context,
    ComprasNotificacionesViewmodel viewmodel,
  ) async {
    await viewmodel.load();
    if (!context.mounted) return;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => _ComprasNotificationsDialog(
        viewmodel: viewmodel,
      ),
    );
  }
}

class _ComprasNotificationsDialog extends StatelessWidget {
  const _ComprasNotificationsDialog({required this.viewmodel});

  final ComprasNotificacionesViewmodel viewmodel;

  String? _comprasUrl(AvisoCompra aviso) {
    if (!aviso.tieneRequisicion) return null;
    if (!kIsWeb || Uri.base.host.isEmpty) return null;

    final segments =
        Uri.base.pathSegments.where((segment) => segment.isNotEmpty).toList();
    final prefix = segments.length >= 2 ? '/${segments.first}' : '';
    return '${Uri.base.origin}$prefix/compras/requisiciones/${aviso.referenciaId}';
  }

  Future<void> _abrir(BuildContext context, AvisoCompra aviso) async {
    final url = _comprasUrl(aviso);
    await viewmodel.marcarLeida(aviso);
    if (url == null) return;

    final uri = Uri.tryParse(url);
    if (uri == null) return;
    try {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    } catch (_) {
      // Sin navegador disponible.
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, _) {
        final avisos = viewmodel.avisos;
        return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.receipt_long_outlined, color: scheme.primary),
          const SizedBox(width: 8),
          const Expanded(child: Text('Requisiciones y órdenes')),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width < 620
            ? MediaQuery.sizeOf(context).width * 0.82
            : 520,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (avisos.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 40,
                        color: scheme.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sin avisos nuevos',
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                )
              else
                for (final aviso in avisos)
                  Card(
                    margin: const EdgeInsets.only(bottom: 6),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: scheme.outlineVariant),
                    ),
                    child: ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.receipt_long_outlined,
                        color: scheme.primary,
                      ),
                      title: Text(
                        aviso.titulo,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            aviso.mensaje,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${aviso.fechaCorta}'
                            '${aviso.de == null ? '' : ' · ${aviso.de}'}',
                            style: TextStyle(
                              fontSize: 11,
                              color: scheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        onPressed: () => _abrir(context, aviso),
                        child: Text(aviso.etiqueta),
                      ),
                      onTap: aviso.leida
                          ? null
                          : () => viewmodel.marcarLeida(aviso),
                    ),
                  ),
            ],
          ),
        ),
      ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
        );
      },
    );
  }
}
