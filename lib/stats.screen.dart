import 'package:clean_abs/providers/routine_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineStats = ref.watch(routineStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stats'),
      ),
      body: routineStats.isEmpty
          ? const Center(
              child: Text('No routines completed yet'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: routineStats.length,
              itemBuilder: (context, index) {
                final routineStat = routineStats[index];
                return Card(
                  child: ListTile(
                    title: Text(routineStat.routine.name),
                    subtitle: Text(
                        'Completed on ${routineStat.endTime.toLocal().toString().split(' ')[0]}'),
                  ),
                );
              },
            ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (index) {
          if (index == 0) {
            context.go('/');
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
