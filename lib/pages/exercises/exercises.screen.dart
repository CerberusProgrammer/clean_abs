import 'package:clean_abs/pages/exercises/exercises.provider.dart';
import 'package:clean_abs/pages/home.layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExercisesScreen extends ConsumerWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercisesState = ref.watch(exercisesProvider);

    if (exercisesState.isLoading == true) {
      return const Center(child: CircularProgressIndicator());
    }

    if (exercisesState.hasError == true) {
      return const Center(child: Text('An error occurred'));
    }

    final exercises = exercisesState.exercises ?? [];

    return HomeLayout(
      title: "Exercises",
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              title: Text(exercise.name),
              onTap: () => context.push("/exercises/${exercise.name}"),
            ),
          );
        },
      ),
    );
  }
}
