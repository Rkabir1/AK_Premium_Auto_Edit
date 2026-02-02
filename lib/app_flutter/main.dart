import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AKApp());
}

class AKApp extends StatelessWidget {
  const AKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AK Premium Auto Edit',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
