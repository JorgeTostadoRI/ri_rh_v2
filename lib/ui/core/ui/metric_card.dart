import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

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
      child: Padding(
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
}