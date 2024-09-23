import 'package:clean_abs/config/models/exercise_stat.dart';
import 'package:clean_abs/config/models/routine_stat.dart';
import 'package:clean_abs/config/theme/color.theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class RoutineCompleteView extends StatelessWidget {
  final RoutineStat routineStat;

  const RoutineCompleteView({super.key, required this.routineStat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routine Complete'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RoutineInfo(routineStat: routineStat),
          ),
        ),
        backgroundColor: colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExerciseStatsList(exerciseStats: routineStat.exerciseStats),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/'),
        child: const Icon(Icons.done),
      ),
    );
  }
}

class ExerciseStatsList extends StatelessWidget {
  final List<ExerciseStat> exerciseStats;

  const ExerciseStatsList({super.key, required this.exerciseStats});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exerciseStats.length,
      itemBuilder: (context, index) {
        final exerciseStat = exerciseStats[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            title: Text(exerciseStat.exercise.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Duration: ${exerciseStat.duration.inSeconds} seconds'),
                Text('Start Time: ${_formatDateTime(exerciseStat.startTime)}'),
                Text('End Time: ${_formatDateTime(exerciseStat.endTime)}'),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMM dd yyyy hh:mm a');
    return formatter.format(dateTime);
  }
}

class RoutineInfo extends StatelessWidget {
  final RoutineStat routineStat;

  const RoutineInfo({super.key, required this.routineStat});

  String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMM dd yyyy hh:mm a');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Duration: ${routineStat.totalDuration.inMinutes} minutes',
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            'Calories Burned: ${routineStat.caloriesBurned}',
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            'Start Time: ${_formatDateTime(routineStat.startTime)}',
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            'End Time: ${_formatDateTime(routineStat.endTime)}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      );
}
