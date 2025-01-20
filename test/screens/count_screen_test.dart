import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_golden_test/src/screens/count_screen.dart';
import 'package:my_golden_test/src/theme.dart';

import '../golden_test_helpers/device_builder.dart';
import '../golden_test_helpers/device_screen.dart';
import '../test_helpers/test_app.dart';

void main() {
  autoUpdateGoldenFiles = true;

  testWidgets('count_screen', (WidgetTester tester) async {
    DeviceBuilder.setUpDevice(tester: tester);

    await tester.pumpWidget(DeviceScreen(
        child: TestApp(
      screen: const CountScreen(),
      theme: myTheme,
    )));
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(MaterialApp).first,
      matchesGoldenFile('screenshots/count_screen.png'),
    );
  });
}
