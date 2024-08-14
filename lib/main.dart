import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'input_page.dart';
import 'results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/resultsPage': (context) => ResultsPage(),
      },
    );
  }
}
