import 'package:clean_abs/config/routes/routes.dart';
import 'package:clean_abs/config/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routerConfig: appRoutes,
    );
  }
}
