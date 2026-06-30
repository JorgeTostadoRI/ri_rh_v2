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

  Color get buttonColor => _hovering ? Colors.white70 : backgroundColor;

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
              color: Color(0xFFF5E8D8),
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            LucideIcons.arrowLeft,
            color: Color(0xFF9A7B5A),
          ),
        ),
      ),
    );
  }
}