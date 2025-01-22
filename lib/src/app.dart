import 'package:flutter/material.dart';
import 'package:my_golden_test/src/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.home,
    this.theme,
  });

  final Widget home;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: theme ?? myTheme,
      home: home,
    );
  }
}
