import 'package:clean_abs/config/data/routines.dart';
import 'package:flutter/material.dart';

import 'components/card.routine.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Abs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: routines
            .map((routine) => CardRoutine(
                routine: routine,
                onTap: () =>
                    Navigator.pushNamed(context, '/routine/${routine.name}')))
            .toList(),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
