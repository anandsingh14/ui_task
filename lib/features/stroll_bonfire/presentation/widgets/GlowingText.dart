import 'dart:ui';
import 'package:flutter/material.dart';

class GlowingText extends StatelessWidget {
  const GlowingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Glowing blurred shadow behind text
        Text(
          'Stroll Bonfire',
          style: TextStyle(
            fontFamily: 'ProximaNova',
            fontWeight: FontWeight.w700,
            fontSize: 34,
            color: Colors.transparent, // invisible text
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Color(0x33000000),
                offset: Offset(0, 0),
              ),
              Shadow(
                blurRadius: 9,
                color: Color(0xFFBEBEBE),
                offset: Offset(0, 0),
              ),
              Shadow(
                blurRadius: 6,
                color: Color(0x8024232F),
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),

        // Optional glow using blurred container (fake text glow background)
        Positioned(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Text(
              'Stroll Bonfire',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w700,
                fontSize: 34,
                color: Color(0xFFB3ADF6).withOpacity(0.2), // soft blur glow
              ),
            ),
          ),
        ),

        // Foreground text
        Text(
          'Stroll Bonfire',
          style: TextStyle(
            fontFamily: 'ProximaNova',
            fontWeight: FontWeight.w700,
            fontSize: 34,
            color: Color(0xFFCCC8FF),
          ),
        ),
      ],
    );
  }
}
