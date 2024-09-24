import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DifficultyFilter { easy, medium, hard, all }

class DifficultyFilterNotifier extends StateNotifier<DifficultyFilter> {
  DifficultyFilterNotifier() : super(DifficultyFilter.all);

  void setFilter(DifficultyFilter filter) {
    state = filter;
  }
}

final difficultyFilterProvider =
    StateNotifierProvider<DifficultyFilterNotifier, DifficultyFilter>((ref) {
  return DifficultyFilterNotifier();
});
