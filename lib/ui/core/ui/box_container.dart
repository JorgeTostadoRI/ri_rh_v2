import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class BoxContainer extends StatelessWidget {
  const BoxContainer({
    super.key,
    this.height,
    this.child,
  });

  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: borderColor,
          width: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: -1,
          ),
        ],
      ),
      child: child ?? SizedBox.shrink(),
    );
  }
}