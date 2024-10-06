import 'package:clean_abs/config/data/exercises.dart';
import 'package:clean_abs/pages/exercises/exercises.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exercisesProvider =
    StateNotifierProvider<ExercisesNotifier, ExercisesState>((ref) {
  return ExercisesNotifier(ref);
});

class ExercisesNotifier extends StateNotifier<ExercisesState> {
  final Ref ref;

  ExercisesNotifier(this.ref)
      : super(ExercisesState(
          exercises: exercises,
          isLoading: false,
          hasError: false,
        ));
}
