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

  Map<String, dynamic> toJson() => {
        'exercise': exercise.toJson(),
        'duration': duration.inSeconds,
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
      };

  factory ExerciseStat.fromJson(Map<String, dynamic> json) => ExerciseStat(
        exercise: Exercise.fromJson(json['exercise']),
        duration: Duration(seconds: json['duration']),
        startTime: DateTime.parse(json['startTime']),
        endTime: DateTime.parse(json['endTime']),
      );
}
