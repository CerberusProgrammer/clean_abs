import 'package:clean_abs/pages/home.layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExercisesScreen extends ConsumerWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercisesProvider = ref.watch(exercisesProvider);

    return HomeLayout(
      title: "Exercises",
      body: ListView.builder(
        itemCount: ref.watch(exercisesProvider).length,
        itemBuilder: (context, index) {
          final exercise = ref.watch(exercisesProvider)[index];
          return ListTile(
            title: Text(exercise.name),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/exercise',
                arguments: exercise,
              );
            },
          );
        },
      ),
    );
  }
}
