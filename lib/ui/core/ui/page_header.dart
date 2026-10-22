import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/ui/app_back_button.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = false,
  });

  final String title;
  final String? subtitle;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      crossAxisAlignment: .start,
      children: [
        if (showBackButton)
          const AppBackButton(),
        // Sin Expanded, el Text de abajo recibe ancho sin límite dentro del
        // Row y nunca hace salto de línea -- con un título largo (ej. el
        // nombre completo de un empleado) y la ventana angosta, se
        // desborda. Expanded lo limita al espacio disponible para que
        // pueda hacer wrap en vez de desbordarse.
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(title, style: TextTheme.of(context).headlineLarge?.copyWith(fontSize: 48)),
              if (subtitle != null)
                Text(subtitle!, style: TextTheme.of(context).titleSmall),
            ],
          ),
        ),
      ],
    );
  }
}