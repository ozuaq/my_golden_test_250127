import 'package:flutter_test/flutter_test.dart';
import 'device.dart';

// TODO: テスト実装
class DeviceBuilder {
  static void setUpDevice(
      {required WidgetTester tester, Device device = Device.phone}) {
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    tester.view.physicalSize = device.size;
    tester.view.devicePixelRatio = device.devicePixelRatio;
  }
}
