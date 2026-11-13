import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

class MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String? subtitle;
  final Widget? icon;

  const MetricCard({
    super.key,
    required this.label,
    required this.value,
    this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor,
          width: 0.8
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      // Navegador de celular: van 2 por fila y a un lado del ícono no cabe
      // el texto; el ícono va arriba.
      child: esNavegadorMovil ? _movil(textTheme) : Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: icon ?? SizedBox.shrink(),
            ),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(label, style: textTheme.titleSmall?.copyWith(color: const Color(0xFFC4A47A))),
                Text(value, style: textTheme.headlineSmall?.copyWith(fontSize: 24, height: 1.25)),
                if (subtitle != null)
                  Text(subtitle!, style: textTheme.titleSmall)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _movil(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          ?icon,
          Text(label, style: textTheme.titleSmall?.copyWith(color: const Color(0xFFC4A47A))),
          Text(value, style: textTheme.headlineSmall?.copyWith(fontSize: 24, height: 1.25)),
          if (subtitle != null)
            Text(subtitle!, style: textTheme.titleSmall),
        ],
      ),
    );
  }
}