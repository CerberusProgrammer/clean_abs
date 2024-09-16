import 'package:clean_abs/config/theme/color.theme.dart';
import 'package:clean_abs/config/theme/text.theme.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: colorScheme.secondary,
  appBarTheme: AppBarTheme(
    backgroundColor: colorScheme.secondary,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: textTheme.displayMedium,
  ),
  textTheme: textTheme,
  cardTheme: CardTheme(
    color: colorScheme.primary,
    elevation: 0,
    margin: const EdgeInsets.all(0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: colorScheme.secondary,
    padding: const EdgeInsets.all(10),
    side: BorderSide.none,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    labelStyle: textTheme.titleSmall,
    secondaryLabelStyle: textTheme.titleSmall,
    brightness: Brightness.dark,
  ),
  colorScheme: colorScheme,
);
