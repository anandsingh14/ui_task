
import 'package:flutter/material.dart';
import 'RectangleInnerHighlight.dart';
import 'RectangleInnerShadow.dart';

class NeumorphicRectangle extends StatelessWidget {
  final bool innerShadow;
  final bool outerShadow;
  final Color highlightColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Widget child;

  const NeumorphicRectangle({
    required this.innerShadow,
    required this.outerShadow,
    required this.highlightColor,
    required this.shadowColor,
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: outerShadow
                ? [
              BoxShadow(
                color: highlightColor,
                offset: Offset(-10, -10),
                blurRadius: 20,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: shadowColor,
                offset: Offset(10, 10),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ]
                : null,
          ),
        ),
        if (innerShadow)
          Positioned.fill(
            child: RectangleInnerHighlight(
              highlightColor: highlightColor,
              backgroundColor: backgroundColor,
            ),
          ),
        if (innerShadow)
          Positioned.fill(
            child: RectangleInnerShadow(
              shadowColor: shadowColor,
              backgroundColor: backgroundColor,
            ),
          ),
        child,
      ],
    );
  }
}