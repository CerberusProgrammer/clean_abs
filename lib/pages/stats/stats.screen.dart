import 'package:clean_abs/providers/routine_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineStats = ref.watch(routineStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stats'),
      ),
      body: routineStats.isEmpty
          ? const Center(
              child: Text('No routines completed yet'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: routineStats.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ExpansionTile(
                    title: Text(routineStats[index].routine.name),
                    subtitle: Text(
                        'Completed on ${DateFormat('yyyy MMM dd, h:mm a').format(routineStats[index].endTime.toLocal())}'),
                    children: routineStats[index]
                        .exerciseStats
                        .map((exerciseStat) => ListTile(
                              title: Text(exerciseStat.exercise.name),
                              subtitle: Text(
                                  'You did ${exerciseStat.exercise.repetitions != null ? '${exerciseStat.exercise.repetitions} Repetitions in ${exerciseStat.duration.inSeconds} Seconds' : '${exerciseStat.exercise.duration} Seconds'} '),
                            ))
                        .toList(),
                  ),
                );
              },
            ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) {
          if (index == 0) {
            context.go('/');
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
