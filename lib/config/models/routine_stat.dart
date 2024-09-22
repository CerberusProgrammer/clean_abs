import 'package:clean_abs/config/models/exercise_stat.dart';
import 'package:clean_abs/config/models/routine.dart';

class RoutineStat {
  final Routine routine;
  final List<ExerciseStat> exerciseStats;
  final DateTime startTime;
  final DateTime endTime;
  final int caloriesBurned;

  RoutineStat({
    required this.routine,
    required this.exerciseStats,
    required this.startTime,
    required this.endTime,
    required this.caloriesBurned,
  });

  Duration get totalDuration => endTime.difference(startTime);
}
