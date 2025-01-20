import 'package:flutter_test/flutter_test.dart';
import 'device.dart';
import 'golden_test_util.dart';

// TODO: テスト実装
class DeviceBuilder {
  static Future<void> setUpDevice(
      {required WidgetTester tester,
      Device device = Device.phone,
      bool isScreenshot = false}) async {
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await GoldenTestUtil.loadAssets(isScreenshot: isScreenshot);

    tester.view.physicalSize = device.size;
    tester.view.devicePixelRatio = device.devicePixelRatio;
  }
}
