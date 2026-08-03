import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class ColorIcon extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final double width;
  final double height;
  final BoxShape shape;
  final IconData icon;

  const ColorIcon({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.width = 48.0,
    this.height = 48.0,
    this.shape = BoxShape.rectangle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: shape == BoxShape.rectangle ? BorderRadius.circular(15) : null,
        shape: shape,
      ),
      child: Icon(icon, color: iconColor ?? primaryColor),
    );
  }
}