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
          CardRoutine(
            routine: routine,
            extraChips: ['${routine.sets} sets'],
          ),
          const SizedBox(height: 8),
          Card(
            color: colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(routine.description, style: textTheme.bodyMedium),
            ),
          ),
          const SizedBox(height: 4),
          ...routine.exercises.map((exercise) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ExpansionTile(
                  title: Text(
                    exercise.name,
                    style: textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    "${exercise.repetitions} Repetitions",
                    style: textTheme.bodySmall,
                  ),
                  children: [
                    Text(
                      exercise.description,
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  =>
                    Navigator.pushNamed(context, '/routine/${routine.name}/workout'),
        child: const Icon(Icons.play_arrow),
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
