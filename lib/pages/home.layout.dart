import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  final Widget children;

  const HomeLayout({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Abs'),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
