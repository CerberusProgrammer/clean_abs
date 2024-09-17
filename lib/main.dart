import 'package:clean_abs/config/theme/theme.dart';
import 'package:clean_abs/home.screen.dart';
import 'package:clean_abs/routine.screen.dart';
import 'package:flutter/material.dart';

 void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        onGenerateRoute: (settings) {
          if (settings.name!.startsWith('/routine/')) {
            final id = settings.name!.replaceFirst('/routine/', '');
            return MaterialPageRoute(
              builder: (context) => RoutineScreen(id: id),
            );
          }
          return null;
        },
        routes: {
          '/': (context) => const HomeScreen(),
        });
  }
}
