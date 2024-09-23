import 'package:clean_abs/config/data/routines.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/card.routine.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Abs'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: routines
                  .map((routine) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CardRoutine(
                            routine: routine,
                            onTap: () =>
                                context.go('/routine/${routine.name}')),
                      ))
                  .toList(),
            );
          } else {
            int columns = 2;
            if (constraints.maxWidth > 1000) {
              columns = 3;
            }
            if (constraints.maxWidth > 1400) {
              columns = 4;
            }
            if (constraints.maxWidth > 1800) {
              columns = 5;
            }

            final itemWidth =
                (constraints.maxWidth - (16 * (columns + 1))) / columns;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: routines.map((routine) {
                  return SizedBox(
                    width: itemWidth,
                    child: CardRoutine(
                      routine: routine,
                      onTap: () => context.go('/routine/${routine.name}'),
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          if (index == 1) {
            context.go('/stats');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
