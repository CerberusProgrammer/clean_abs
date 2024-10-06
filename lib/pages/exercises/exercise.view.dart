import 'package:clean_abs/pages/exercises/exercises.provider.dart';
import 'package:clean_abs/pages/home.layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseView extends ConsumerWidget {
  final String? name;

  const ExerciseView({
    super.key,
    this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercisesState = ref.watch(exercisesProvider);
    final exercises =
        exercisesState.exercises?.where((e) => e.name == name).toList();

    return HomeLayout(
      title: "Exercises",
      body: exercises != null && exercises.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    title: Text(exercise.name),
                    onTap: () {},
                  ),
                );
              },
            )
          : const Center(child: Text('No exercises found')),
    );
  }
}
