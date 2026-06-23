import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class IncidenciaCard extends StatefulWidget {
  const IncidenciaCard({
    super.key,
    required this.incidencia,
  });

  final IncidenciaCategory incidencia;

  @override
  State<IncidenciaCard> createState() => _IncidenciaCardState();
}

class _IncidenciaCardState extends State<IncidenciaCard> {
  bool _hovering = false;

  Color get borderColor => _hovering ? widget.incidencia.color : Color(0xFFF5E8D8);
  double get iconScale => _hovering ? 1.1 : 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
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
                    color: widget.incidencia.bg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(widget.incidencia.icon, color: widget.incidencia.color)
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.incidencia.label,
                style: TextTheme.of(context).titleMedium?.copyWith(
                  fontWeight: .w700,
                  color: headingTextColor,
                ),
                textAlign: .center,
              ),
              Text(
                widget.incidencia.description,
                style: TextTheme.of(context).labelMedium?.copyWith(
                  color: labelTextColor,
                ),
                textAlign: .center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}