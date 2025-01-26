import 'dart:ui';

class AppScreen {
  const AppScreen({
    required this.size,
  });

  final Size size;

  static const AppScreen smartPhone = AppScreen(
    size: Size(400, 800),
  );

  static const AppScreen web = AppScreen(
    size: Size(800, 600),
  );
}
