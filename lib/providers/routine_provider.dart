import 'package:clean_abs/config/models/routine_stat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoutineStatsNotifier extends StateNotifier<List<RoutineStat>> {
  RoutineStatsNotifier() : super([]);

  void addRoutineStat(RoutineStat routineStat) {
    state = [...state, routineStat];
  }
}

final routineStatsProvider =
    StateNotifierProvider<RoutineStatsNotifier, List<RoutineStat>>((ref) {
  return RoutineStatsNotifier();
});
