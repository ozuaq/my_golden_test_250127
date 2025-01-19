import 'package:flutter/material.dart';

import 'device.dart';

class GoldenTestDevice extends StatelessWidget {
  const GoldenTestDevice({
    super.key,
    this.device = Device.iphone11,
    required this.appWidget,
  });

  final Device device;
  final Widget appWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          size: device.size,
          padding: device.safeArea,
          platformBrightness: device.brightness,
          textScaler: TextScaler.linear(device.textScaleFactor),
          devicePixelRatio: device.devicePixelRatio,
        ),
        child: SizedBox(
          height: device.size.height,
          width: device.size.width,
          child: appWidget,
        ),
      ),
    );
  }
}
