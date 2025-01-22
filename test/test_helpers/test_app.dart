import 'package:flutter/material.dart';
import 'package:my_golden_test/src/theme.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    super.key,
    required this.home,
    this.theme,
  });

  final Widget home;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Golden Test',
      theme: theme ?? myTheme,
      home: home,
    );
  }
}
