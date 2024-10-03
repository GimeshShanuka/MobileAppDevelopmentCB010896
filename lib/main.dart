import 'package:flutter/material.dart';
import 'package:mobileappdevelopment/screens/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.orange[700],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[700],
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange[700],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[700],
        ),
      ),
      themeMode: ThemeMode.system,
      home: const WelcomeScreen(),
    );
  }
}

