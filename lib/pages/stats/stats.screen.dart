import 'package:clean_abs/config/theme/color.theme.dart';
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
    routineStats.sort((a, b) => b.endTime.compareTo(a.endTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stats of your week'),
      ),
      body: routineStats.isEmpty
          ? const Center(
              child: Text('No routines completed yet'),
            )
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: const Text('Total calories burned'),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: LinearProgressIndicator(
                            minHeight: 20,
                            borderRadius: BorderRadius.circular(10),
                            value: routineStats.where((stat) {
                                  DateTime now = DateTime.now();
                                  DateTime startOfWeek = now.subtract(
                                      Duration(days: now.weekday - 1));
                                  DateTime endOfWeek =
                                      startOfWeek.add(Duration(days: 6));
                                  return stat.startTime.isAfter(startOfWeek) &&
                                      stat.startTime.isBefore(endOfWeek);
                                }).fold(
                                    0.0,
                                    (previousValue, element) =>
                                        previousValue +
                                        element.caloriesBurned) /
                                1000,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${routineStats.where((stat) {
                          DateTime now = DateTime.now();
                          DateTime startOfWeek =
                              now.subtract(Duration(days: now.weekday - 1));
                          DateTime endOfWeek =
                              startOfWeek.add(Duration(days: 6));
                          return stat.startTime.isAfter(startOfWeek) &&
                              stat.startTime.isBefore(endOfWeek);
                        }).fold(0, (previousValue, element) => previousValue + element.caloriesBurned)} kCal',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ListTile(
                  title: const Text('Daily progress'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text('Calories burned')),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: CircularProgressIndicator(
                            value: routineStats.fold(
                                    0.0,
                                    (previousValue, element) =>
                                        previousValue +
                                        element.caloriesBurned) /
                                400,
                            strokeWidth: 20,
                            strokeCap: StrokeCap.round,
                            backgroundColor: colorScheme.secondary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ...List.generate(
                  routineStats.length,
                  (index) => Padding(
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
                  ),
                ),
              ],
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
