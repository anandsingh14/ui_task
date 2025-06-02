import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  const TimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Optional for contrast
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFB3ADF6),
              width: 0.32,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000), // #00000033
                blurRadius: 7.9,
              ),
              BoxShadow(
                color: Color(0xFFBEBEBE),
                blurRadius: 2,
              ),
              BoxShadow(
                color: Color(0x8024232F), // #24232F80
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8), // Optional: Add if needed
          ),
          child: const Text(
            '22h 00m',
            style: TextStyle(
              fontFamily: 'ProximaNova', // Ensure you add this to pubspec.yaml
              fontWeight: FontWeight.w700,
              fontSize: 34,
              height: 1.0, // 100% line height
              letterSpacing: 0,
              color: Color(0xFFCCC8FF),
            ),
          ),
        ),
      ),
    );
  }
}
