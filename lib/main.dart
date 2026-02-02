import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AKAutoEdit());
}

class AKAutoEdit extends StatelessWidget {
  const AKAutoEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AK Premium Auto Edit',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
