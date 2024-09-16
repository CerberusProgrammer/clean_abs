import 'package:flutter/material.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Abs'),
      ),
      body: Column(
        children: [],
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
