import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/services/shared_preferences_service.dart';
import 'package:ri_rh_v2/ui/core/ui/requisition_alerts_panel.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Campanita de "Avisos de requisiciones y órdenes" para RH v2.
///
/// Reutiliza el mismo botón y panel que los demás sistemas, con el token de
/// sesión de RH v2 y el enlace al frontend de Compras.
class ComprasNotificationsBell extends StatelessWidget {
  const ComprasNotificationsBell({super.key});

  static const _apiUrl = String.fromEnvironment(
    'api_url',
    defaultValue: 'http://localhost:8000',
  );

  String get _apiBase {
    if (kIsWeb && Uri.base.host.isNotEmpty) {
      final segments =
          Uri.base.pathSegments.where((segment) => segment.isNotEmpty).toList();
      if (segments.length >= 2) {
        return '${Uri.base.origin}/${segments.first}';
      }
    }
    return _apiUrl.replaceFirst(RegExp(r'/+$'), '');
  }

  String get _comprasUrl {
    if (kIsWeb && Uri.base.host.isNotEmpty) {
      final segments =
          Uri.base.pathSegments.where((segment) => segment.isNotEmpty).toList();
      final prefix = segments.length >= 2 ? '/${segments.first}' : '';
      return '${Uri.base.origin}$prefix/compras';
    }
    return '${_apiBase.replaceFirst(RegExp(r'/+$'), '')}/compras';
  }

  @override
  Widget build(BuildContext context) {
    final prefs = context.read<SharedPreferencesService>();

    return RequisitionAlertsButton(
      apiBaseUrl: _apiBase,
      comprasUrl: _comprasUrl,
      readToken: () async {
        final result = await prefs.fetchToken();
        return switch (result) {
          Ok(value: final token) => token,
          Error() => null,
        };
      },
    );
  }
}
