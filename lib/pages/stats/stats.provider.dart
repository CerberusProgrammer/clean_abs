import 'package:clean_abs/config/models/exercise_stat.dart';
import 'package:clean_abs/config/models/routine_stat.dart';
import 'package:clean_abs/providers/routine_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsNotifier extends StateNotifier<List<RoutineStat>> {
  StatsNotifier(super.initialStats);

  List<RoutineStat> getRoutineStatsForWeek(DateTime now) {
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
    return state
        .where((stat) =>
            stat.startTime.isAfter(startOfWeek) &&
            stat.startTime.isBefore(endOfWeek))
        .toList();
  }

  List<ExerciseStat> getExerciseStatsForWeek(DateTime now) {
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
    return state
        .where((stat) =>
            stat.startTime.isAfter(startOfWeek) &&
            stat.startTime.isBefore(endOfWeek))
        .expand((stat) => stat.exerciseStats)
        .toList();
  }

  int getTotalCaloriesBurnedForWeek(DateTime now) {
    return getRoutineStatsForWeek(now).fold(
        0, (previousValue, element) => previousValue + element.caloriesBurned);
  }

  int getTotalCaloriesBurnedForDay(DateTime now) {
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = startOfDay.add(Duration(days: 1));
    return state
        .where((stat) =>
            stat.startTime.isAfter(startOfDay) &&
            stat.startTime.isBefore(endOfDay))
        .fold(0,
            (previousValue, element) => previousValue + element.caloriesBurned);
  }

  int getTotalRoutinesCompletedForDay(DateTime now) {
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = startOfDay.add(Duration(days: 1));
    return state
        .where((stat) =>
            stat.startTime.isAfter(startOfDay) &&
            stat.startTime.isBefore(endOfDay))
        .length;
  }

  int getTotalExercisesCompletedForDay(DateTime now) {
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = startOfDay.add(Duration(days: 1));
    return state
        .where((stat) =>
            stat.startTime.isAfter(startOfDay) &&
            stat.startTime.isBefore(endOfDay))
        .fold(
            0,
            (previousValue, element) =>
                previousValue + element.exerciseStats.length);
  }
}

final statsProvider =
    StateNotifierProvider<StatsNotifier, List<RoutineStat>>((ref) {
  final routineStats = ref.watch(routineStatsProvider);
  return StatsNotifier(routineStats);
});
