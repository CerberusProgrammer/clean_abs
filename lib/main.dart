import 'package:clean_abs/config/theme/theme.dart';
import 'package:clean_abs/home.screen.dart';
import 'package:clean_abs/routine.screen.dart';
import 'package:clean_abs/routine-timer.view.dart';
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
            final parts = settings.name!.split('/');
            if (parts.length == 4 && parts[3] == 'workout') {
              final id = parts[2];
              return MaterialPageRoute(
                builder: (context) => RoutineTimerView(id: id),
              );
            } else if (parts.length == 3) {
              final id = parts[2];
              return MaterialPageRoute(
                builder: (context) => RoutineScreen(id: id),
              );
            }
          }
          return null;
        },
        routes: {
          '/': (context) => const HomeScreen(),
        });
  }
}
