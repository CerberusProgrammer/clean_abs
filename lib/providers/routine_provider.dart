import 'dart:convert';
import 'package:clean_abs/config/models/routine_stat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoutineStatsNotifier extends StateNotifier<List<RoutineStat>> {
  RoutineStatsNotifier() : super([]) {
    _loadRoutineStats();
  }

  void addRoutineStat(RoutineStat routineStat) {
    state = [...state, routineStat];
    _saveRoutineStats();
  }

  Future<void> _saveRoutineStats() async {
    final prefs = await SharedPreferences.getInstance();
    final routineStatsJson =
        state.map((stat) => jsonEncode(stat.toJson())).toList();
    await prefs.setStringList('routineStats', routineStatsJson);
  }

  Future<void> _loadRoutineStats() async {
    final prefs = await SharedPreferences.getInstance();
    final routineStatsJson = prefs.getStringList('routineStats') ?? [];
    state = routineStatsJson
        .map((json) => RoutineStat.fromJson(jsonDecode(json)))
        .toList();
  }
}

final routineStatsProvider =
    StateNotifierProvider<RoutineStatsNotifier, List<RoutineStat>>((ref) {
  return RoutineStatsNotifier();
});
