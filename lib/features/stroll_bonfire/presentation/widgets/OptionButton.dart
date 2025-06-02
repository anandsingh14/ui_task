import 'package:flutter/material.dart';
import 'package:ui_task/core/color_manager.dart';

class OptionButton extends StatelessWidget {
  final String label;
  final String text;
  final bool selected;
  final bool highlighted;
  final VoidCallback onTap;

  const OptionButton({
    super.key,
    required this.label,
    required this.text,
    this.selected = false,
    this.highlighted = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: highlighted
                ? ColorManager.primary.withOpacity(0.2)
                : Colors.grey.shade800,
            border: Border.all(
              color: selected || highlighted
                  ? ColorManager.primary
                  : Colors.grey.shade800,
              width: selected || highlighted ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: selected || highlighted
                      ? ColorManager.primary
                      : ColorManager.icon, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: TextStyle(
                    color: ColorManager.icon,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontWeight:
                        selected || highlighted ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
