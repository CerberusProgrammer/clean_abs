import 'package:clean_abs/components/card.routine.dart';
import 'package:clean_abs/config/data/routines.dart';
import 'package:clean_abs/config/theme/color.theme.dart';
import 'package:clean_abs/config/theme/text.theme.dart';
import 'package:flutter/material.dart';

class RoutineScreen extends StatelessWidget {
  final String id;

  const RoutineScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final routine = routines.firstWhere((routine) => routine.name == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(routine.name),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          CardRoutine(routine: routine),
          Card(
            color: colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(routine.description, style: textTheme.bodyMedium),
            ),
          ),
          ...routine.exercises.map((exercise) => Card(
              color: colorScheme.surface,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    exercise.name,
                    style: textTheme.bodyLarge,
                  )))),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          }
        },
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
    );
  }
}
