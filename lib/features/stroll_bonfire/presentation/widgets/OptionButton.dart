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
          width: 166,
          height: 63,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: highlighted
                ? ColorManager.primary.withOpacity(0.2)
                : Color(0xFF232A2E), // background color #232A2E
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected || highlighted
                  ? ColorManager.primary
                  : Color(0xFF232A2E), // border color
              width: selected || highlighted
                  ? 2
                  : 1, // border width
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x4D000000), // #0000004D
                offset: Offset(-1, -1),
                blurRadius: 2,
                spreadRadius: 0,
                  // inset shadows aren't supported directly, see note below
              ),
              BoxShadow(
                color: Color(0x4D484848), // #4848484D
                offset: Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 0,

              ),
              BoxShadow(
                color: Color(0x4D000000),
                offset: Offset(2, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: selected || highlighted
                      ? ColorManager.primary
                      : Colors.transparent,
                  border: Border.all(color: selected || highlighted
                      ? ColorManager.primary
                      : ColorManager.icon, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.05,
                    letterSpacing: 0,
                    color: selected || highlighted ? ColorManager.white : Color(0xFFC4C4C4),  // Hex color #C4C4C4
                  )
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.05,
                    letterSpacing: 0,
                    color: Color(0xFFC4C4C4),  // Hex color #C4C4C4
                  )
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
