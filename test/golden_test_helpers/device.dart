import 'package:flutter/material.dart';

class Device {
  const Device({
    required this.size,
    required this.name,
    this.devicePixelRatio = 1.0,
    this.textScaleFactor = 1.0,
    this.brightness = Brightness.light,
    this.safeArea = const EdgeInsets.all(0),
  });

  static const Device smallPhone =
      Device(name: 'small_phone', size: Size(375, 667));

  static const Device iphone11 = Device(
    name: 'iphone11',
    size: Size(414, 896),
    devicePixelRatio: 1.0,
    safeArea: EdgeInsets.only(top: 44, bottom: 34),
  );

  static const Device iphone11Landscape = Device(
    name: 'iphone11_landscape',
    size: Size(896, 414),
    devicePixelRatio: 1.0,
    safeArea: EdgeInsets.only(left: 44, right: 34),
  );

  static const Device tabletLandscape =
      Device(name: 'tablet_landscape', size: Size(1366, 1024));

  static const Device tabletPortrait =
      Device(name: 'tablet_portrait', size: Size(1024, 1366));

  final String name;

  final Size size;

  final double devicePixelRatio;

  final double textScaleFactor;

  final Brightness brightness;

  final EdgeInsets safeArea;

  Device copyWith({
    Size? size,
    double? devicePixelRatio,
    String? name,
    double? textScale,
    Brightness? brightness,
    EdgeInsets? safeArea,
  }) {
    return Device(
      size: size ?? this.size,
      devicePixelRatio: devicePixelRatio ?? this.devicePixelRatio,
      name: name ?? this.name,
      textScaleFactor: textScale ?? textScaleFactor,
      brightness: brightness ?? this.brightness,
      safeArea: safeArea ?? this.safeArea,
    );
  }

  Device dark() {
    return Device(
      size: size,
      devicePixelRatio: devicePixelRatio,
      textScaleFactor: textScaleFactor,
      brightness: Brightness.dark,
      safeArea: safeArea,
      name: '${name}_dark',
    );
  }

  @override
  String toString() {
    return 'Device: $name, '
        '${size.width}x${size.height} @ $devicePixelRatio, '
        'text: $textScaleFactor, $brightness, safe: $safeArea';
  }
}
