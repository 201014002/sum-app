import 'package:flutter/material.dart';
import 'package:sum_app/home_screen.dart';

void main() {
  runApp(const SumApp());
}

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: HomeScreen(),
    );
  }
}
