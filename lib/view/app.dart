import 'package:crud01/view/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
 const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.grey.shade300,
          primarySwatch: Colors.green,
          accentColor: Colors.blueAccent,
        ),
      ),
      home: const Home(),
    );
  }
}