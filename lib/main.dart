import 'package:expenses_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/color_schemes.g.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: lightColorScheme.primaryContainer,
        foregroundColor: lightColorScheme.onPrimaryContainer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColorScheme.primaryContainer,
          foregroundColor: darkColorScheme.onPrimaryContainer,
        ),
      ),
    ),
    darkTheme: ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      cardTheme:
          const CardTheme().copyWith(color: darkColorScheme.secondaryContainer),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColorScheme.primaryContainer,
          foregroundColor: darkColorScheme.onPrimaryContainer,
        ),
      ),
    ),
    home: const Expenses(),
  ));
}
