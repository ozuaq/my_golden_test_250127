import 'package:flutter/material.dart';

import '../test_helpers/test_app.dart';
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
        data: MediaQueryData(
          size: device.size,
          devicePixelRatio: device.devicePixelRatio,
          textScaler: TextScaler.linear(device.textScaleFactor),
          padding: device.safeArea,
          viewPadding: device.safeArea,
          viewInsets: EdgeInsets.zero,
          platformBrightness: device.brightness,
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            body: Center(
              child: SizedBox(
                width: device.size.width,
                height: device.size.height,
                child: appWidget,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
