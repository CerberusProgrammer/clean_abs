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

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'image': image,
        'difficulty': difficulty.index,
        'type': type.map((e) => e.index).toList(),
        'duration': duration,
        'restPerExercise': restPerExercise,
        'restPerSet': restPerSet,
        'sets': sets,
        'calories': calories,
        'exercises': exercises.map((e) => e.toJson()).toList(),
      };

  factory Routine.fromJson(Map<String, dynamic> json) => Routine(
        name: json['name'],
        description: json['description'],
        image: json['image'],
        difficulty: Difficulty.values[json['difficulty']],
        type:
            (json['type'] as List).map((e) => ExerciseType.values[e]).toList(),
        duration: json['duration'],
        restPerExercise: json['restPerExercise'],
        restPerSet: json['restPerSet'],
        sets: json['sets'],
        calories: json['calories'],
        exercises: (json['exercises'] as List)
            .map((e) => Exercise.fromJson(e))
            .toList(),
      );
}
