import 'package:clean_abs/config/models/routine.dart';
import 'package:clean_abs/providers/routines_provider.dart';
import 'package:clean_abs/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../components/card.routine.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routines = ref.watch(routinesProvider);
    final filter = ref.watch(difficultyFilterProvider);

    final filteredRoutines = filter == DifficultyFilter.all
        ? routines
        : routines.where((routine) {
            switch (filter) {
              case DifficultyFilter.easy:
                return routine.difficulty == Difficulty.easy;
              case DifficultyFilter.medium:
                return routine.difficulty == Difficulty.medium;
              case DifficultyFilter.hard:
                return routine.difficulty == Difficulty.hard;
              case DifficultyFilter.all:
              default:
                return true;
            }
          }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Abs'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: DifficultyFilter.values.map((filterValue) {
                if (filterValue == DifficultyFilter.all) return Container();
                return FilterChip(
                  label: Text(filterValue.name),
                  selected: filter == filterValue,
                  onSelected: (isSelected) {
                    ref.read(difficultyFilterProvider.notifier).setFilter(
                        isSelected ? filterValue : DifficultyFilter.all);
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    children: filteredRoutines
                        .map((routine) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: CardRoutine(
                                  routine: routine,
                                  onTap: () =>
                                      context.go('/routine/${routine.name}')),
                            ))
                        .toList(),
                  );
                } else {
                  int columns = 2;
                  if (constraints.maxWidth > 1000) {
                    columns = 3;
                  }
                  if (constraints.maxWidth > 1400) {
                    columns = 4;
                  }
                  if (constraints.maxWidth > 1800) {
                    columns = 5;
                  }

                  final itemWidth =
                      (constraints.maxWidth - (16 * (columns + 1))) / columns;

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: filteredRoutines.map((routine) {
                        return SizedBox(
                          width: itemWidth,
                          child: CardRoutine(
                            routine: routine,
                            onTap: () => context.go('/routine/${routine.name}'),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          if (index == 1) {
            context.go('/stats');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
