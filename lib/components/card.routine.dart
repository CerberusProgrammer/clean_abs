import 'package:clean_abs/config/models/routine.dart';
import 'package:clean_abs/config/theme/text.theme.dart';
import 'package:flutter/material.dart';

class CardRoutine extends StatelessWidget {
  const CardRoutine({super.key, required this.routine, this.onTap});

  final Routine routine;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(routine.name, style: textTheme.titleLarge),
              Text(routine.description),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  Chip(label: Text('${routine.calories} kCal')),
                  Chip(
                      label: Text(routine.difficulty.name[0].toUpperCase() +
                          routine.difficulty.name.substring(1))),
                  Chip(label: Text('${routine.duration} min')),
                  ...routine.type.map((type) => Chip(
                      label: Text(
                          type.name[0].toUpperCase() + type.name.substring(1))))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
