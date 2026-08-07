import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    super.key,
    required this.icon,
    required this.title,
    this.children = const <Widget>[],
  });

  final IconData icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          spacing: 24,
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            Row(
              spacing: 12,
              children: [
                _IconContainer(icon: icon),
                Flexible(
                  child: Text(
                    title,
                    style: TextTheme.of(context).headlineSmall?.copyWith(fontWeight: .w700),
                    overflow: .ellipsis,
                  ),
                ),
              ],
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  const _IconContainer({
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        icon,
        color: primaryColor,
        size: 20,
      ),
    );
  }
}
