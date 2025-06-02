import 'package:flutter/material.dart';

class RectangleInnerShadow extends StatelessWidget {
  final Color shadowColor;
  final Color backgroundColor;

  const RectangleInnerShadow({
    required this.shadowColor,
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
            shadowColor,
          ],
          center: AlignmentDirectional(0.05, 0.05),
          focal: AlignmentDirectional(0, 0),
          radius: 0.5,
          focalRadius: 0,
          stops: [0.75, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 0.45],
            colors: [
              backgroundColor.withOpacity(0),
              backgroundColor,
            ],
          ),
        ),
      ),
    );
  }
}