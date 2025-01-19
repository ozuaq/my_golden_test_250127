import 'package:flutter/material.dart';
import 'package:my_golden_test/src/app.dart';
import 'package:my_golden_test/src/theme.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    super.key,
    required this.screen,
  });

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    final testTheme = ThemeData(
      colorScheme: myTheme.colorScheme,
      useMaterial3: myTheme.useMaterial3,
    );

    return MyApp(
      screen: screen,
      theme: testTheme,
    );
  }
}
