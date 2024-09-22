import 'dart:async';
import 'package:clean_abs/animated_circular_progress.widget.dart';
import 'package:clean_abs/config/data/routines.dart';
import 'package:clean_abs/config/theme/color.theme.dart';
import 'package:flutter/material.dart';

class RoutineView extends StatefulWidget {
  final String id;

  const RoutineView({super.key, required this.id});

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> {
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
      appBar: AppBar(
        title: Text(routine.name),
        backgroundColor: colorScheme.primary,
      ),
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
            : Container(),
      ),
    );
  }
}
