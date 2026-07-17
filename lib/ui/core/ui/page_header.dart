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
      mainAxisSize: .min,
      children: [
        if (showBackButton)
          const AppBackButton(),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(title, style: TextTheme.of(context).headlineLarge?.copyWith(fontSize: 48)),
            if (subtitle != null)
              Text(subtitle!, style: TextTheme.of(context).titleSmall),
          ],
        ),
      ],
    );
  }
}