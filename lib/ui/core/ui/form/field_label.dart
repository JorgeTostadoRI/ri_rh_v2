import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({
    super.key,
    required this.labelText,
    this.required = false,
  });

  final String labelText;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final fieldLabelStyle = TextTheme.of(context).labelLarge?.copyWith(
      fontSize: 18,
      fontWeight: .w700,
      color: headingTextColor,
    );
    final requiredFieldStyle = TextTheme.of(context).labelLarge?.copyWith(
      fontSize: 18,
      fontWeight: .w700,
      color: primaryColor,
    );

    return Row(
      spacing: 8,
      children: [
        Text(labelText, style: fieldLabelStyle),
        if (required)
          Text('*', style: requiredFieldStyle)
      ],
    );
  }
}