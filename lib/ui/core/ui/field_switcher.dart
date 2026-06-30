import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class FieldSwitcher extends StatelessWidget {
  const FieldSwitcher({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.options,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<String> options;

  Widget option(int index, String label) {
    final selected = index == selectedIndex;

    return InkWell(
      onTap: selected ? null : () => onSelected(index),
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
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
          for (final (index, label) in options.indexed)
            option(index, label)
        ],
      ),
    );
  }
}