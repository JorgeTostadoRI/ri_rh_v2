import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';
import 'package:ri_rh_v2/ui/core/ui/compras_notifications_bell.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (esNavegadorMovil) {
      return _MobileScaffold(child: child);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          CollapsibleSidebar(),
          Expanded(
            // Web de computadora: franja arriba con el botón de avisos de
            // compras a la derecha (en una franja propia para no encimarse
            // con los botones de cada pantalla). App de Windows: sin cambios.
            child: esWeb
                ? Column(
                    children: [
                      const _BarraAvisosCompras(),
                      Expanded(child: child),
                    ],
                  )
                : child,
          ),
        ],
      ),
    );
  }
}

/// Franja de arriba del contenido (web de computadora) con el botón de
/// "Avisos de requisiciones y órdenes" a la derecha.
class _BarraAvisosCompras extends StatelessWidget {
  const _BarraAvisosCompras();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Align(
        alignment: Alignment.centerRight,
        child: ComprasNotificationsBell(),
      ),
    );
  }
}

/// Navegador de celular: el menú lateral fijo se come buena parte de la
/// pantalla, así que aquí va oculto detrás del botón ☰ de la barra de arriba
/// y se abre encima del contenido. Es el mismo menú que en computadora.
class _MobileScaffold extends StatelessWidget {
  const _MobileScaffold({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: primaryColor),
        title: Text(
          'Recursos Humanos',
          style: TextTheme.of(context).titleSmall?.copyWith(
            color: const Color(0xFF9A7B5A),
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const Border(bottom: BorderSide(color: Color(0xFFF5E8D8))),
        // Avisos de requisiciones y órdenes, a la derecha de la barra.
        actions: const [ComprasNotificationsBell(), SizedBox(width: 8)],
      ),
      drawer: Builder(
        builder: (drawerContext) => Drawer(
          width: 240,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
          child: SafeArea(
            child: CollapsibleSidebar(
              enMenuMovil: true,
              onNavegar: () => Scaffold.of(drawerContext).closeDrawer(),
            ),
          ),
        ),
      ),
      body: child,
    );
  }
}
