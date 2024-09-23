import 'dart:async';
import 'package:clean_abs/components/animated_circular_progress.widget.dart';
import 'package:clean_abs/config/data/routines.dart';
import 'package:clean_abs/config/theme/color.theme.dart';
import 'package:clean_abs/pages/routines/routine.view.dart';
import 'package:flutter/material.dart';

class RoutineTimerView extends StatefulWidget {
  final String id;

  const RoutineTimerView({super.key, required this.id});

  @override
  State<RoutineTimerView> createState() => _RoutineTimerViewState();
}

class _RoutineTimerViewState extends State<RoutineTimerView> {
  int _counter = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routine = routines.firstWhere((routine) => routine.name == widget.id);

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: _counter > 0
            ? AnimatedCircularProgress(
                size: 300,
                color: Colors.white,
                backgroundColor: Colors.white.withOpacity(0.5),
                durationSeconds: 5,
                strokeWidth: 30.0,
                textSize: 48.0,
              )
            : RoutineView(routine: routine),
      ),
    );
  }
}
