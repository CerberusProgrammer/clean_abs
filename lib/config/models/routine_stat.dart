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

  Map<String, dynamic> toJson() => {
        'routine': routine.toJson(),
        'exerciseStats': exerciseStats.map((e) => e.toJson()).toList(),
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
        'caloriesBurned': caloriesBurned,
      };

  factory RoutineStat.fromJson(Map<String, dynamic> json) => RoutineStat(
        routine: Routine.fromJson(json['routine']),
        exerciseStats: (json['exerciseStats'] as List)
            .map((e) => ExerciseStat.fromJson(e))
            .toList(),
        startTime: DateTime.parse(json['startTime']),
        endTime: DateTime.parse(json['endTime']),
        caloriesBurned: json['caloriesBurned'],
      );
}
