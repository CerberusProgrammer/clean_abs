import 'package:clean_abs/components/card.routine.dart';
import 'package:clean_abs/config/data/routines.dart';
import 'package:clean_abs/config/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Clean Abs'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: routines
              .map((routine) => CardRoutine(
                    routine: routine,
                    onTap: () {},
                  ))
              .toList(),
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
