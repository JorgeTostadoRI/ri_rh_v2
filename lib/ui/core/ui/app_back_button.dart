import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class AppBackButton extends StatefulWidget {
  const AppBackButton({super.key});

  @override
  State<AppBackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<AppBackButton> {
  bool _hovering = false;

  // Al pasar el mouse: la superficie al 70% (en claro, Colors.white70).
  Color get buttonColor => _hovering ? context.rh.superficie.withAlpha(0xB3) : context.rh.fondo;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(
              color: context.rh.borde,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            LucideIcons.arrowLeft,
            color: context.rh.etiqueta,
          ),
        ),
      ),
    );
  }
}