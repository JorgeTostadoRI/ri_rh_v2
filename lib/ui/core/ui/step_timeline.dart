import 'package:flutter/material.dart';

class StepTimeline extends StatelessWidget {
  const StepTimeline({
    super.key,
    required this.length,
    required this.currentStep,
  });

  final int length;
  final int currentStep;

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

              return Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? Colors.green : Colors.grey[300],
                  border: isCurrent
                      ? Border.all(color: Colors.green, width: 1.5)
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
            } else {
              final connectorIndex = index ~/ 2;
              final isCompleted = connectorIndex < currentStep;

              return SizedBox(
                width: 12,
                child: Container(
                  height: 1.5,
                  color: isCompleted ? Colors.green : Colors.grey[300],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}