import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results_page': (context) => ResultsPage(),
      },
    );
  }
}
