// routine_complete_view.dart
import 'package:clean_abs/config/models/routine_stat.dart';
import 'package:flutter/material.dart';

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
              'Start Time: ${routineStat.startTime}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'End Time: ${routineStat.endTime}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Exercise Stats:',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: routineStat.exerciseStats.length,
                itemBuilder: (context, index) {
                  final exerciseStat = routineStat.exerciseStats[index];
                  return ListTile(
                    title: Text(exerciseStat.exercise.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Duration: ${exerciseStat.duration.inSeconds} seconds'),
                        Text('Start Time: ${exerciseStat.startTime}'),
                        Text('End Time: ${exerciseStat.endTime}'),
                      ],
                    ),
                  );
                },
              ),
            ),
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
