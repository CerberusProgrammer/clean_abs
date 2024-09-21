import 'dart:async';
import 'package:clean_abs/config/data/routines.dart';
import 'package:flutter/material.dart';

class RoutineView extends StatefulWidget {
  final String id;

  const RoutineView({super.key, required this.id});

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> {
  int _counter = 3;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
      ),
      body: PageView(
        children: [
          Container(
            color: Colors.red,
            child: Center(
              child: _counter > 0
                  ? AnimatedCircularProgress(
                      size: 300.0, // Customize the size
                      color: Colors.blue, // Customize the color
                      durationSeconds: 3, // Customize the duration
                    )
                  : Container(), // Empty container when counter is 0
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedCircularProgress extends StatefulWidget {
  final double size;
  final Color color;
  final int durationSeconds;

  const AnimatedCircularProgress({
    Key? key,
    this.size = 200.0,
    this.color = Colors.blue,
    this.durationSeconds = 3,
  }) : super(key: key);

  @override
  _AnimatedCircularProgressState createState() =>
      _AnimatedCircularProgressState();
}

class _AnimatedCircularProgressState extends State<AnimatedCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.durationSeconds),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: _controller.value,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(widget.color),
                  strokeWidth: 8.0,
                ),
                Text(
                  '${(widget.durationSeconds - (_controller.value * widget.durationSeconds)).round()}',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
