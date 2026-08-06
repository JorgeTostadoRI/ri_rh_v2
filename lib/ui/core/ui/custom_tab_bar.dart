import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.controller,
    required this.options,
  });

  final TabController controller;
  final List<String> options;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  Widget option(int index, String label) {
    final selected = index == widget.controller.index;

    return InkWell(
      onTap: selected ? null : () => setState(() => widget.controller.animateTo(index)),
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: widget.controller.animationDuration,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Color(0xFFF5EDE0),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          label,
          style: optionTextStyle(selected),
        ),
      ),
    );
  }

  TextStyle optionTextStyle(bool selected) {
    final baseColor = Color(0xFF9A7B5A);
    return TextStyle(
      fontSize: 14,
      fontWeight: .w700,
      color: selected ? primaryColor : baseColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xFFF5EDE0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 4,
        children: [
          for (final (index, label) in widget.options.indexed)
            option(index, label)
        ],
      ),
    );
  }
}