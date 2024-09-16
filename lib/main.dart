import 'package:flutter/material.dart';

const Map<String, TextStyle> textTheme = {
  'displayLarge': TextStyle(fontSize: 30, color: Colors.white),
  'displayMedium': TextStyle(fontSize: 20, color: Colors.white),
  'displaySmall': TextStyle(fontSize: 15, color: Colors.white),
  'labelLarge': TextStyle(fontSize: 30, color: Colors.white),
  'labelMedium': TextStyle(fontSize: 20, color: Colors.white),
  'labelSmall': TextStyle(fontSize: 15, color: Colors.white),
  'bodyLarge': TextStyle(fontSize: 30, color: Colors.white),
  'bodyMedium': TextStyle(fontSize: 20, color: Colors.white),
  'bodySmall': TextStyle(fontSize: 15, color: Colors.white),
  'titleLarge': TextStyle(fontSize: 30, color: Colors.white),
  'titleMedium': TextStyle(fontSize: 20, color: Colors.white),
  'titleSmall': TextStyle(fontSize: 15, color: Colors.white),
};

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: const Color(0xFF14151A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF14151A),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          displayLarge: textTheme['displayLarge'],
          displayMedium: textTheme['displayMedium'],
          displaySmall: textTheme['displaySmall'],
          labelLarge: textTheme['labelLarge'],
          labelMedium: textTheme['labelMedium'],
          labelSmall: textTheme['labelSmall'],
          bodyLarge: textTheme['bodyLarge'],
          bodyMedium: textTheme['bodyMedium'],
          bodySmall: textTheme['bodySmall'],
          titleLarge: textTheme['titleLarge'],
          titleMedium: textTheme['titleMedium'],
          titleSmall: textTheme['titleSmall'],
        ),
        cardTheme: const CardTheme(
          color: Color(0xFFFF0055),
          elevation: 0,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: Color(0xFF14151A),
          padding: EdgeInsets.all(10),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          secondaryLabelStyle: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Clean Abs'),
        ),
        body: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Card 1',
                      style: textTheme['titleMedium'],
                    ),
                    const Chip(label: Text('Chip 1')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
