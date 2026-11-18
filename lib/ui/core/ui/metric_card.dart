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
    final c = context.rh;

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: c.borde,
          width: 0.8
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      color: c.superficie,
      // Navegador de celular: van 2 por fila y a un lado del ícono no cabe
      // el texto; el ícono va arriba.
      child: esNavegadorMovil ? _movil(textTheme, c) : Padding(
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
                Text(label, style: textTheme.titleSmall?.copyWith(color: c.etiquetaSuave)),
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

  Widget _movil(TextTheme textTheme, RhColores c) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          ?icon,
          Text(label, style: textTheme.titleSmall?.copyWith(color: c.etiquetaSuave)),
          Text(value, style: textTheme.headlineSmall?.copyWith(fontSize: 24, height: 1.25)),
          if (subtitle != null)
            Text(subtitle!, style: textTheme.titleSmall),
        ],
      ),
    );
  }
}