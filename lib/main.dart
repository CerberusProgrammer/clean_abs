import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme = GoogleFonts.rubikTextTheme(const TextTheme(
  displayLarge: TextStyle(fontSize: 30, color: Colors.white),
  displayMedium: TextStyle(fontSize: 20, color: Colors.white),
  displaySmall: TextStyle(fontSize: 15, color: Colors.white),
  labelLarge: TextStyle(fontSize: 20, color: Colors.white),
  labelMedium: TextStyle(fontSize: 12, color: Colors.white),
  labelSmall: TextStyle(fontSize: 10, color: Colors.white),
  bodyLarge: TextStyle(fontSize: 30, color: Colors.white),
  bodyMedium: TextStyle(fontSize: 20, color: Colors.white),
  bodySmall: TextStyle(fontSize: 15, color: Colors.white),
  titleLarge:
      TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
  titleMedium:
      TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
  titleSmall:
      TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
));

const ColorScheme colorScheme = ColorScheme(
  primary: Color(0xFFFF0055),
  secondary: Color(0xFF14151A),
  surface: Color(0xFF262626),
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: colorScheme.secondary,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.secondary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: textTheme.displayMedium,
        ),
        textTheme: textTheme,
        cardTheme: CardTheme(
          color: colorScheme.primary,
          elevation: 0,
          margin: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: colorScheme.secondary,
          padding: const EdgeInsets.all(10),
          side: BorderSide.none,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelStyle: textTheme.titleSmall,
          secondaryLabelStyle: textTheme.titleSmall,
          brightness: Brightness.dark,
        ),
        colorScheme: colorScheme,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Clean Abs'),
        ),
        body: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Card 1',
                      style: textTheme.titleMedium,
                    ),
                    const Chip(label: Text('Chip 1')),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
