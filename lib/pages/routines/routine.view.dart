import 'dart:async';
import 'package:clean_abs/components/animated_circular_progress.widget.dart';
import 'package:clean_abs/config/models/exercise_stat.dart';
import 'package:clean_abs/config/models/routine.dart';
import 'package:clean_abs/config/models/routine_stat.dart';
import 'package:clean_abs/providers/routine_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RoutineView extends ConsumerStatefulWidget {
  final Routine routine;

  const RoutineView({super.key, required this.routine});

  @override
  ConsumerState<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends ConsumerState<RoutineView> {
  int _currentExerciseIndex = 0;
  int _currentSet = 1;
  bool _isResting = false;
  late Timer _restTimer;
  late int _restTime;
  late DateTime _routineStartTime;
  late DateTime _routineEndTime;
  final List<ExerciseStat> _exerciseStats = [];
  late DateTime _exerciseStartTime;
  bool _showStartImage = true;
  late Timer _imageTimer;

  @override
  void initState() {
    super.initState();
    _restTime = widget.routine.restPerExercise ?? 0;
    _routineStartTime = DateTime.now();
    _exerciseStartTime = DateTime.now();
    _startImageTimer();
  }

  void _startImageTimer() {
    _imageTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _showStartImage = !_showStartImage;
      });
    });
  }

  void _nextExercise() {
    final exercise = widget.routine.exercises[_currentExerciseIndex];
    final exerciseEndTime = DateTime.now();
    final exerciseDuration = exerciseEndTime.difference(_exerciseStartTime);

    _exerciseStats.add(ExerciseStat(
      exercise: exercise,
      duration: exerciseDuration,
      startTime: _exerciseStartTime,
      endTime: exerciseEndTime,
    ));

    if (_currentExerciseIndex < widget.routine.exercises.length - 1) {
      setState(() {
        _currentExerciseIndex++;
        _isResting = true;
        _startRestTimer(widget.routine.restPerExercise ?? 0);
        _exerciseStartTime = DateTime.now();
      });
    } else if (_currentSet < widget.routine.sets) {
      setState(() {
        _currentExerciseIndex = 0;
        _currentSet++;
        _isResting = true;
        _startRestTimer(widget.routine.restPerSet ?? 0);
        _exerciseStartTime = DateTime.now();
      });
    } else {
      _routineEndTime = DateTime.now();
      final routineStat = RoutineStat(
        routine: widget.routine,
        exerciseStats: _exerciseStats,
        startTime: _routineStartTime,
        endTime: _routineEndTime,
        caloriesBurned: widget.routine.calories,
      );
      ref.read(routineStatsProvider.notifier).addRoutineStat(routineStat);
      context.go('/routine/${widget.routine.name}/complete',
          extra: routineStat);
    }
  }

  void _startRestTimer(int duration) {
    _restTime = duration;
    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_restTime > 0) {
          _restTime--;
        } else {
          _restTimer.cancel();
          _isResting = false;
        }
      });
    });
  }

  void _skipRest() {
    _restTimer.cancel();
    setState(() {
      _isResting = false;
    });
  }

  @override
  void dispose() {
    _restTimer.cancel();
    _imageTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercise = widget.routine.exercises[_currentExerciseIndex];

    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${widget.routine.name} - Set $_currentSet/${widget.routine.sets}'),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('About ${exercise.name}'),
                        content: Text(exercise.description),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      )),
            )
          ]),
      body: Center(
        child: _isResting
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Resting...',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$_restTime',
                    style: const TextStyle(fontSize: 48),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _skipRest,
                    child: const Text('Skip Rest'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    exercise.name,
                    style: const TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 20),
                  exercise.duration != null
                      ? AnimatedCircularProgress(
                          size: 200.0,
                          color: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          durationSeconds: exercise.duration!,
                          strokeWidth: 30.0,
                          textSize: 48.0,
                          onComplete: _nextExercise,
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40.0,
                                vertical: 30.0,
                              ),
                              child: _showStartImage
                                  ? exercise.startImage != null
                                      ? Image.asset(
                                          exercise.startImage!,
                                          height: 150,
                                        )
                                      : null
                                  : exercise.finalImage != null
                                      ? Image.asset(
                                          exercise.finalImage!,
                                          height: 150,
                                        )
                                      : null,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Repetitions: ${exercise.repetitions}',
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _nextExercise,
                              child: const Text('Continue'),
                            ),
                          ],
                        ),
                ],
              ),
      ),
    );
  }
}
