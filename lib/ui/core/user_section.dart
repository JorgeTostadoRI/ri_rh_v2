import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class UserSection extends StatelessWidget {
  /// A [Widget] that renders a small Avatar circle with the user initials,
  /// the user's name and their department's name.
  const UserSection({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final parts = user.nombre.trim().split(RegExp(r'\s+'));
    final initials = parts.map((part) => part.substring(0, 1)).take(2).join();

    return Row(
      spacing: 12,
      mainAxisSize: .min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              initials.toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            Text(
              user.nombre,
              style: textTheme.headlineSmall?.copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              user.departamento.nombre,
              style: textTheme.labelMedium,
            ),
          ],
        ),
      ],
    );
  }
}