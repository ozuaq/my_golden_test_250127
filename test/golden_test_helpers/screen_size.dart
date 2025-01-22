import 'dart:ui';

class ScreenSize {
  const ScreenSize({
    required this.size,
  });

  final Size size;

  static const ScreenSize smartPhone = ScreenSize(
    size: Size(400, 800),
  );

  static const ScreenSize web = ScreenSize(
    size: Size(800, 600),
  );
}
