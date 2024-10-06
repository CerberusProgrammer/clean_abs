import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeLayout extends StatelessWidget {
  final String? title;
  final Widget? body;
  final Widget? floatingActionButton;

  const HomeLayout({
    super.key,
    this.body,
    this.title,
    this.floatingActionButton,
  });

  int getSelectedIndex(BuildContext context) {
    final route = GoRouter.of(context).routerDelegate.currentConfiguration;
    final fullPathRoute = route.fullPath;
    final location = fullPathRoute.split('?').first;

    switch (location) {
      case '/':
        return 0;
      case '/exercises':
        return 1;
      case '/stats':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Clean Abs'),
      ),
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: getSelectedIndex(context),
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/exercises');
              break;
            case 2:
              context.go('/stats');
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center),
            label: 'Exercises',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
