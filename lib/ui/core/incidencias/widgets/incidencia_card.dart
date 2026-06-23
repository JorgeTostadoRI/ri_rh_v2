import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class IncidenciaCategoryCard extends StatefulWidget {
  const IncidenciaCategoryCard({
    super.key,
    required this.category,
  });

  final IncidenciaCategory category;

  @override
  State<IncidenciaCategoryCard> createState() => _IncidenciaCardState();
}

class _IncidenciaCardState extends State<IncidenciaCategoryCard> {
  bool _hovering = false;

  Color get borderColor => _hovering ? widget.category.color : Color(0xFFF5E8D8);
  double get iconScale => _hovering ? 1.1 : 1.0;

  @override
  Widget build(BuildContext context) {
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
              color: Colors.white,
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
                      color: widget.category.bg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(widget.category.icon, color: widget.category.color)
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.category.label,
                  style: TextTheme.of(context).titleMedium?.copyWith(
                    fontWeight: .w700,
                    color: headingTextColor,
                  ),
                  textAlign: .center,
                ),
                Text(
                  widget.category.description,
                  style: TextTheme.of(context).labelMedium?.copyWith(
                    color: labelTextColor,
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
}