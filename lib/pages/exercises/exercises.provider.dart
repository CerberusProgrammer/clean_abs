import 'package:clean_abs/config/models/exercise.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExercisesNotifier extends StateNotifier<List<Exercise>> {
  ExercisesNotifier(super.initialExercises);
}
