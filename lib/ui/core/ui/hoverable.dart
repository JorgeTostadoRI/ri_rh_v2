import 'package:flutter/material.dart';

class Hoverable extends StatelessWidget {
  const Hoverable({
    super.key,
    this.child,
    this.cursor = MouseCursor.defer,
    required this.onHover,
  });

  final Widget? child;
  final MouseCursor cursor;
  final void Function(bool isHovering) onHover;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      cursor: cursor,
      child: child,
    );
  }
}