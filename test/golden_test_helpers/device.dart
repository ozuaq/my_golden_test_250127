import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

class Device {
  const Device({
    required this.size,
    required this.devicePixelRatio,
  });

  final Size size;
  final double devicePixelRatio;

  static const Device phone = Device(
    size: Size(375, 812),
    devicePixelRatio: 1.0,
  );
}
