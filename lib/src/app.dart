import 'package:flutter/material.dart';
import 'package:my_golden_test/src/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.screen,
    this.theme,
  });

  final Widget screen;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden Test',
      theme: theme ?? myTheme,
      home: screen,
    );
  }
}
