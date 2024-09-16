import 'package:clean_abs/config/models/exercise.dart';

enum Difficulty { easy, medium, hard }

enum ExerciseType { superior, inferior, lateral, full }

class Routine {
  String name;
  String description;
  String image;
  Difficulty difficulty;
  List<ExerciseType> type;
  int duration;
  int? restPerExercise;
  int? restPerSet;
  int sets;
  int calories;
  List<Exercise> exercises;

  Routine({
    required this.name,
    required this.description,
    required this.image,
    required this.difficulty,
    required this.type,
    required this.duration,
    required this.restPerExercise,
    required this.restPerSet,
    required this.sets,
    required this.calories,
    required this.exercises,
  });
}
