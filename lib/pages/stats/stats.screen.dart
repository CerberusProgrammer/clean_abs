import 'package:clean_abs/config/theme/color.theme.dart';
import 'package:clean_abs/pages/home.layout.dart';
import 'package:clean_abs/pages/stats/stats.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineStats = ref.watch(statsProvider);
    final statsNotifier = ref.read(statsProvider.notifier);

    DateTime now = DateTime.now();
    final exercisesThisWeek = statsNotifier.getExerciseStatsForWeek(now);
    final totalCaloriesBurnedThisWeek =
        statsNotifier.getTotalCaloriesBurnedForWeek(now);
    final totalCaloriesBurnedToday =
        statsNotifier.getTotalCaloriesBurnedForDay(now);
    final totalRoutinesCompletedToday =
        statsNotifier.getTotalRoutinesCompletedForDay(now);
    final totalExercisesCompletedToday =
        statsNotifier.getTotalExercisesCompletedForDay(now);

    return HomeLayout(
      title: 'Stats of your week',
      body: routineStats.isEmpty
          ? const Center(
              child: Text('No routines completed yet'),
            )
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: const Text('Total calories burned this week'),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: LinearProgressIndicator(
                            minHeight: 20,
                            borderRadius: BorderRadius.circular(10),
                            value: totalCaloriesBurnedThisWeek / 1000,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('$totalCaloriesBurnedThisWeek kCal'),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ListTile(
                  title: const Text('Daily progress'),
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                                'Calories burned: $totalCaloriesBurnedToday kCal'),
                            Text(
                                'Routines completed: $totalRoutinesCompletedToday'),
                            Text(
                                'Exercises completed: $totalExercisesCompletedToday'),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: CircularProgressIndicator(
                                value: totalCaloriesBurnedToday / 1000,
                                strokeWidth: 20,
                                strokeCap: StrokeCap.round,
                                backgroundColor: colorScheme.secondary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator(
                                value: totalRoutinesCompletedToday / 10,
                                strokeWidth: 20,
                                strokeCap: StrokeCap.round,
                                backgroundColor: colorScheme.secondary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(
                                value: totalExercisesCompletedToday / 10,
                                strokeWidth: 20,
                                strokeCap: StrokeCap.round,
                                backgroundColor: colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ExpansionTile(
                  title: Text("Routines completed this week"),
                  children: routineStats
                      .map((stat) => ListTile(
                            title: Text(stat.routine.name),
                            subtitle: Text(
                                'Calories burned: ${stat.caloriesBurned} kCal'),
                            trailing: Text(
                                DateFormat('dd/MM/yyyy').format(stat.endTime)),
                          ))
                      .toList(),
                ),
                SizedBox(height: 8),
                ExpansionTile(
                  title: Text("Exercises completed this week"),
                  children: exercisesThisWeek
                      .map((exerciseStat) => ListTile(
                            title: Text(exerciseStat.exercise.name),
                            subtitle: Text(
                                'Repetitions: ${exerciseStat.exercise.repetitions}, Duration: ${formatDuration(exerciseStat.duration.inSeconds)}'),
                          ))
                      .toList(),
                ),
              ],
            ),
    );
  }

  String formatDuration(int? seconds) {
    if (seconds == null) return 'N/A';
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes}m ${remainingSeconds}s';
  }
}
