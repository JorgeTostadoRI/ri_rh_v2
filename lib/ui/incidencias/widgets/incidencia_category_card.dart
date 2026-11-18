import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

class IncidenciaCategoryCard extends StatefulWidget {
  const IncidenciaCategoryCard({
    super.key,
    required this.category,
    required this.icon,
    required this.description,
    required this.color,
    required this.bg,
  });

  final IncidenciaCategory category;
  final IconData icon;
  final String description;
  final Color color;
  final Color bg;

  @override
  State<IncidenciaCategoryCard> createState() => _IncidenciaCategoryCardState();
}

class _IncidenciaCategoryCardState extends State<IncidenciaCategoryCard> {
  bool _hovering = false;

  Color get borderColor => _hovering ? widget.color : context.rh.borde;
  double get iconScale => _hovering ? 1.1 : 1.0;

  @override
  Widget build(BuildContext context) {
    if (esNavegadorMovil) return _buildMovil(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(Routes.newIncidenciaOfCategory(widget.category)),
        child: SizedBox(
          width: 350,
          height: 300,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: context.rh.superficie,
              border: BoxBorder.all(color: borderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: iconScale,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: context.rh.tinte(widget.bg, widget.color),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(widget.icon, color: widget.color)
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.category.label,
                  style: TextTheme.of(context).titleMedium?.copyWith(
                    fontWeight: .w700,
                    color: context.rh.titulo,
                  ),
                  textAlign: .center,
                ),
                Text(
                  widget.description,
                  style: TextTheme.of(context).labelMedium?.copyWith(
                    color: context.rh.etiqueta,
                  ),
                  textAlign: .center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navegador de celular: 8 tarjetas de 350x300 serían casi 2.5 pantallas de
  /// scroll, así que aquí cada una es una fila a todo el ancho (ícono a la
  /// izquierda, nombre y descripción a la derecha).
  Widget _buildMovil(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(Routes.newIncidenciaOfCategory(widget.category)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.rh.superficie,
          border: BoxBorder.all(color: context.rh.borde),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          spacing: 16,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: context.rh.tinte(widget.bg, widget.color),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(widget.icon, color: widget.color),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    widget.category.label,
                    style: TextTheme.of(context).titleMedium?.copyWith(
                      fontWeight: .w700,
                      color: context.rh.titulo,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: TextTheme.of(context).labelMedium?.copyWith(
                      color: context.rh.etiqueta,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: widget.color),
          ],
        ),
      ),
    );
  }
}
