import 'package:clean_abs/config/models/exercise_stat.dart';
import 'package:clean_abs/config/models/routine_stat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoutineCompleteView extends StatelessWidget {
  final RoutineStat routineStat;

  const RoutineCompleteView({super.key, required this.routineStat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoutineInfo(routineStat: routineStat),
            const SizedBox(height: 20),
            ExerciseStatsList(exerciseStats: routineStat.exerciseStats),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}

class ExerciseStatsList extends StatelessWidget {
  final List<ExerciseStat> exerciseStats;

  const ExerciseStatsList({super.key, required this.exerciseStats});

  String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMM dd yyyy hh:mm a');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
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
                  Text(
                      'Start Time: ${_formatDateTime(exerciseStat.startTime)}'),
                  Text('End Time: ${_formatDateTime(exerciseStat.endTime)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Routine: ${routineStat.routine.name}',
            style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 10),
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
}
