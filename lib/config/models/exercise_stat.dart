import 'package:clean_abs/config/models/exercise.dart';

class ExerciseStat {
  final Exercise exercise;
  final Duration duration;
  final DateTime startTime;
  final DateTime endTime;

  ExerciseStat({
    required this.exercise,
    required this.duration,
    required this.startTime,
    required this.endTime,
  });
}
