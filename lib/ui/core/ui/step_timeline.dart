import 'package:flutter/material.dart';

class StepTimeline extends StatelessWidget {
  const StepTimeline({
    super.key,
    required this.length,
    required this.currentStep,
    this.stepLabels,
    this.color = Colors.green,
  });

  final int length;
  final int currentStep;

  /// Nombre de cada paso (mismo orden/longitud que `length`) -- si se da,
  /// cada punto se envuelve en un [Tooltip] para que, al pasar el mouse
  /// encima (o mantener presionado en touch), se vea de qué paso se trata.
  final List<String>? stepLabels;

  /// Color de los puntos/conectores ya completados -- verde por default.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          length * 2 - 1,
          (index) {
            if (index % 2 == 0) {
              final stageIndex = index ~/ 2;
              final isCompleted = stageIndex <= currentStep;
              final isCurrent = stageIndex == currentStep;

              final dot = Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? color : Colors.grey[300],
                  border: isCurrent
                      ? Border.all(color: color, width: 1.5)
                      : null,
                ),
                child: Center(
                  child: Text(
                    '${stageIndex + 1}',
                    style: TextStyle(
                      color: isCompleted ? Colors.white : Colors.grey,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
              final label = stepLabels != null && stageIndex < stepLabels!.length
                  ? stepLabels![stageIndex]
                  : null;
              return label == null ? dot : Tooltip(message: label, child: dot);
            } else {
              final connectorIndex = index ~/ 2;
              final isCompleted = connectorIndex < currentStep;

              return SizedBox(
                width: 12,
                child: Container(
                  height: 1.5,
                  color: isCompleted ? color : Colors.grey[300],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}