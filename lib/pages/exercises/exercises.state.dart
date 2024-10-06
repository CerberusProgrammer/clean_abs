import 'package:clean_abs/config/models/exercise.dart';

class ExercisesState {
  final List<Exercise>? exercises;
  final bool? isLoading;
  final bool? hasError;

  ExercisesState({
    this.exercises = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  ExercisesState copyWith({
    List<Exercise>? exercises,
    bool? isLoading,
    bool? hasError,
  }) {
    return ExercisesState(
      exercises: exercises,
      isLoading: isLoading,
      hasError: hasError,
    );
  }
}
