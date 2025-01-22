import 'package:flutter_test/flutter_test.dart';
import '../test_helpers/test_app.dart';
import 'screen_size.dart';

class ScreenBuilder {
  static TestApp build(
      {required TestApp app, ScreenSize screenSize = ScreenSize.smartPhone}) {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    binding.window.physicalSizeTestValue = screenSize.size;
    binding.window.devicePixelRatioTestValue = 1.0;

    addTearDown(() {
      binding.window.clearPhysicalSizeTestValue();
      binding.window.clearDevicePixelRatioTestValue();
    });

    return app;
  }
}
