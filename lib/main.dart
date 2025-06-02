import 'package:flutter/material.dart';

import 'features/stroll_bonfire/presentation/pages/StrollBonfirePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stroll Bonfire',
      theme: ThemeData.dark(useMaterial3: true),
      home: const StrollBonfirePage(),
    );
  }
}
