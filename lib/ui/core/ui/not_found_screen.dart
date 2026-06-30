import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({
    super.key,
    this.message = 'Página no encontrada',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          CollapsibleSidebar(),
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Text(
                  '404',
                  style: TextTheme.of(context).displayLarge?.copyWith(
                    fontWeight: .w900,
                    color: headingTextColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  message,
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                    fontWeight: .w500,
                    color: labelTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}