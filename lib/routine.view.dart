import 'package:clean_abs/config/data/routines.dart';
import 'package:flutter/material.dart';

class RoutineView extends StatefulWidget {
        final String id; 


  const RoutineView({super.key, required this.id});

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> {
  @override
  Widget build(BuildContext context) {
    final routine = routines.firstWhere((routine) => routine.name == widget.id);

    return  Scaffold(
      appBar: AppBar(
        title: Text(routine.name),
      ),
      body: Column(
        children: [],
      ),
      
    );
  }
}