import 'package:flutter/material.dart';

import 'test_theme.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    super.key,
    required this.screen,
    this.theme,
  });

  final Widget screen;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Golden Test',
      theme: theme ?? testTheme,
      home: screen,
    );
  }
}
