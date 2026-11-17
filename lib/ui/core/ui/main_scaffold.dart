import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';
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

    // Computadora y app de Windows: sin cambios.
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          CollapsibleSidebar(),
          Expanded(
            child: child,
          ),
        ],
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
