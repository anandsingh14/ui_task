import 'package:flutter/material.dart';

class RectangleInnerHighlight extends StatelessWidget {
  final Color highlightColor;
  final Color backgroundColor;

  const RectangleInnerHighlight({
    required this.highlightColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: RadialGradient(
          colors: [
            backgroundColor,
            highlightColor,
          ],
          center: AlignmentDirectional(-0.05, -0.05),
          focal: AlignmentDirectional(-0.05, -0.05),
          radius: 0.6,
          focalRadius: 0.1,
          stops: [0.75, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.55, 1],
            colors: [
              backgroundColor,
              backgroundColor.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}
