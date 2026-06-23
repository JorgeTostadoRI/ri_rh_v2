import 'package:flutter/material.dart';

class IncidenciaCategory {
  final String id;
  final String label;
  final IconData icon;
  final String description;
  final Color color;
  final Color bg;

  const IncidenciaCategory({
    required this.id,
    required this.label,
    required this.icon,
    required this.description,
    required this.color,
    required this.bg,
  });
}